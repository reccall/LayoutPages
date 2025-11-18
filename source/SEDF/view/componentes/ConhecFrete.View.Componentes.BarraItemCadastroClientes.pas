unit ConhecFrete.View.Componentes.BarraItemCadastroClientes;

interface

uses
   Winapi.Windows
  ,Winapi.Messages
  ,System.SysUtils
  ,System.StrUtils
  ,System.Variants
  ,System.Classes
  ,Vcl.Graphics
  ,Vcl.Controls
  ,Vcl.Forms
  ,Vcl.ExtCtrls
  ,Vcl.Dialogs
  ,Vcl.StdCtrls
  ,dxGDIPlusClasses
  ,LayoutPages.View.Forms.FormDefault;


type
  TCmpBarraItemClientes = class(TFormDefault)
    pnlMainCad: TPanel;
    lblCodigo: TLabel;
    lblDesc: TLabel;
    lblAtivo: TLabel;
    imgEdit: TImage;
    imgTrash: TImage;
    imgIndice: TImage;
    pnlLine: TPanel;
    chkItem: TCheckBox;
    procedure lblCodigoMouseLeave(Sender: TObject);
    procedure lblCodigoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCmpBarraItemClientes.lblCodigoMouseLeave(Sender: TObject);
begin
  inherited;
    if not chkItem.Checked then
    OnMouseLeaveItem(pnlMainCad);
end;

procedure TCmpBarraItemClientes.lblCodigoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  OnMouseMoveItem(pnlMainCad,Shift,X,Y);
end;

end.
