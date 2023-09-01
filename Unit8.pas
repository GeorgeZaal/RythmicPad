unit Unit8;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, Dialogs;

type
  TAddItemDlg = class(TForm)
    Label1: TLabel;
    AddItem: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure MaxFile;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddItemDlg: TAddItemDlg;
  max: integer;


implementation

uses Unit1;

{$R *.dfm}

// Определение страшего файла:
procedure TAddItemDlg.MaxFile;
var
   sr: TSearchRec;
   it: string;
begin
max := 0;
if FindFirst(ExtractFilePath(ParamStr(0))+patch + 'Scenario\*.s', faAnyFile, sr)=0 then
   repeat
     it := sr.Name;
     Delete(it, length(it)-1, 2);
     if strtoint(it) > max then max := strtoint(it);
   until FindNext(sr) <> 0;
     FindClose(sr);
end;

procedure TAddItemDlg.CancelBtnClick(Sender: TObject);
begin
Close;
end;

procedure TAddItemDlg.OKBtnClick(Sender: TObject);
var
   new_file, list_file : TextFile;
   i : integer;
begin
// Проверка на дублирование пункта:
if MainForm.ListBox1.Items.Count > 0 then
for i := 0 to MainForm.ListBox1.Items.Count-1 do
   if MainForm.ListBox1.Items[i] = AddItem.Text then
   begin
   ShowMessage('Такое имя уже есть!');
   exit;
   end;
// Добавление пункта:
if AddItem.Text <> '' then
   begin
   // Определяем страший файл:
   MaxFile;
   // Добавление итема в листбокс:
   MainForm.ListBox1.Items.Add(AddItem.Text);
   AddItem.SetFocus;
   // Создание файла:
   AssignFile(new_file, patch + 'Scenario\' + inttostr(max+1)+'.s');
   Rewrite(new_file);
   Write(new_file,'');
   CloseFile(new_file);
   // Добавление связи в файл list.txt:
   AssignFile(list_file, patch + 'Scenario\list.txt');
   Append(list_file);
   WriteLn(list_file, AddItem.text + ' & ' + inttostr(max+1)+'.s');
   CloseFile(list_file);
   // Заполнение переменной save для mainForm, дабы при щелчке на новом пункте открывался он
   Save := patch + 'Scenario\' + inttostr(max+1)+'.s';
   // И очистка memo, чтобы не писал в новые файлы текст из старых
   MainForm.Memo1.Clear;
   // Установка активности на созданном пункте:
   MainForm.listbox1.ItemIndex := MainForm.listbox1.Items.Count-1;
   end;

end;

end.

