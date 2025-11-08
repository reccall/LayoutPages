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


    //MenuCadastros
    procedure OnClickCadMarcas(Sender :TObject);
    procedure OnClickCadProdutos(Sender :TObject);
    procedure OnClickCadServicos(Sender :TObject);
    procedure OnClickCadClientes(Sender :TObject);
    procedure OnClickCadUnidMedida(Sender :TObject);
    procedure OnClickCadFornecedores(Sender :TObject);
    procedure OnClickCadTransportadoras(Sender :TObject);

    procedure OnClickCardUserInfo(Sender :TObject);
    procedure OnClickMenuCadastros(Sender :TObject);
    procedure OnClickMenuEmissaoFiscal(Sender :TObject);

    procedure CloseFormsMenuCadastros;
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
begin
  SetLength(aFormsCte,5);
  FFormOwner := pFormOwner;

  FCtePrincipal      := TfrmCtePrincipal.Create(nil);
  FMenuPrincipal     := TFormMenuPrincipal.Create(nil);
  FMenuCadastros     := TFormMenuCadastros.Create(nil);
  FCmpCardInfoUser   := TCmpCardInfoUserCte.Create(nil);
  FMenuEmissaoFiscal := TFormMenuEmissaoFiscal.Create(nil);

  FCmpTituloOpcao := TCmpTLabelTitulo.Create(nil);
  FCmpTituloOpcao.lblTitulo.Caption := 'Opções de emissão do CT-e';

  aFormsCte[IndexOwner]             := FCtePrincipal;
  aFormsCte[IndexMenuPrincipal]     := FMenuPrincipal;
  aFormsCte[IndexCmpTituloOpcao]    := FCmpTituloOpcao;
  aFormsCte[IndexMenuEmissaoFiscal] := FMenuEmissaoFiscal;

  FOpcoesCte := TfrmCteOpcoesInicio.Create(aFormsCte);
  with FCtePrincipal do
  begin
    pnlMainTopRight.Visible := False;
    FOpcoesCte.Parent := pnlMain;
    FCmpCardInfoUser.Parent := pnlUserInfo;
    FCmpTituloOpcao.Parent  := pnlMainTop;
  end;
end;

destructor TControllerPrincipal.Destroy;
begin
  inherited;
end;

procedure TControllerPrincipal.DestruirForms;
begin
  TFormCteBackground(FFormOwner).Close;
  FOpcoesCte.FController.DestruirForms;
  FreeAndNil(FOpcoesCte);

  FreeAndNil(FMenuPrincipal);
  FreeAndNil(FMenuCadastros);

  FreeAndNil(FCmpTituloOpcao);
  FreeAndNil(FMenuEmissaoFiscal);
  FCmpCardInfoUser.Close;
  FCtePrincipal.Close;
  with TFormCteBackground(FFormOwner) do
  begin
    FreeAndNil(FController);
  end;
  FreeAndNil(FCmpCardInfoUser);
  FreeAndNil(FCtePrincipal);
end;

procedure TControllerPrincipal.Iniciar;
begin
  FMenuPrincipal.pnlEmissor.Color := TColor($FAE6E6);
  FCmpCardInfoUser.lblUserName.Caption := 'KAMAYURI NUNES-SAAD';
  FCmpCardInfoUser.pnlUser.OnClick := OnClickCardUserInfo;

  with TFormCteBackground(FFormOwner)  do
  begin
    FCtePrincipal.Parent := pnlMain;
    Show;
  end;

  with FCtePrincipal do
  begin
    FMenuPrincipal.Parent  := pnlMenu;
  end;

  with FMenuPrincipal do
  begin
    pnlEmissor.OnClick   := OnClickMenuEmissaoFiscal;
    pnlCadastros.OnClick := OnClickMenuCadastros;
    FController.SetItemActive(pnlEmissor);
  end;

  with FMenuEmissaoFiscal do
  begin
    pnlCte.OnClick := FOpcoesCte.FController.OnClickInicioCte;
  end;

  with FMenuCadastros do
  begin
    pnlMarcas.OnClick     := OnClickCadMarcas;
    pnlFornec.OnClick     := OnClickCadFornecedores;
    pnlTransp.OnClick     := OnClickCadTransportadoras;
    pnlProdutos.OnClick   := OnClickCadProdutos;
    pnlServicos.OnClick   := OnClickCadServicos;
    pnlClientes.OnClick   := OnClickCadClientes;
    pnlUnidMedida.OnClick := OnClickCadUnidMedida;
  end;

  FOpcoesCte.Show;
  FCtePrincipal.Show;
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

procedure TControllerPrincipal.OnClickMenuCadastros(Sender: TObject);
begin
  FMenuCadastros.FControl := 0;
  FMenuEmissaoFiscal.Close;

  FMenuCadastros.Top    := FCtePrincipal.pnlMain.Top+100;
  FMenuCadastros.Left   := FCtePrincipal.pnlMenu.Left+FMenuPrincipal.pnlBackEmissor.Width+20;
  FMenuCadastros.BringToFront;
  FMenuCadastros.Show;
end;

procedure TControllerPrincipal.OnClickMenuEmissaoFiscal(Sender: TObject);
begin
  FMenuCadastros.FControl := 0;
  FMenuCadastros.Close;

  FMenuEmissaoFiscal.Top    := FCtePrincipal.pnlMain.Top+150;
  FMenuEmissaoFiscal.Left   := FCtePrincipal.pnlMenu.Left+FMenuPrincipal.pnlBackEmissor.Width + 20;
  FMenuEmissaoFiscal.BringToFront;
  FMenuEmissaoFiscal.Show;
end;

procedure TControllerPrincipal.OnClickCadProdutos(Sender: TObject);
begin
  with FMenuPrincipal do
  begin
    FController.SetItemActive(pnlCadastros);
  end;
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlProdutos.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadClientes(Sender: TObject);
begin
  with FMenuPrincipal do
  begin
    FController.SetItemActive(pnlCadastros);
  end;
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlClientes.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadServicos(Sender: TObject);
begin
  with FMenuPrincipal do
  begin
    FController.SetItemActive(pnlCadastros);
  end;
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlServicos.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadFornecedores(Sender: TObject);
begin
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlFornec.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadMarcas(Sender: TObject);
begin
  with FMenuPrincipal do
  begin
    FController.SetItemActive(pnlCadastros);
  end;
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlMarcas.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadTransportadoras(Sender: TObject);
begin
  with FMenuPrincipal do
  begin
    FController.SetItemActive(pnlCadastros);
  end;
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlTransp.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.OnClickCadUnidMedida(Sender: TObject);
begin
  with FMenuPrincipal do
  begin
    FController.SetItemActive(pnlCadastros);
  end;
  FCmpTituloOpcao.lblTitulo.Caption := FMenuCadastros.pnlUnidMedida.Caption;
  CloseFormsMenuCadastros;
end;

procedure TControllerPrincipal.CloseFormsMenuCadastros;
begin
  with FOpcoesCte do
  begin
    FController.CloseFormsMenuCadastros;
    Close;
  end;
  FMenuCadastros.Close;
end;

end.
