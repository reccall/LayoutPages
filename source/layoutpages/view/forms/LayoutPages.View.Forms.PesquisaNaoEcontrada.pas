unit LayoutPages.View.Forms.PesquisaNaoEcontrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, LayoutPages.View.Forms.FormDefault,
  Vcl.StdCtrls;

type
  TFormPesquisaNaoEncontrada = class(TFormDefault)
    lblInfo: TLabel;
    lblPesquisa: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
