unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls;

type
  TFrequencyForm = class(TForm)
    Panel1: TPanel;
    SGrid1: TStringGrid;
    Label1: TLabel;
    ListBox1: TListBox;
    procedure FormShow(Sender: TObject);
  private
    procedure FindWordInString(S:string; var TS : TStringList);
    procedure GridShow;
    procedure swapp(var a, b: Integer);
    procedure swapp_str(var a, b: String);
    procedure NewTable;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrequencyForm: TFrequencyForm;
  // Переменные к подсчёту слов:
  totalword, differentword : integer;
  wrd_mas : array of string;   // Объявление динамического массива
  num_mas : array of integer;

implementation

uses Unit1;

{$R *.dfm}

procedure TFrequencyForm.GridShow;
var
i : integer;
begin
//Подписи и размеры столбцов:
SGrid1.Cells[0,0] := 'Слово';                      SGrid1.ColWidths[0] := 200;
SGrid1.Cells[1,0] := 'Частота';                    SGrid1.ColWidths[1] := 50;
//Высота шапки и строк
for i := 0 to sgrid1.RowCount do SGrid1.RowHeights[i-1] := 18;
//Фокус на нижней строчке, чтобы каждый раз не перематывать:
SGrid1.Row := SGrid1.RowCount-1;
end;

procedure TFrequencyForm.swapp(var a, b : integer);
var
p : integer;
begin
   p := a;
   a := b;
   b := p;
end;

procedure TFrequencyForm.swapp_str(var a, b : string);
var
p : string;
begin
   p := a;
   a := b;
   b := p;
end;

procedure TFrequencyForm.FindWordInString(S:string; var TS : TStringList);
const

  D = [#133, #045, #151, '`', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '{', '}', '"', ':', '<', '>', '?', '/', '.', ',', ';', '[', ']', '=', '\', '|', '№', '«', '»', ' ', #9, #10, #13];

var i:integer;
    S2:string;
begin
//  Result := TStringList.Create;
  S2 := '';
  For i:=1 to Length(S) do
  begin
     if (s[i] in D) then begin
        if (Length(S2)>0) then begin
          TS.Append(S2);
          S2:='';
        end;
     end
    else
        S2:=S2+s[i];
  end;
  if (Length(S2)>0) then TS.Append(S2);
end;

procedure TFrequencyForm.NewTable;
var i, j, Cnt : Integer;
    OneWord : string;
    TSL : TStringList;
    tmp, nam, num : string;
    N : integer;
begin
// ВЫВОД ДАННЫХ В LISTBOX1 :
  TSL := TStringList.Create;
  try
    FindWordInString(AnsiLowerCase(MainForm.Memo1.Text), TSL);
    ListBox1.Items.Clear; // очистим ListBox
    if TSL.Count=0 then Exit; // если нет ни одного слова - выходим!
    TSL.Sort; // отсортируем массив по словам
     // А вот собственно  и подсчёт
     OneWord := TSL.Strings[0];
     Cnt := 1;
     for i := 1 to TSL.Count - 1 do
       if AnsiUpperCase(TSL.Strings[i]) = AnsiUpperCase(OneWord) then inc(Cnt)
       else begin
         ListBox1.Items.Append(OneWord+' '+InttoStr(Cnt));
         OneWord := TSL.Strings[i];
         Cnt := 1;
       end;
     // для последнего слова в списке вывод результата
     ListBox1.Items.Append(OneWord+' '+InttoStr(Cnt));
  finally
    FreeAndNil(TSL);
  end;

// ПЕРЕВОД ИЗ LISTBOX В ТАБЛИЦУ
SGrid1.RowCount := listbox1.Count + 1;
for i := 0 to ListBox1.Count-1 do
    begin
    tmp := listbox1.Items[i];
    for j := 1 to length(tmp) do
        if tmp[j] <> ' ' then nam := nam + tmp[j] else
           begin
           delete(tmp, 1, j);
           num := tmp;
           break;
           end;
    SGrid1.Cells[0, i+1] := nam;
    SGrid1.Cells[1, i+1] := num;
    nam := '';
    num := '';
    end;

// СОРТИРОВКА ТАБЛИЦЫ:
N := SGrid1.RowCount;
SetLength(wrd_mas, N); // Длина массива = высота таблицы
SetLength(num_mas, N);
// Заполнение массива:
for i := 1 to N-1 do wrd_mas[i] := SGrid1.Cells[0, i];
for i := 1 to N-1 do num_mas[i] := strtoint(SGrid1.Cells[1, i]);

//Пузырёк:
   for j := 1 to N-1 do
     for i := 1 to N-j do
        if num_mas[i] > num_mas[i+1] then
              begin
              swapp(num_mas[i], num_mas[i+1]);
              swapp_str(wrd_mas[i], wrd_mas[i+1]);
              end;

// Вывод массива в таблицу:
for i := 1 to N-1 do
 begin
 SGrid1.Cells[0, i] := wrd_mas[N - i];
 SGrid1.Cells[1, i] := inttostr(num_mas[N - i]);
 end;

end;

procedure TFrequencyForm.FormShow(Sender: TObject);
var
i : integer;
begin
// Очистка:
    SGrid1.RowCount := 1;

NewTable;
GridShow;
totalword := 0;
differentword := SGrid1.RowCount;

   // Вывод статистики:
   for i := 1 to SGrid1.RowCount-1 do
   totalword := totalword + strtoint(SGrid1.Cells[1,i]);
   Label1.Caption := 'Всего: ' + inttostr(differentword - 1) + ' слов. Разных: ' + inttostr(totalword) + ' слов.';

SGrid1.FixedRows := 1;
end;

end.
