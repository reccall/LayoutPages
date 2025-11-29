unit ConhecFrete.Controller.Consultas;

interface

uses
   Forms
  ,Vcl.ExtCtrls
  ,System.Classes
  ,System.SysUtils
  ,ConhecFrete.Controller.FormGrid
  ,ConhecFrete.Controller.PesquisaNaoEncontrada;

type
  IControllerConsultas = interface
  ['{8B3F3723-B3E3-42A3-BE46-C1E4C481F24B}']
    procedure SetClearPesquisa;
    procedure AbrirFormCarregando;
    procedure SetNotFoundResults;
    procedure ResetComponentsItens(out pArrayItensConsulta :array of TForm);
    procedure SetFindResults;
    procedure OnClickConsulta(Sender :TObject);

    function SetParamsFormGrid(pCmpTitulo: TForm; pArrayItensConsulta :array of TForm) :IControllerConsultas;
  end;

  TControllerConsultas = class(TInterfacedObject, IControllerConsultas)
  private
    FCmpFormGrid :TForm;
    FCmpEditTexto :TForm;
    FCmpControlGrid :TForm;
    FCmpCabCadastro :TForm;
    FFormLoadingCSS :TForm;
    FormCteCadastros :TForm;
    FPanelConsultaPesq :TForm;

    FCmpTitulo: TForm;
    aItensConsulta :array of TForm;

    FControllerFormGrid :IControllerFormGrid;
    FControllerPesquisaNaoEncontrada :IControllerPesquisaNaoEncontrada;

    procedure SetClearPesquisa;
    procedure AbrirFormCarregando;
    procedure ResetComponentsItens(out pArrayItensConsulta :array of TForm);
    procedure SetFindResults;
    procedure SetNotFoundResults;

    procedure OnClickConsulta(Sender :TObject);
    procedure OnClickClearPesquisa(Sender :TObject);
    function SetParamsFormGrid(pCmpTitulo: TForm; pArrayItensConsulta :array of TForm) :IControllerConsultas;
  public
    class function New(pArrayFormsCte :array of TForm) :IControllerConsultas overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
    destructor Destroy; override;
  end;

implementation

uses
   LayoutPages.View.Forms.LoadingCSS
  ,LayoutPages.View.Forms.PesquisaNaoEcontrada
  ,LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.PanelConsultaPesq
  ,LayoutPages.View.Componentes.CabecalhoCadastroPrincipal
  ,ConhecFrete.Forms.Cte.Cadastros
  ,ConhecFrete.Model.Types.Constantes;

{ TControllerConsultas }

procedure TControllerConsultas.AbrirFormCarregando;
begin
  if not Assigned(FFormLoadingCSS) then
   FFormLoadingCSS := aFormsCte[Ord(tpFormLoadingCSS)];

  with TFormCteCadastros(FormCteCadastros) do
  begin
    TFormLoadCSS(FFormLoadingCSS).Parent := pnlMain;
    TFormLoadCSS(FFormLoadingCSS).Show;
  end;
end;

constructor TControllerConsultas.Create(pArrayFormsCte: array of TForm);
begin
  FCmpFormGrid     := pArrayFormsCte[Ord(tpCmpFormGrid)];
  FCmpEditTexto    := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpControlGrid  := pArrayFormsCte[Ord(tpCmpControlGrid)];
  FCmpCabCadastro  := pArrayFormsCte[Ord(tpCmpCabCadastros)];
  FormCteCadastros := pArrayFormsCte[Ord(tpCteCadastros)];
  FControllerFormGrid := TControllerFormGrid.New(pArrayFormsCte);
  FControllerPesquisaNaoEncontrada := TControllerPesquisaNaoEncontrada.New(pArrayFormsCte);
end;

destructor TControllerConsultas.Destroy;
var
  iIdx :Integer;
begin
  for iIdx := Low(aItensConsulta) to High(aItensConsulta) do
  begin
    aItensConsulta[iIdx] := nil;
  end;
  aItensConsulta := nil;
  FControllerFormGrid := nil;
  FControllerPesquisaNaoEncontrada := nil;
  inherited;
end;

class function TControllerConsultas.New(pArrayFormsCte: array of TForm): IControllerConsultas;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerConsultas.OnClickClearPesquisa(Sender: TObject);
begin
  SetClearPesquisa;
end;

procedure TControllerConsultas.OnClickConsulta(Sender: TObject);
begin
  if Assigned(FPanelConsultaPesq) then
    FreeAndNil(FPanelConsultaPesq);

  FPanelConsultaPesq := TCmpPanelConsultaPesq.Create(nil);

  with TCmpCabCadastros(FCmpCabCadastro), TCmpPanelConsultaPesq(FPanelConsultaPesq) do
  begin
    Image1.OnClick := OnClickClearPesquisa;
    pnlPesquisa.Caption := TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text;

    case Length(UpperCase(TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text)) of
        0..5: FPanelConsultaPesq.Width := 100;
       6..10: FPanelConsultaPesq.Width := 170;
      11..20: FPanelConsultaPesq.Width := 270;
      21..27: FPanelConsultaPesq.Width := 400;
      28..35: FPanelConsultaPesq.Width := 450;
    else
      FPanelConsultaPesq.Width := 550;
    end;
    TCmpEditTexto(FCmpEditTexto).Close;
    FPanelConsultaPesq.Parent := pnlRegiaoPesq;
    FPanelConsultaPesq.Show;
    FCmpControlGrid.Close;
    FCmpFormGrid.Close;
  end;
end;

procedure TControllerConsultas.ResetComponentsItens(out pArrayItensConsulta :array of TForm);
var
  iIdx :Integer;
begin
  for iIdx := Low(pArrayItensConsulta) to High(pArrayItensConsulta) do
  begin
    FreeAndNil(pArrayItensConsulta[iIdx]);
  end;
end;

procedure TControllerConsultas.SetClearPesquisa;
begin
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.Text := EmptyStr;
    if Assigned(FPanelConsultaPesq) then
    begin
      TCmpPanelConsultaPesq(FPanelConsultaPesq).Close;
      FreeAndNil(FPanelConsultaPesq);
    end;
    Show;
    edtPesquisa.SetFocus;
  end;
end;

procedure TControllerConsultas.SetFindResults;
begin
  FControllerFormGrid.SetItensGrid(FCmpTitulo, aItensConsulta);
  FCmpControlGrid.Show;
end;

procedure TControllerConsultas.SetNotFoundResults;
begin
  FControllerPesquisaNaoEncontrada.Iniciar;
end;

function TControllerConsultas.SetParamsFormGrid(pCmpTitulo: TForm;
  pArrayItensConsulta: array of TForm): IControllerConsultas;
var
  iIdx :Integer;
begin
  Result := Self;
  FCmpTitulo := pCmpTitulo;
  SetLength(aItensConsulta, Length(pArrayItensConsulta));
  for iIdx := Low(pArrayItensConsulta) to High(pArrayItensConsulta) do
  begin
    aItensConsulta[iIdx] := pArrayItensConsulta[iIdx];
  end;
end;

end.
