unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TAboutForm = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure Label1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

uses Unit1;

{$R *.dfm}

procedure TAboutForm.Label1Click(Sender: TObject);
begin
close;
end;

procedure TAboutForm.FormShow(Sender: TObject);
begin
MainForm.Enabled := false;
end;

procedure TAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MainForm.Enabled := true;
end;

procedure TAboutForm.Button1Click(Sender: TObject);
begin
close;
end;

end.
