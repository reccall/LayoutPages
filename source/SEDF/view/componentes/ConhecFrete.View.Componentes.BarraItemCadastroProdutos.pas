unit ConhecFrete.View.Componentes.BarraItemCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, LayoutPages.View.Forms.FormDefault,
  Vcl.StdCtrls, Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TCmpBarraItemCadastroProdutos = class(TFormDefault)
    pnlMainCad: TPanel;
    lblCodigo: TLabel;
    lblDesc: TLabel;
    lblVl: TLabel;
    lblAtivo: TLabel;
    pnlLine: TPanel;
    imgEdit: TImage;
    imgTrash: TImage;
    imgIndice: TImage;
    chkItem: TCheckBox;
    procedure lblCodigoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblCodigoMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCmpBarraItemCadastroProdutos.lblCodigoMouseLeave(Sender: TObject);
begin
  inherited;
  if not chkItem.Checked then
    OnMouseLeaveItem(pnlMainCad);
end;

procedure TCmpBarraItemCadastroProdutos.lblCodigoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  OnMouseMoveItem(pnlMainCad,Shift,X,Y);
end;

end.
