unit LayoutPages.View.Componentes.FormGrid;

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
  ,Vcl.AppEvnts
  ,ConhecFrete.Controller.FormGrid
  ,LayoutPages.View.Forms.FormDefault;

type
  TCmpFormGrid = class(TFormDefault)
    pnlCmpGridTop: TPanel;
    pnlCmpGridMain: TPanel;
    scrlbxCmpMain: TScrollBox;
    ApplicationEvents1: TApplicationEvents;
    pnlLinha: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(pArrayFormsCte :array of TForm); reintroduce;

  end;

implementation

uses
  ConhecFrete.Model.Types.Constantes;

{$R *.dfm}

{ TCmpFormGrid }

constructor TCmpFormGrid.Create(pArrayFormsCte: array of TForm);
begin
  pArrayFormsCte[Ord(tpCmpFormGrid)] := Self;
  Inherited Create(nil);
end;


end.
