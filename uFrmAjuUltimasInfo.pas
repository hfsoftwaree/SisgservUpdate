unit uFrmAjuUltimasInfo;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  jpeg,
  ExtCtrls,
  ComCtrls,
  Buttons;

type
  TfrmAjuUltimasInfo = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjuUltimasInfo: TfrmAjuUltimasInfo;

implementation

{$R *.dfm}

procedure TfrmAjuUltimasInfo.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
