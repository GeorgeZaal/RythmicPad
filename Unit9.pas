unit Unit9;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, Dialogs;

type
  TReNameDlg = class(TForm)
    Label1: TLabel;
    ReNameEdit: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReNameDlg: TReNameDlg;
  selit : integer;

implementation

uses Unit1, LoadIni;

{$R *.dfm}

procedure TReNameDlg.FormShow(Sender: TObject);
begin
selit := MainForm.ListBox1.ItemIndex;
ReNameEdit.Text := MainForm.ListBox1.Items[selit];
ReNameEdit.SetFocus;
end;

procedure TReNameDlg.CancelBtnClick(Sender: TObject);
begin
Close;
end;

procedure TReNameDlg.OKBtnClick(Sender: TObject);
var
i : integer;
begin
// Если текст совпадает с выбранным пунктом, то закрываем:
if ReNameEdit.Text = MainForm.ListBox1.Items[selit] then
   begin
   close;
   exit;
   end;
// Если текст пуст, то:
if ReNameEdit.Text = '' then
   begin
   ShowMessage('Введите хотя бы один символ!');
   ReNameEdit.SetFocus;
   exit;
   end;
// Если не совпадает, то:
for i := 0 to MainForm.ListBox1.Items.Count-1 do
      if ReNameEdit.Text = MainForm.ListBox1.Items[i] then
         begin
         ShowMessage('Такое имя уже есть!');
         ReNameEdit.SetFocus;
         exit;
         end;
// Если ничего из вышеперечисленного, то ПЕРЕИМЕНОВЫВАЕМ:
Re_Name(patch + 'Scenario\list.txt', '&', MainForm.ListBox1.Items[selit], ReNameEdit.Text);
// ДОБАВИТЬ УДАЛЕНИЕ СТАРОГО ФАЙЛА (в loadini.pas)
MainForm.ListBox1.Items[selit] := ReNameEdit.Text;
close;
end;


end.

