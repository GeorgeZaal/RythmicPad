unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TSpectroForm = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure DoPnt;
    procedure Pnt(x, y : integer; clr : TColor; b : string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SpectroForm: TSpectroForm;

const
  raz = 13;

implementation

uses Unit1;

{$R *.dfm}

{Я, А, Е - бардовый - красный - розовый (каждый).
Э - оранжевый (охотник).
У и Ю - жёлтый - коричневый (желает).
О - зелёный (знать).
Ё - голубой (где).
И - синий (сидит).
Ы -фиолетовый (фазан).}

procedure TSpectroForm.Pnt(x, y : integer; clr : TColor; b : string);
begin
image1.Canvas.Pen.Color := clr;
image1.Canvas.Brush.Color := clr;
image1.Canvas.Rectangle(x*raz, y, x*raz+raz, y+raz);

Image1.Canvas.Font.Color := clBlack;
Image1.Canvas.Font.Size  := 8;
Image1.Canvas.Font.Name  := 'Tahoma';
Image1.Canvas.TextOut(x*raz, y, b);
end;

procedure TSpectroForm.DoPnt;
var
   i, j, num : integer;
   tmp_str : string;
begin
            image1.Height := mainForm.Memo1.Lines.Count * raz;
num := 0;
for j := 0 to MainForm.memo1.Lines.Count do
   begin
   tmp_str := MainForm.memo1.Lines[j];
   for i := 1 to length(tmp_str) do
     begin
      if (tmp_str[i] = 'А') or (tmp_str[i] = 'а') then begin pnt(num, j*raz, clRed,     tmp_str[i]); num := num + 1; end;
      if (tmp_str[i] = 'У') or (tmp_str[i] = 'у') then begin pnt(num, j*raz, clYellow,  tmp_str[i]); num := num + 1; end;
      if (tmp_str[i] = 'Е') or (tmp_str[i] = 'е') then begin pnt(num, j*raz, clFuchsia, tmp_str[i]); num := num + 1; end;
      if (tmp_str[i] = 'Ё') or (tmp_str[i] = 'ё') then begin pnt(num, j*raz, clBlue,    tmp_str[i]); num := num + 1; end;
      if (tmp_str[i] = 'Ы') or (tmp_str[i] = 'ы') then begin pnt(num, j*raz, clPurple,  tmp_str[i]); num := num + 1; end;
      if (tmp_str[i] = 'О') or (tmp_str[i] = 'о') then begin pnt(num, j*raz, clGreen,   tmp_str[i]); num := num + 1; end;
      if (tmp_str[i] = 'Э') or (tmp_str[i] = 'э') then begin pnt(num, j*raz, $000080FF, tmp_str[i]); num := num + 1; end;
      if (tmp_str[i] = 'Я') or (tmp_str[i] = 'я') then begin pnt(num, j*raz, clMaroon,  tmp_str[i]); num := num + 1; end;
      if (tmp_str[i] = 'И') or (tmp_str[i] = 'и') then begin pnt(num, j*raz, clNavy,    tmp_str[i]); num := num + 1; end;
      if (tmp_str[i] = 'Ю') or (tmp_str[i] = 'ю') then begin pnt(num, j*raz, $00004080, tmp_str[i]); num := num + 1; end;
     end;
   num := 0;
   end;
end;


procedure TSpectroForm.FormShow(Sender: TObject);
var
i, j, cnt, max_cnt : integer;
tmp_str : string;
begin

max_cnt := 0;
cnt := 0;

for i := 0 to mainform.Memo1.Lines.Count do
   begin
   tmp_str := ansilowercase(mainform.Memo1.Lines[i]);
   for j := 1 to Length(tmp_str) do
       if (tmp_str[j] = 'а') or (tmp_str[j] = 'у')
       or (tmp_str[j] = 'е') or (tmp_str[j] = 'ё')
       or (tmp_str[j] = 'ы') or (tmp_str[j] = 'о')
       or (tmp_str[j] = 'э') or (tmp_str[j] = 'я')
       or (tmp_str[j] = 'и') or (tmp_str[j] = 'ю')
       then cnt := cnt + 1;
   if cnt > max_cnt then max_cnt := cnt;
   cnt := 0;
   end;

// caption := 'Самая длинная строка = ' + inttostr(max_cnt);
//

   image1.Width := max_cnt * raz;
               image1.Height := mainForm.Memo1.Lines.Count * raz;

// Очистка image1 :
image1.Canvas.Brush.Color := clWhite;
image1.Canvas.Pen.Color := clWhite;
image1.Canvas.Rectangle(0,0, image1.Width, image1.Height);

DoPnt;

end;

end.
