unit ConhecFrete.Controller.FormGrid;

interface

uses
   Forms
  ,Windows
  ,Vcl.AppEvnts
  ,Winapi.Messages
  ,System.Classes
  ,System.SysUtils
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerFormGrid = interface
  ['{6D37E6C5-F4F7-402D-8D9B-A23BD19797D2}']
    procedure Iniciar;
    procedure SetItensGrid(pCmpTitulo :TForm; out pCmpItensFormGrid :array of TForm);

    function SetActiveForm(pParam :TpForms) :IControllerFormGrid;
  end;

  TControllerFormGrid = class(TInterfacedObject, IControllerFormGrid)
  private
    FPosition :Integer;
    FCmpFormGrid :TForm;
    FCteCadastros :TForm;
    FActiveForm :TpForms;

    procedure Iniciar;
    procedure SetItensGrid(pCmpTitulo :TForm; out pCmpItensFormGrid :array of TForm);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);

    function SetActiveForm(pParam :TpForms) :IControllerFormGrid;
  public
    class function New(pArrayFormsCte :array of TForm) :IControllerFormGrid overload;
    constructor Create(pArrayFormsCte :array of TForm); overload;
    destructor Destroy; override;
  end;

implementation

uses
   ConhecFrete.Forms.Cte.Cadastros
  ,LayoutPages.View.Componentes.FormGrid;


{ TControllerFormGrid }

procedure TControllerFormGrid.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
  i: SmallInt;
begin
  inherited;
  with TCmpFormGrid(aFormsCte[Ord(tpCmpFormGrid)]) do
  begin
    case Msg.message of

      WM_MOUSEWHEEL:
      begin
        FPosition := scrlbxCmpMain.VertScrollBar.Position;
        Msg.message := WM_KEYDOWN;
        Msg.lParam := 0;
        i := HiWord(Msg.wParam) ;
        if i > 0 then
        begin
          Msg.wParam := VK_UP;
          Dec(FPosition,20);
        end
        else
        begin
          Msg.wParam := VK_DOWN;
          Inc(FPosition,20);
        end;
        Handled := False;

        scrlbxCmpMain.VertScrollBar.Position := FPosition;
      end;
    end;
  end;
end;

constructor TControllerFormGrid.Create(pArrayFormsCte: array of TForm);
begin
  if not Assigned(aFormsCte[Ord(tpCmpFormGrid)]) then
  begin
    aFormsCte[Ord(tpCmpFormGrid)] := TCmpFormGrid.Create(pArrayFormsCte);
    with TCmpFormGrid(aFormsCte[Ord(tpCmpFormGrid)]) do
    begin
      ApplicationEvents1.OnMessage := ApplicationEvents1Message;
    end;
  end;
  FCmpFormGrid := aFormsCte[Ord(tpCmpFormGrid)];
end;

destructor TControllerFormGrid.Destroy;
begin

  inherited;
end;

procedure TControllerFormGrid.Iniciar;
begin
  with TCmpFormGrid(FCmpFormGrid) do
  begin
    Show;
  end;
end;

class function TControllerFormGrid.New(pArrayFormsCte: array of TForm): IControllerFormGrid;
begin
  Result := Self.Create(pArrayFormsCte);
end;

function TControllerFormGrid.SetActiveForm(pParam: TpForms): IControllerFormGrid;
begin
  Result := Self;
  FActiveForm := pParam;
end;

procedure TControllerFormGrid.SetItensGrid(pCmpTitulo :TForm; out pCmpItensFormGrid :array of TForm);
var
  iIdx :Integer;
begin
  if not Assigned(FCteCadastros) then
    FCteCadastros := aFormsCte[Ord(tpCteCadastros)];

  with TFormCteCadastros(FCteCadastros), TCmpFormGrid(FCmpFormGrid) do
  begin
    MakeRounded(pCmpTitulo,10);
    TCmpFormGrid(FCmpFormGrid).Parent := pnlMain;
    pCmpTitulo.Parent := pnlCmpGridTop;
    for iIdx := Low(pCmpItensFormGrid) to High(pCmpItensFormGrid) do
    begin
      pCmpItensFormGrid[iIdx].Parent := scrlbxCmpMain;
      pCmpItensFormGrid[iIdx].Show;
    end;
    FCmpFormGrid.Show;
    pCmpTitulo.Visible := True;
    pCmpTitulo.Show;
  end;
end;

end.
