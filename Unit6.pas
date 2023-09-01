unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TMapForm = class(TForm)
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure DoPnt;
    procedure DoPntSog;
    procedure Pnt(x, y : integer; clr : TColor; b : string);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapForm: TMapForm;

const
  raz = 13;
  buk_all = 'àÿî¸óşıåûèéÀßÎ¨ÓŞİÅÛÈÉáâãäæçêëìíïğñòôõö÷øùúüÁÂÃÄÆÇÊËÌÍÏĞÑÒÔÕÖ×ØÙÚÜ';
  clr_all = clRed;
  clr_sog = clYellow;

implementation

uses Unit1;

{$R *.dfm}

procedure TMapForm.Pnt(x, y : integer; clr : TColor; b : string);
begin
image1.Canvas.Pen.Color := clr;
image1.Canvas.Brush.Color := clr;
image1.Canvas.Rectangle(x*raz, y, x*raz+raz, y+raz);

Image1.Canvas.Font.Color := clBlack;
Image1.Canvas.Font.Size  := 8;
Image1.Canvas.Font.Name  := 'Tahoma';
Image1.Canvas.TextOut(x*raz, y, b);

end;

procedure TMapForm.DoPntSog;
var
   i, j, u, num : integer;
   tmp_str : string;
begin
image1.Canvas.Refresh;
num := 0;

for j := 0 to MainForm.memo1.Lines.Count do
   begin
   tmp_str := MainForm.memo1.Lines[j];
   for i := 1 to length(tmp_str) do
     for u := 1 to length(buk_all) do
     if (tmp_str[i] = buk_all[u]) and (u <= 22) then begin pnt(num, j*raz, clr_all, tmp_str[i]); num := num + 1; end else
     if (tmp_str[i] = buk_all[u]) and (u > 22) then begin pnt(num, j*raz, clr_sog, tmp_str[i]); num := num + 1; end;
   num := 0;
   end;
end;

procedure TMapForm.DoPnt;
var
   i, j, u, num : integer;
   tmp_str : string;
begin
image1.Height := mainForm.Memo1.Lines.Count * raz;
num := 0;

for j := 0 to MainForm.memo1.Lines.Count do
   begin
   tmp_str := MainForm.memo1.Lines[j];
   for i := 1 to length(tmp_str) do
     for u := 1 to length(buk_all) do if tmp_str[i] = buk_all[u] then begin pnt(num, j*raz, clr_all, tmp_str[i]); num := num + 1; end;
   num := 0;
   end;

end;

procedure TMapForm.FormShow(Sender: TObject);
var
i, j, u, cnt, max_cnt : integer;
tmp_str : string;
begin



max_cnt := 0;
cnt := 0;

for i := 0 to mainform.Memo1.Lines.Count do
   begin
   tmp_str := mainform.Memo1.Lines[i];
   for j := 1 to Length(tmp_str) do
       for u := 1 to length(buk_all) do if tmp_str[j] = buk_all[u] then cnt := cnt + 1;
   if cnt > max_cnt then max_cnt := cnt;
   cnt := 0;
   end;

   image1.Width := max_cnt * raz;       image1.Height := mainForm.Memo1.Lines.Count * raz;

// Î÷èñòêà image1 :
image1.Canvas.Brush.Color := clWhite;
image1.Canvas.Pen.Color := clWhite;
image1.Canvas.Rectangle(0,0, image1.Width, image1.Height);

DoPnt;
end;

procedure TMapForm.RadioButton1Click(Sender: TObject);
begin
 DoPnt;
end;

procedure TMapForm.RadioButton2Click(Sender: TObject);
begin
 DoPntSog;
end;

procedure TMapForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
RadioButton1.Checked := true;
end;

end.
