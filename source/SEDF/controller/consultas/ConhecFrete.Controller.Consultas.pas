unit ConhecFrete.Controller.Consultas;

interface

uses
   Forms
  ,System.Classes
  ,System.SysUtils;

type
  IControllerConsultas = interface
  ['{8B3F3723-B3E3-42A3-BE46-C1E4C481F24B}']
    procedure OnClickConsulta(Sender :TObject);
  end;

  TControllerConsultas = class(TInterfacedObject, IControllerConsultas)
  private
    FCmpEditTexto :TForm;
    FCmpCabCadastro :TForm;
    FPanelConsultaPesq :TForm;

    procedure OnClickConsulta(Sender :TObject);
    procedure OnClickClearPesquisa(Sender :TObject);
  public
    class function New(pArrayFormsCte :array of TForm) :IControllerConsultas overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
    destructor Destroy; override;
  end;

implementation

uses
   LayoutPages.View.Componentes.TEditTexto
  ,LayoutPages.View.Componentes.PanelConsultaPesq
  ,LayoutPages.View.Componentes.CabecalhoCadastroPrincipal
  ,ConhecFrete.Model.Types.Constantes;

{ TControllerConsultas }

constructor TControllerConsultas.Create(pArrayFormsCte: array of TForm);
begin
  FCmpEditTexto   := pArrayFormsCte[Ord(tpCmpEditTexto)];
  FCmpCabCadastro := pArrayFormsCte[Ord(tpCmpCabCadastros)];
end;

destructor TControllerConsultas.Destroy;
begin
  inherited;
end;

class function TControllerConsultas.New(pArrayFormsCte: array of TForm): IControllerConsultas;
begin
  Result := Self.Create(pArrayFormsCte);
end;

procedure TControllerConsultas.OnClickClearPesquisa(Sender: TObject);
begin
  with TCmpEditTexto(FCmpEditTexto) do
  begin
    edtPesquisa.Text := EmptyStr;
    TCmpPanelConsultaPesq(FPanelConsultaPesq).Close;
    FreeAndNil(FPanelConsultaPesq);
    Show;
    edtPesquisa.SetFocus;
  end;
end;

procedure TControllerConsultas.OnClickConsulta(Sender: TObject);
begin
  FPanelConsultaPesq := TCmpPanelConsultaPesq.Create(nil);
  with TCmpCabCadastros(FCmpCabCadastro), TCmpPanelConsultaPesq(FPanelConsultaPesq) do
  begin
    Image1.OnClick := OnClickClearPesquisa;
    pnlPesquisa.Caption := TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text;

    case Length(UpperCase(TCmpEditTexto(FCmpEditTexto).edtPesquisa.Text)) of
        0..5: FPanelConsultaPesq.Width := 100;
       6..10: FPanelConsultaPesq.Width := 160;
      11..20: FPanelConsultaPesq.Width := 250;
      21..27: FPanelConsultaPesq.Width := 400;
      28..35: FPanelConsultaPesq.Width := 450;
    else
      FPanelConsultaPesq.Width := 550;
    end;
    TCmpEditTexto(FCmpEditTexto).Close;
    FPanelConsultaPesq.Parent := pnlRegiaoPesq;
    FPanelConsultaPesq.Show;
  end;
end;

end.
