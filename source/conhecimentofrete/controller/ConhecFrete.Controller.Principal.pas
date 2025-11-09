unit ConhecFrete.Controller.Principal;

interface

uses
   Classes
  ,Windows
  ,Vcl.Forms
  ,Vcl.ExtCtrls
  ,Vcl.Graphics
  ,System.SysUtils
  ,LayoutPages.View.Componentes.TLabelTitulo
  ,ConhecFrete.View.Componentes.CardInfoUserCte
  ,ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.Forms.Cte.OpcoesInicio
  ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
  ,ConhecFrete.Forms.Cte.MenuPrincipal
  ,ConhecFrete.Forms.Cte.MenuCadastros
  ,ConhecFrete.Model.Types.Constantes
  ,ConhecFrete.Controller.OpcoesInicio;

type
  IControllerPrincipal = interface
  ['{16BD8EB4-2BEE-4896-BC57-6FE1F1DDB8F8}']
    procedure Iniciar;
  end;

  TControllerPrincipal = class(TInterfacedObject, IControllerPrincipal)
  private
    FOpcaoCteAtive :TpOpcaoCte;
    FFormOwner: TForm;
    FOpcoesCte :TfrmCteOpcoesInicio;
    FCmpTituloOpcao :TCmpTLabelTitulo;
    FCmpCardInfoUser :TCmpCardInfoUserCte;
    FMenuCadastros :TFormMenuCadastros;

    procedure OnClickCardUserInfo(Sender :TObject);
  public
    FCtePrincipal :TfrmCtePrincipal;
    FMenuPrincipal :TFormMenuPrincipal;
    FMenuEmissaoFiscal :TFormMenuEmissaoFiscal;

    procedure Iniciar;
    procedure DestruirForms;

  class function New(pFormOwner :TForm) :IControllerPrincipal; overload;
    constructor Create(pFormOwner :TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Background;

{ ControllerPrincipal }

constructor TControllerPrincipal.Create(pFormOwner: TForm);
var
  SetTyperForms:TpForms;
  iIdx :Integer;
begin
  FFormOwner := pFormOwner;
  SetTyperForms := High(TpForms);
  SetLength(aFormsCte, Ord(SetTyperForms));

  FCmpCardInfoUser := TCmpCardInfoUserCte.Create(nil);

  FCtePrincipal := TfrmCtePrincipal.Create(nil);
  aFormsCte[Ord(tpOwner)] := FCtePrincipal;
  
  FCmpTituloOpcao := TCmpTLabelTitulo.Create(nil);
  aFormsCte[Ord(tpCmpTitulo)] := FCmpTituloOpcao;

  FMenuEmissaoFiscal := TFormMenuEmissaoFiscal.Create(aFormsCte);
  aFormsCte[Ord(tpMenuEmissaoFiscal)] := FMenuEmissaoFiscal;

  FOpcoesCte := TfrmCteOpcoesInicio.Create(aFormsCte);
  aFormsCte[Ord(tpFormCte)] := FOpcoesCte;

  FMenuCadastros  := TFormMenuCadastros.Create(aFormsCte);
  aFormsCte[Ord(tpMenuCadastros)] := FMenuCadastros;

  FMenuPrincipal := TFormMenuPrincipal.Create(aFormsCte);
  aFormsCte[Ord(tpMenuPrincipal)] := FMenuPrincipal;

  with FCtePrincipal do
  begin
    pnlMainTopRight.Visible := False;
    FCmpCardInfoUser.Parent := pnlUserInfo;
    FCmpTituloOpcao.Parent  := pnlMainTop;
  end;
end;

destructor TControllerPrincipal.Destroy;
begin
  FreeAndNil(TFormCteBackground(FFormOwner).FController);
  inherited;
end;

procedure TControllerPrincipal.DestruirForms;
begin
  TFormCteBackground(FFormOwner).Close;
  aFormsCte := nil;
  FOpcoesCte.FController.DestruirForms;
  FreeAndNil(FOpcoesCte.FController);
  FreeAndNil(FOpcoesCte);
  FreeAndNil(FMenuCadastros);
  FreeAndNil(FMenuEmissaoFiscal);
  FreeAndNil(FCmpTituloOpcao);
  FCmpCardInfoUser.Close;
  FreeAndNil(FCmpCardInfoUser);
  FreeAndNil(FMenuPrincipal);
  FCtePrincipal.Close;
  FreeAndNil(FCtePrincipal);
end;

procedure TControllerPrincipal.Iniciar;
begin
  with FCmpCardInfoUser do
  begin
    lblUserName.Caption := 'KAMAYURI NUNES-SAAD';
    pnlUser.OnClick := OnClickCardUserInfo;
  end;

  FCmpTituloOpcao.lblTitulo.Caption := 'SEDF - Início';

  with TFormCteBackground(FFormOwner)  do
  begin
    FCtePrincipal.Parent := pnlMain;
    Show;
  end;

  with FCtePrincipal do
  begin
    FMenuPrincipal.Parent := pnlMenu;
    Show;
  end;
  FCmpCardInfoUser.Show;
  FCmpTituloOpcao.Show;
  FMenuPrincipal.Show;
end;

class function TControllerPrincipal.New(pFormOwner: TForm): IControllerPrincipal;
begin
  Result := Self.Create(pFormOwner);
end;

procedure TControllerPrincipal.OnClickCardUserInfo(Sender: TObject);
begin
  DestruirForms;
end;

end.
