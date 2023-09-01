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
// ���� ����� ��������� � ��������� �������, �� ���������:
if ReNameEdit.Text = MainForm.ListBox1.Items[selit] then
   begin
   close;
   exit;
   end;
// ���� ����� ����, ��:
if ReNameEdit.Text = '' then
   begin
   ShowMessage('������� ���� �� ���� ������!');
   ReNameEdit.SetFocus;
   exit;
   end;
// ���� �� ���������, ��:
for i := 0 to MainForm.ListBox1.Items.Count-1 do
      if ReNameEdit.Text = MainForm.ListBox1.Items[i] then
         begin
         ShowMessage('����� ��� ��� ����!');
         ReNameEdit.SetFocus;
         exit;
         end;
// ���� ������ �� ������������������, �� ���������������:
Re_Name(patch + 'Scenario\list.txt', '&', MainForm.ListBox1.Items[selit], ReNameEdit.Text);
// �������� �������� ������� ����� (� loadini.pas)
MainForm.ListBox1.Items[selit] := ReNameEdit.Text;
close;
end;


end.

