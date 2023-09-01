unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TDictForm = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure cbox_dic_keypress(Sender: TObject; var Key: Char);
    procedure cbox_dic_click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DictForm: TDictForm;
  cbox_dic : array[1..100] of TComboBox;
  i : integer;

implementation

uses Unit1;

{$R *.dfm}

procedure TDictForm.cbox_dic_keypress(Sender: TObject; var Key: Char);
begin
if (Key = #13) and (pos('#', (Sender as TComboBox).Text) < 1) then
   begin
   (Sender as TComboBox).Items.Add((Sender as TComboBox).Text);

   //Добавление в memo1:
   for i := 0 to memo1.Lines.Count do
   if memo1.Lines[i] = (Sender as TComboBox).Items[0] then
   begin
   memo1.Lines.Insert(i+1, (Sender as TComboBox).Text);
//   memo2.Lines.Add((Sender as TComboBox).text);
   break;
   end;

   (Sender as TComboBox).ItemIndex := 0;
   caption := 'Слово добавлено в словарь ' + (Sender as TComboBox).Items[0];

   end;
end;

procedure TDictForm.cbox_dic_click(Sender: TObject);
begin
if (Sender as TComboBox).ItemIndex = 0 then exit;
mainForm.memo1.Lines.Add((Sender as TComboBox).text);
(Sender as TComboBox).ItemIndex := 0;
end;

procedure TDictForm.FormShow(Sender: TObject);
var
i, j, cnt, cnt_top : integer;
str : string;
label next_cbox;
begin
//Добавление прокрутки
DictForm.AutoScroll := true;
//ЗАгрузхка в memo, откуда всё будет браться
memo1.Lines.LoadFromFile(patch + 'Dict\dictonary.txt');
//Создание ComboBox'ов словаря:
cnt := 1;
cnt_top := 5;
for i := 0 to memo1.Lines.Count do
    begin
    if pos('#', memo1.Lines[i]) = 1 then
       begin
       cbox_dic[cnt] := TComboBox.Create(DictForm);
       cbox_dic[cnt].Parent := DictForm;
       cbox_dic[cnt].Left := 10;
       cbox_dic[cnt].Width := 330;
       cbox_dic[cnt].BevelKind := bkFlat;
       cbox_dic[cnt].BevelInner := bvRaised;
       cbox_dic[cnt].Top := cnt_top;
       cbox_dic[cnt].Items.Add(memo1.Lines[i]);
       cbox_dic[cnt].ItemIndex := 0;
       cbox_dic[cnt].AutoComplete := false;       //Чтобы не было проблемы с автовводом
       cbox_dic[cnt].OnClick := cbox_dic_click;
       cbox_dic[cnt].OnKeyPress := cbox_dic_keypress;
       // Заполнение ComboBox'a:
          for j := 1 to memo1.Lines.Count do
          if pos('#', memo1.Lines[i + j]) <> 1 then cbox_dic[cnt].Items.Add(memo1.Lines[i + j]) else goto next_cbox;
       // Счётчики:
       next_cbox:
       cnt := cnt + 1;
       cnt_top := cnt_top + 25;
       end;
    end;
// Размер формы по количеству комбобоксов:
if cnt > 12 then DictForm.Width := 370 else DictForm.Width := 358;
end;

procedure TDictForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
memo1.Lines.SaveToFile(patch + 'Dict\dictonary.txt');
end;

end.
