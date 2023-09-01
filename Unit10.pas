unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ColorGrd, Spin, LoadIni;

type
  TFntBgForm = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    ColorGrid1: TColorGrid;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FntBgForm: TFntBgForm;

implementation

uses Unit1;

{$R *.dfm}

procedure TFntBgForm.FormShow(Sender: TObject);
var
i, cl : integer;
begin
MainForm.Enabled := false;

// Поле:
SpinEdit2.Text := OpenParam (patch + '\Set\settings.txt', 'Левое поле', ':');
// Шрифт:
ComboBox1.Items.Clear;
for I := 0 to screen.Fonts.Count - 1 do
ComboBox1.Items.Add(Screen.Fonts.Strings[i]);
ComboBox1.Text := MainForm.Memo1.Font.Name;
// Кегль:
SpinEdit1.Text := inttostr(MainForm.Memo1.Font.Size);

with mainform.Memo1 do
   begin
   if color = clBlack then cl := 0;
   if color = clMaroon then cl := 1;
   if color = clGreen then cl := 2;
   if color = clOlive then cl := 3;
   if color = clNavy then cl := 4;
   if color = clPurple then cl := 5;
   if color = clTeal then cl := 6;
   if color = clSilver then cl := 7;
   if color = clGray then cl := 8;
   if color = clRed then cl := 9;
   if color = clLime then cl := 10;
   if color = clYellow then cl := 11;
   if color = clBlue then cl := 12;
   if color = clFuchsia then cl := 13;
   if color = clAqua then cl := 14;
   if color = clWhite then cl := 15;
   end;
ColorGrid1.BackgroundIndex := cl;

with mainform.Memo1.Font do
   begin
   if color = clBlack then cl := 0;
   if color = clMaroon then cl := 1;
   if color = clGreen then cl := 2;
   if color = clOlive then cl := 3;
   if color = clNavy then cl := 4;
   if color = clPurple then cl := 5;
   if color = clTeal then cl := 6;
   if color = clSilver then cl := 7;
   if color = clGray then cl := 8;
   if color = clRed then cl := 9;
   if color = clLime then cl := 10;
   if color = clYellow then cl := 11;
   if color = clBlue then cl := 12;
   if color = clFuchsia then cl := 13;
   if color = clAqua then cl := 14;
   if color = clWhite then cl := 15;
   end;
ColorGrid1.ForegroundIndex := cl;
{0 - clBlack
1 - clMaroon
2 - clGreen
3 - clOlive
4 - clNavy
5 - clPurple
6 - clTeal
7 - clSilver

8 - clGray
9 - clRed
10 - clLime
11 - clYellow
12 - clBlue
13 - clFuchsia
14 - clAqua
15 - clWhite}

end;

procedure TFntBgForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MainForm.Enabled := true;
   Ch_Param(patch + '\Set\settings.txt', ':', 'Левое поле', FntBgForm.SpinEdit2.Text);
end;

procedure TFntBgForm.Button2Click(Sender: TObject);
begin
close;
end;

procedure TFntBgForm.Button1Click(Sender: TObject);
var
Rect: TRect;
begin
with MainForm.Memo1 do
   begin
   Font.Name := ComboBox1.Text;
   Font.Size := StrToInt(SpinEdit1.Text);
   Font.Color := ColorGrid1.ForegroundColor;
   Color := ColorGrid1.BackgroundColor;
   end;
      // Установка левого поля:
      SendMessage(MainForm.Memo1.Handle, EM_GETRECT, 0, LongInt(@Rect));
      Rect.Left:= strtoint(SpinEdit2.text);
      SendMessage(MainForm.Memo1.Handle, EM_SETRECT, 0, LongInt(@Rect));
      MainForm.Memo1.Refresh;
//memo3:
//   MainForm.Memo3.Font.Name := ComboBox1.Text;
   MainForm.Memo3.Font.Size := StrToInt(SpinEdit1.Text);

close;
end;

end.
