unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TStatForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Lb_Glas: TLabel;
    Lb_Soglas: TLabel;
    Label3: TLabel;
    Lb_Vsego: TLabel;
    Label4: TLabel;
    Lb_Ship: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Lb_Sha: TLabel;
    Lb_Shya: TLabel;
    Lb_Zh: TLabel;
    Lb_Ch: TLabel;
    Label9: TLabel;
    Lb_PrSh: TLabel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatForm: TStatForm;

const Gl = 'àÿî¸óþýåûèÀßÎ¨ÓÞÝÅÛÈ';
      Sl = 'áâãäæçêëìíïðñòôõö÷øùúüÁÂÃÄÆÇÊËÌÍÏÐÑÒÔÕÖ×ØÙÚÜ';
      Sh = 'Ææ×÷ØøÙù';

implementation

uses Unit1;

{$R *.dfm}

procedure TStatForm.FormShow(Sender: TObject);
var
i, j, k, glas, soglas, ship, zh, ch, sha, shya : integer;
prsh : extended;
str : string;
begin
// ÎÁÍÓËÅÍÈÅ:
Lb_Glas.Caption   := '0';
Lb_Soglas.Caption := '0';
Lb_Vsego.Caption  := '0';
Lb_Ship.Caption   := '0';
Lb_PrSh.Caption   := '0';
Lb_Sha.Caption    := '0';
Lb_Zh.Caption     := '0';
Lb_Ch.Caption     := '0';
Lb_Shya.Caption   := '0';
i := 0;    glas   := 0;    zh  := 0;    shya := 0;
j := 0;    soglas := 0;    ch  := 0;    prsh := 0;
k := 0;    ship   := 0;    sha := 0;
str := '';
// ÏÎÄÑ×¨Ò:
for i := 0 to mainForm.memo1.Lines.Count do
   begin
   str := mainForm.memo1.Lines[i];
   for j := 1 to Length(str) do
      begin
      for k := 1 to Length(Gl) do if str[j] = Gl[k] then glas   := glas + 1;
      for k := 1 to Length(Sl) do if str[j] = Sl[k] then soglas := soglas + 1;
      for k := 1 to Length(Sh) do if str[j] = Sh[k] then ship   := ship + 1;
      if (str[j] = 'æ') or (str[j] = 'Æ') then zh   := zh + 1;
      if (str[j] = 'ø') or (str[j] = 'Ø') then sha  := sha + 1;
      if (str[j] = 'ù') or (str[j] = 'Ù') then shya := shya + 1;
      if (str[j] = '÷') or (str[j] = '×') then ch   := ch + 1;
      end;
   end;
Lb_Glas.Caption   := inttostr(glas);
Lb_Soglas.Caption := inttostr(soglas);
Lb_Vsego.Caption  := inttostr(glas + soglas);
Lb_Ship.Caption   := inttostr(ship);
if zh > 0 then
   begin
   prsh := 100 / ((glas + soglas) / zh);
   Lb_Zh.Caption     := inttostr(zh) + '    (' + formatfloat('0.00',prsh) + ' %)';
   end;
if ch > 0 then
   begin
   prsh := 100 / ((glas + soglas) / ch);
   Lb_Ch.Caption     := inttostr(ch) + '    (' + formatfloat('0.00',prsh) + ' %)';
   end;
if sha > 0 then
   begin
   prsh := 100 / ((glas + soglas) / sha);
   Lb_Sha.Caption     := inttostr(sha) + '    (' + formatfloat('0.00',prsh) + ' %)';
   end;
if Shya > 0 then
   begin
   prsh := 100 / ((glas + soglas) / Shya);
   Lb_Shya.Caption     := inttostr(Shya) + '    (' + formatfloat('0.00',prsh) + ' %)';
   end;
if ship > 0 then prsh := 100 / ((glas + soglas) / ship);
Lb_PrSh.Caption   := formatfloat('0.00',prsh);//floattostr(prsh);
end;

procedure TStatForm.Button1Click(Sender: TObject);
begin
close;
end;

end.
