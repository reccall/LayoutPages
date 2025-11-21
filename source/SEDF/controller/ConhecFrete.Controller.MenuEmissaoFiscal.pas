unit ConhecFrete.Controller.MenuEmissaoFiscal;

interface

uses
   Forms
  ,Math
  ,Graphics
  ,System.SysUtils
  ,System.UITypes
  ,Vcl.ExtCtrls
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerMenuEmissaoFiscal = interface
  ['{58308178-912B-4AC8-8AF0-A7EF97C05D2C}']
    procedure Iniciar;
    procedure SetOpcaoMenuItem(pPanel :TPanel);
  end;

  TControllerMenuEmissaoFiscal = class(TInterfacedObject, IControllerMenuEmissaoFiscal)
  private
    FFormCte   :TForm;
    FCtePrincipal :TForm;
    FMenuPrincipal :TForm;
    FMenuCadastros :TForm;
    FOpcoesCteItens :TForm;
    FCmpTituloOpcao :TForm;
    FMenuItensImagens :TForm;
    FMenuEmissaoFiscal :TForm;
    FSetOpcaoItemMenu :TPanel;

    procedure Iniciar;
    procedure SetOpcaoMenuItem(pPanel :TPanel);

    procedure OnClickInicioNFe(Sender :TObject);
    procedure OnClickInicioNFCe(Sender :TObject);
    procedure OnClickInicioCte(Sender :TObject);
    procedure OnClickInicioNFSe(Sender :TObject);
    procedure OnFormMouseLeave(Sender: TObject);
    procedure OnMouseLeaveItemN(Sender :TObject);

    procedure CloseForms(pParam :TpOpcaoMenuEmissaoFis);
    function GetFormMenuCadastros :TForm;
    procedure IniciarAmbiente(pSender :TObject);
  public
  class function New(pArrayForms: array of TForm) :IControllerMenuEmissaoFiscal overload;
    constructor Create(pArrayForms: array of TForm); overload;
     destructor Destroy; override;
end;

implementation

uses
   ConhecFrete.Forms.Cte.Principal
  ,ConhecFrete.Forms.Cte.OpcoesItens
  ,ConhecFrete.Forms.Cte.OpcoesInicio
  ,ConhecFrete.Forms.Cte.MenuPrincipal
  ,ConhecFrete.Forms.Cte.MenuCadastros
  ,ConhecFrete.Forms.Cte.MenuEmissaoFiscal
  ,ConhecFrete.Forms.Cte.MenuItensImagens
  ,ConhecFrete.Forms.Cte.Cadastros
  ,LayoutPages.View.Componentes.TLabelTitulo;

{ TControllerMenuEmissaoFiscal }

procedure TControllerMenuEmissaoFiscal.CloseForms(pParam :TpOpcaoMenuEmissaoFis);
begin
  if Assigned(aFormsCte[Ord(tpCteCadastros)]) then
  begin
    with TFormCteCadastros(aFormsCte[Ord(tpCteCadastros)]) do
    begin
      if Showing then
      begin
        FController.SetFormOwner(tpFDefault);
        FController.ResetComponentsItens;
        aFormsCte[Ord(tpCmpCabCadastros)].Close;
        Close;
      end;
    end;
  end;

  case pParam of
    tpMenuNFe:
    begin
      if Assigned(FFormCte) then
      begin
        if FFormCte.Showing then
          FFormCte.Close;
      end;

      if Assigned(FOpcoesCteItens) then
      begin
        FOpcoesCteItens.Close;
      end;
    end;
    tpMenuNFCe:
    begin
      if Assigned(FFormCte) then
      begin
        if FFormCte.Showing then
          FFormCte.Close;
      end;

      if Assigned(FOpcoesCteItens) then
      begin
        FOpcoesCteItens.Close;
      end;
    end;

    tpMenuNFSe:
    begin
      if Assigned(FFormCte) then
      begin
        if FFormCte.Showing then
          FFormCte.Close;
      end;

      if Assigned(FOpcoesCteItens) then
      begin
        FOpcoesCteItens.Close;
      end;
    end;
    tpOpcaoMenuCte:; //Ainda não implementado
  end;

end;

constructor TControllerMenuEmissaoFiscal.Create(pArrayForms :array of TForm);
begin
  FFormCte          := pArrayForms[Ord(tpFormCte)];
  FCtePrincipal     := pArrayForms[Ord(tpOwner)];
  FMenuPrincipal    := pArrayForms[Ord(tpMenuPrincipal)];
  FCmpTituloOpcao   := pArrayForms[Ord(tpCmpTitulo)];
  FOpcoesCteItens   := pArrayForms[Ord(tpFormOpcoesItensCte)];
  FMenuItensImagens := pArrayForms[Ord(tpMenuItensImagens)];
  if not Assigned(FMenuItensImagens) then
  begin
    FMenuItensImagens := TFormMenuItensImagens.Create(aFormsCte);
    aFormsCte[Ord(tpMenuItensImagens)] := FMenuItensImagens;
  end;
end;

destructor TControllerMenuEmissaoFiscal.Destroy;
begin
  inherited;
end;

function TControllerMenuEmissaoFiscal.GetFormMenuCadastros: TForm;
begin
  Result := FMenuCadastros;
  if not Assigned(FMenuCadastros) then
    Result := aFormsCte[Ord(tpMenuCadastros)];
end;

procedure TControllerMenuEmissaoFiscal.Iniciar;
begin
  if not Assigned(FMenuEmissaoFiscal) then
  begin
    FMenuEmissaoFiscal := aFormsCte[Ord(tpMenuEmissaoFiscal)];
  end;
  with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
  begin
    pnlCte.OnClick       := OnClickInicioCte;
    pnlCte.OnMouseMove   := OnMouseMoveItem;
    pnlCte.OnMouseLeave  := OnMouseLeaveItemN;
    pnlNFe.OnClick       := OnClickInicioNFe;
    pnlNFe.OnMouseMove   := OnMouseMoveItem;
    pnlNFe.OnMouseLeave  := OnMouseLeaveItemN;
    pnlNFCe.OnClick      := OnClickInicioNFCe;
    pnlNFCe.OnMouseMove  := OnMouseMoveItem;
    pnlNFCe.OnMouseLeave := OnMouseLeaveItemN;
    pnlNFSe.OnClick      := OnClickInicioNFSe;
    pnlNFSe.OnMouseMove  := OnMouseMoveItem;
    pnlNFSe.OnMouseLeave := OnMouseLeaveItemN;

    OnMouseLeave := OnFormMouseLeave;
    Show;
  end;
end;

procedure TControllerMenuEmissaoFiscal.IniciarAmbiente(pSender :TObject);
begin
  CloseForms(tpMenuNFCe);
  with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
  begin
    if TPanel(pSender).Name = 'pnlNFCe' then
      SetOpcaoMenuItem(pnlNFCe)
    else
    if TPanel(pSender).Name = 'pnlCte' then
      SetOpcaoMenuItem(pnlCte)
    else
    if TPanel(pSender).Name = 'pnlNFe' then
      SetOpcaoMenuItem(pnlNFe)
    else
    if TPanel(pSender).Name = 'pnlNFSe' then
      SetOpcaoMenuItem(pnlNFSe);

    Close;
  end;

  FMenuCadastros := GetFormMenuCadastros;
  if Assigned(FMenuCadastros) then
  begin
    with TFormMenuCadastros(FMenuCadastros) do
    begin
      FController.SetOpcaoMenuItemCad(TPanel(pSender));
    end;
  end;

  if not Assigned(FMenuPrincipal) then
  begin
    FMenuPrincipal := aFormsCte[Ord(tpMenuPrincipal)];
  end;

  with TFormMenuPrincipal(FMenuPrincipal) do
  begin
    FController.SetItemActive(pnlEmissor);
  end;

  with TFormMenuItensImagens(FMenuItensImagens) do
  begin
    FController.SetActiveImage(ImgEmissaoFiscal);
  end;
end;

class function TControllerMenuEmissaoFiscal.New(pArrayForms: array of TForm): IControllerMenuEmissaoFiscal;
begin
  Result := Self.Create(pArrayForms);
end;

procedure TControllerMenuEmissaoFiscal.OnClickInicioCte(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    IniciarAmbiente(Sender);

    if not Assigned(aFormsCte[Ord(tpFormCte)]) then
    begin
      aFormsCte[Ord(tpFormCte)] := TfrmCteOpcoesInicio.Create(aFormsCte);
      FFormCte := aFormsCte[Ord(tpFormCte)];
    end;

    if (FFormCte.Showing) then
    begin
      Exit;
    end
    else
    if Assigned(FOpcoesCteItens) then
    begin
      if FOpcoesCteItens.Showing then
        Exit;
    end;

    with TfrmCtePrincipal(FCtePrincipal), TCmpTLabelTitulo(FCmpTituloOpcao) do
    begin
      pnlMainTopRight.Visible := False;
      lblTitulo.Caption := 'Opções de emissão do CT-e';
    end;

    if not Assigned(FOpcoesCteItens) then
    begin
      FOpcoesCteItens := aFormsCte[Ord(tpFormOpcoesItensCte)];

      if not Assigned(FOpcoesCteItens) then
        Exit;
    end;
    FOpcoesCteItens.Close;
    TfrmCteOpcoesInicio(FFormCte).FController.Iniciar;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TControllerMenuEmissaoFiscal.OnClickInicioNFCe(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    IniciarAmbiente(Sender);
    with TfrmCtePrincipal(FCtePrincipal), TCmpTLabelTitulo(FCmpTituloOpcao) do
    begin
      pnlMainTopRight.Visible := False;
      lblTitulo.Caption := 'Opções de emissão do NFC-e';
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TControllerMenuEmissaoFiscal.OnClickInicioNFe(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    IniciarAmbiente(Sender);
    with TfrmCtePrincipal(FCtePrincipal), TCmpTLabelTitulo(FCmpTituloOpcao) do
    begin
      pnlMainTopRight.Visible := False;
      lblTitulo.Caption := 'Opções de emissão do NF-e';
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TControllerMenuEmissaoFiscal.OnClickInicioNFSe(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    IniciarAmbiente(Sender);
    with TfrmCtePrincipal(FCtePrincipal), TCmpTLabelTitulo(FCmpTituloOpcao) do
    begin
      pnlMainTopRight.Visible := False;
      lblTitulo.Caption := 'Opções de emissão do NFS-e';
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TControllerMenuEmissaoFiscal.OnFormMouseLeave(Sender: TObject);
begin
  with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
  begin
    Close;
  end;
end;

procedure TControllerMenuEmissaoFiscal.OnMouseLeaveItemN(Sender: TObject);
begin
  if FSetOpcaoItemMenu <>  TPanel(Sender) then
    TPanel(Sender).Color := clWhite;
end;

procedure TControllerMenuEmissaoFiscal.SetOpcaoMenuItem(pPanel: TPanel);
begin
  FSetOpcaoItemMenu := pPanel;

  with TFormMenuEmissaoFiscal(FMenuEmissaoFiscal) do
  begin
    pnlCte.Color  := IfThen(FSetOpcaoItemMenu = pnlCte,TColor($FAE6E6), clWhite);
    pnlNFe.Color  := IfThen(FSetOpcaoItemMenu = pnlNFe,TColor($FAE6E6), clWhite);
    pnlNFCe.Color := IfThen(FSetOpcaoItemMenu = pnlNFCe,TColor($FAE6E6), clWhite);
    pnlNFSe.Color := IfThen(FSetOpcaoItemMenu = pnlNFSe,TColor($FAE6E6), clWhite);
  end;
end;

end.
