unit ConhecFrete.Forms.Cte.Motorista;

interface

uses
   Winapi.Windows
  ,Winapi.Messages
  ,System.SysUtils
  ,System.Variants
  ,System.Classes
  ,Data.DB
  ,Vcl.Graphics
  ,Vcl.Controls
  ,Vcl.Forms
  ,Vcl.Dialogs
  ,Vcl.ExtCtrls
  ,Vcl.StdCtrls
  ,cxGraphics
  ,cxControls
  ,cxLookAndFeels
  ,cxLookAndFeelPainters
  ,cxContainer
  ,cxEdit
  ,cxTextEdit
  ,ConhecFrete.Controller.Motorista
  ,LayoutPages.View.Forms.FormDefault;

type
  TfrmCteMotorista = class(TFormDefault)
    pnlTop: TPanel;
    pnlMain: TPanel;
    pnlEdtPesqMotorista: TPanel;
    pnlEdtUFPlaca: TPanel;
    pnlPlacaVeiculo: TPanel;
    pnlEdtPesqVeiculo: TPanel;

    procedure psqCodVeiculoContratanteAfterPesquisarEdit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FController :IControllerMototista;
  end;

implementation

{$R *.dfm}

procedure TfrmCteMotorista.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerMototista.New(Self);
end;

procedure TfrmCteMotorista.FormShow(Sender: TObject);
begin
  inherited;
  FController.Iniciar;
end;

procedure TfrmCteMotorista.psqCodVeiculoContratanteAfterPesquisarEdit(Sender: TObject);
//var
  //pFieldPlaca :TField;
begin
  {pFieldPlaca := dmInterfaces.psqVeiculos.DataSet.FindField('PLACA');
  case Assigned(pFieldPlaca) of
    True:  cxPlacaVeiculo.Text := pFieldPlaca.AsString;
    False: cxPlacaVeiculo.Clear;
  end;

  pFieldPlaca := dmInterfaces.psqVeiculos.DataSet.FindField('UFPLACAVEICULO');
  case Assigned(pFieldPlaca) of
    True:  UFPlacaVeiculo.Text := pFieldPlaca.AsString;
    False: UFPlacaVeiculo.Clear;
  end;}
end;

end.
