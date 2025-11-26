unit ConhecFrete.Controller.FormGrid;

interface

uses
   Forms
  ,System.Classes
  ,System.SysUtils
  ,ConhecFrete.Model.Types.Constantes;

type
  IControllerFormGrid = interface
  ['{6D37E6C5-F4F7-402D-8D9B-A23BD19797D2}']
    procedure Iniciar;
    function SetActiveForm(pParam :TpForms) :IControllerFormGrid;
    procedure SetItensGrid(pCmpTitulo :TForm; pCmpItensFormGrid :array of TForm);
  end;

  TControllerFormGrid = class(TInterfacedObject, IControllerFormGrid)
  private
    FCmpFormGrid :TForm;
    FCteCadastros :TForm;
    FActiveForm :TpForms;

    procedure Iniciar;
    procedure SetItensGrid(pCmpTitulo :TForm; pCmpItensFormGrid :array of TForm);
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

constructor TControllerFormGrid.Create(pArrayFormsCte: array of TForm);
begin
  FCmpFormGrid := pArrayFormsCte[Ord(tpCmpFormGrid)]
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

procedure TControllerFormGrid.SetItensGrid(pCmpTitulo :TForm; pCmpItensFormGrid :array of TForm);
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
