unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Menus, LoadIni, ComCtrls;

type
  TMAINFORM = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Memo2: TMemo;
    N8: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    N9: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    Panel3: TPanel;
    ListBox1: TListBox;
    Splitter1: TSplitter;
    PopupMenu1: TPopupMenu;
    N21: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N29: TMenuItem;
    Splitter2: TSplitter;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N13: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N28: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    Memo3: TRichEdit;
    Panel1: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Bevel1: TBevel;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure p;
    procedure FormPaint(Sender: TObject);
    procedure Memo3Change(Sender: TObject);
    procedure Memo3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton14Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Memo3Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBox1Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure Splitter2Moved(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure Memo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    {мои процедуры:}  
    procedure sel_slogi(n_slogi: String);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
    function GlasSoglas(const S: String; c: Char): Integer; overload;
    function Slogi(const Z: String): String; overload;

const
  nam = 'RhytmiC 2.0 alpha';

var
  MAINFORM: TMAINFORM;
  c : integer;
  FName, save, patch, load: string;
  StartingPoint : TPoint; // Для перетаскивания в ListBox1
  change : boolean;
  buttonSelected : Integer;

implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8, Unit9, Unit10,
  Unit11;

{$R *.dfm}

procedure TMAINFORM.sel_slogi(n_slogi: string);
//выделение четырёх одинаковых цифр в одной строке:
begin
with memo3 do
begin
  selstart:=FindText(n_slogi,0,length(text), [stWholeWord]);
  sellength:=length(n_slogi);
  selattributes.color:=clRed;
end;
end;

function Slogi(const Z: String): String;
const
glas = 'аяоёуюэеыиАЯОЁУЮЭЕЫИ';
var
i, j, k, tit : integer;
itog, lon : string;
begin
tit := 0;

for i := 1 to Length(Z) do
    if Z[i] = ' ' then lon := lon + '0' else
       for j := 1 to 20 do
       if Z[i] = glas[j] then lon := lon + '1';

if length(lon) = 0 then itog := '0';

if length(lon) > 0 then if lon[1] = '0' then delete(lon, 1, 1);

for k := 1 to Length(lon) + 1 do if length(lon) > 0 then
    if lon[k] = '1' then tit := tit + 1 else
       begin
       itog := itog + inttostr(tit) + '-';
       tit := 0;
       end;

for i := 1 to length(itog) do
    if itog[i] = '0' then delete(itog, i, 1);

for i := 1 to length(itog) do
    if itog[1] = '-' then delete(itog, i, 1);

for i := 1 to length(itog) do
    if itog[i] = '-' then
    if itog[i + 1] = '-' then
    delete(itog, i, 1);

for i := 1 to length(itog) do
if itog[length(itog)] = '-' then delete(itog, length(itog), 1);

Slogi := itog;
end;

// первый параметр - строка в которой нужно считать
// второй параметр - 's' - согласные, 'g' - глассные
function GlasSoglas(const S: String; c: Char): Integer;
var i, j, k: Integer;
const Gl = 'аяоёуюэеыиАЯОЁУЮЭЕЫИ';
      Sl = 'бвгджзклмнпрстфхцчшщъьБВГДЖЗКЛМНПРСТФХЦЧШЩЪЬ';
begin
  k := 0;
  if c = 'g' then
    begin
      for i := 1 to Length(S)do
        for j := 1 to Length(Gl) do
          if S[i] = Gl[j] then
            k := k + 1;
      Result := k;
    end;
  if c = 's' then
    begin
      for i := 1 to Length(S)do
        for j := 1 to Length(Sl) do
          if S[i] = Sl[j] then
            k := k + 1;
    Result := k;
    end;
end;

procedure TMAINFORM.SpeedButton1Click(Sender: TObject);
var
s : string;
i : integer;
begin
// memo3 и SB1 появляются:
if memo3.Visible = false then
   begin
   memo3.Visible := true;
   splitter2.Visible := true;
   Panel2.Visible := true;
   end;
// ---
memo2.Lines.Clear;
memo3.Lines.Clear;
for i := 0 to memo1.Lines.Count - 1 do
begin
s := Memo1.Lines[i];
memo2.Lines.Add(IntToStr(GlasSoglas(S, 'g')));
  if GlasSoglas(S, 'g') >= 10 then memo3.Lines.Add(' ' + IntToStr(GlasSoglas(S, 'g')) + '   ' + slogi(Memo1.Lines[i])) else
  if GlasSoglas(S, 'g') < 10  then memo3.Lines.Add(' ' + IntToStr(GlasSoglas(S, 'g')) + '    ' + slogi(Memo1.Lines[i]));
end;

//выделение четырёх и пяти одинаковых цифр в одной строке:
sel_slogi('1-1-1-1');   sel_slogi('1-1-1-1-1');
sel_slogi('2-2-2-2');   sel_slogi('2-2-2-2-2');
sel_slogi('3-3-3-3');   sel_slogi('3-3-3-3-3');
sel_slogi('4-4-4-4');   sel_slogi('4-4-4-4-4');
sel_slogi('5-5-5-5');   sel_slogi('5-5-5-5-5');
sel_slogi('6-6-6-6');   sel_slogi('6-6-6-6-6');

end;

procedure TMAINFORM.SpeedButton2Click(Sender: TObject);
begin
N37.OnClick(N37);
end;

procedure TMAINFORM.N2Click(Sender: TObject);
begin
close;
end;

procedure TMAINFORM.N27Click(Sender: TObject);
var
erase : Word;
i : integer;
SL : TStringList;
begin
erase := MessageBox(Handle,Pchar('Вы действительно хотите стереть все пукнты?'),Pchar('Предупреждение'),MB_ICONWARNING+MB_YESNO);
case erase of
idyes: begin
       for i := 0 to listbox1.Items.Count-1 do deletefile(patch + 'Scenario\' + OpenParam (patch + 'Scenario\list.txt', listbox1.Items[i], '&'));
       SL := TStringList.Create;
       SL.SaveToFile(patch + 'Scenario\list.txt');
       SL.SaveToFile(patch + 'Scenario\count.txt');
       SL.Free;
       listbox1.Clear;
       end;
//idno : close;
end;
memo1.Lines.Clear;
end;

procedure TMAINFORM.N6Click(Sender: TObject);
var
s : string;
i : integer;
begin
memo2.Lines.Clear;
for i := 0 to memo1.Lines.Count - 1 do
begin
s := Memo1.Lines[i];
memo2.Lines.Add(IntToStr(GlasSoglas(S, 'g')));
ChartForm.Show;
ChartForm.ReCount;
end;
end;

procedure TMAINFORM.N7Click(Sender: TObject);
begin
if N7.Checked = true then
   begin
   memo1.WordWrap := false;
   N7.Checked := false;
   memo1.ScrollBars := ssBoth;
   memo3.ScrollBars := ssBoth;
   end
   else
   begin
   memo1.WordWrap := true;
   N7.Checked := true;
   memo1.ScrollBars := ssVertical;
   memo3.ScrollBars := ssVertical;
   end;
end;

procedure TMAINFORM.N8Click(Sender: TObject);
begin
for c := 0 to memo1.Lines.Count do
if (memo1.Lines[c] = '') or (memo1.Lines[c] = ' ') then
Memo1.Lines.Delete(c)
end;

procedure TMAINFORM.N9Click(Sender: TObject);
var
i, j : integer;
tmpstr : string;
begin
for i := 1 to memo1.Lines.Count do
    begin
    tmpstr := memo1.Lines[i];
       for j := 1 to Length(tmpstr) do
       if (tmpstr[j] = '.') and (tmpstr[j+1] = '.') and (tmpstr[j+2] = '.')
       then begin insert(#23, tmpstr, j+3); delete(tmpstr,j,2);  memo1.Lines[i] := tmpstr; end;
    end;
end;

procedure TMAINFORM.N22Click(Sender: TObject);
begin
memo1.Clear;
memo2.Clear;
end;

procedure TMAINFORM.N12Click(Sender: TObject);
begin
memo1.SelectAll;
end;

procedure TMAINFORM.N10Click(Sender: TObject);
begin
memo1.Undo;
end;

procedure TMAINFORM.N11Click(Sender: TObject);
begin
memo1.ClearUndo;
end;

procedure TMAINFORM.N23Click(Sender: TObject);
begin
showmessage('Справка в данной версии не предусмотрена');
end;

procedure TMAINFORM.N24Click(Sender: TObject);
begin
AboutForm.Show;
end;

procedure TMAINFORM.SpeedButton3Click(Sender: TObject);
begin
memo1.Undo;
end;

procedure TMAINFORM.SpeedButton4Click(Sender: TObject);
begin
memo1.ClearUndo;
end;

procedure TMAINFORM.SpeedButton5Click(Sender: TObject);
begin
N31.OnClick(N31);
end;

procedure TMAINFORM.SpeedButton12Click(Sender: TObject);
begin
SpectroForm.Show;
end;

procedure TMAINFORM.N14Click(Sender: TObject);
begin
SpectroForm.Show;
end;

procedure TMAINFORM.SpeedButton13Click(Sender: TObject);
begin
FrequencyForm.Show;
end;

procedure TMAINFORM.N15Click(Sender: TObject);
begin
FrequencyForm.Show;
end;

procedure TMAINFORM.N16Click(Sender: TObject);
begin
if OpenDialog1.Execute then
   begin
   FName := OpenDialog1.FileName;
   Memo1.Lines.LoadFromFile(FName);
   //
   load := fname;
   caption := nam + ' : ' + load;
   change := false;
   end;
end;

procedure TMAINFORM.N17Click(Sender: TObject);
begin
if SaveDialog1.Execute then
   begin
   FName := SaveDialog1.FileName;
   Memo1.Lines.SaveToFile(FName);
   load := fname;
   caption := nam + ' : ' + load;
   change := false;
   end;
end;

// Процедуры рисования линии на правом memo3 - НАЧАЛО:

procedure TMAINFORM.p;
var
  CC: TControlCanvas;
   begin
      Memo3.Repaint;
      CC := TControlCanvas.Create;
      CC.Control := Memo3;
      CC.Pen.Color := clMedGray;
      CC.MoveTo(30,0);
      CC.LineTo(30,2500);
      CC.Free;
    end;

procedure TMAINFORM.FormPaint(Sender: TObject);
begin
//p;
end;

procedure TMAINFORM.Memo3Change(Sender: TObject);
begin
//p;
end;

procedure TMAINFORM.Memo3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//if (ssLeft IN Shift ) THEN p;
end;

// Процедуры рисования линии на правом memo3 - КОНЕЦ:

procedure TMAINFORM.SpeedButton14Click(Sender: TObject);
begin
MapForm.Show;
end;

procedure TMAINFORM.Timer1Timer(Sender: TObject);
begin
p;
end;

procedure TMAINFORM.Memo3Click(Sender: TObject);
begin
//p;
end;

procedure TMAINFORM.N19Click(Sender: TObject);
begin
StatForm.show;
end;

procedure TMAINFORM.SpeedButton15Click(Sender: TObject);
begin
StatForm.Show;
end;

procedure TMAINFORM.N20Click(Sender: TObject);
begin
if panel3.Visible = false then
   begin
   splitter2.Visible := false;
{   if N32.Checked = true then
   begin
   memo3.Visible := false;
   N32.Checked := false;
   end;}
   panel3.Visible := true;
   panel3.Width := 200;
   N20.Checked := true;
//   SpeedButton1.Visible := false;
   memo1.Lines.SaveToFile(patch + 'Scenario\temp.txt');
   if ListBox1.Items.Count > 0 then
      begin
      ListBox1.ItemIndex := 0;
      Save := patch + 'Scenario\' + OpenParam (patch + 'Scenario\list.txt', ListBox1.Items[ListBox1.ItemIndex], '&');
      memo1.Lines.LoadFromFile(Save);
      end;
   end else
   begin
//   if N32.Checked = true then memo3.Visible := true;
   splitter2.Visible := true;
   panel3.Visible := false;
   N20.Checked := false;
//   SpeedButton1.Visible := true;
   if ListBox1.Items.Count > 0 then memo1.Lines.SaveToFile(save);
   memo1.Lines.LoadFromFile(patch + 'Scenario\temp.txt');
   end;
end;

procedure TMAINFORM.FormShow(Sender: TObject);
var
list_file : TextFile;
filename : string;
Rect: TRect;
begin
// Создание файла листа для сценария:
filename := patch + 'Scenario\list.txt';
if not FileExists(filename) then
   begin
   AssignFile(list_file, filename);
   Rewrite(list_file);
   Write(list_file,'');
   CloseFile(list_file);
   end;
// Создание файла списка сцен для сценария:
filename := patch + 'Scenario\count.txt';
if not FileExists(filename) then
   begin
   AssignFile(list_file, filename);
   Rewrite(list_file);
   Write(list_file,'');
   CloseFile(list_file);
   end;
// Создание файла хранения текста из базового редактора:
filename := patch + 'Scenario\temp.txt';
if not FileExists(filename) then
   begin
   AssignFile(list_file, filename);
   Rewrite(list_file);
   Write(list_file,'');
   CloseFile(list_file);
   end;
// Загрузка списка сцен:
   ListBox1.Items.LoadFromFile(patch + 'Scenario\count.txt');
// Загрузка иконок на кнопки:
   if FileExists(patch + 'Icons\1.bmp')  then SpeedButton3.Glyph.LoadFromFile(patch + 'Icons\1.bmp');
   if FileExists(patch + 'Icons\2.bmp')  then SpeedButton4.Glyph.LoadFromFile(patch + 'Icons\2.bmp');
   if FileExists(patch + 'Icons\3.bmp')  then SpeedButton5.Glyph.LoadFromFile(patch + 'Icons\3.bmp');
   if FileExists(patch + 'Icons\4.bmp')  then SpeedButton9.Glyph.LoadFromFile(patch + 'Icons\4.bmp');
   if FileExists(patch + 'Icons\5.bmp')  then SpeedButton10.Glyph.LoadFromFile(patch + 'Icons\5.bmp');
   if FileExists(patch + 'Icons\6.bmp')  then SpeedButton11.Glyph.LoadFromFile(patch + 'Icons\6.bmp');
   if FileExists(patch + 'Icons\7.bmp')  then SpeedButton13.Glyph.LoadFromFile(patch + 'Icons\7.bmp');
   if FileExists(patch + 'Icons\8.bmp')  then SpeedButton12.Glyph.LoadFromFile(patch + 'Icons\8.bmp');
   if FileExists(patch + 'Icons\9.bmp')  then SpeedButton14.Glyph.LoadFromFile(patch + 'Icons\9.bmp');
   if FileExists(patch + 'Icons\10.bmp') then SpeedButton15.Glyph.LoadFromFile(patch + 'Icons\10.bmp');
   if FileExists(patch + 'Icons\11.bmp') then SpeedButton1.Glyph.LoadFromFile(patch + 'Icons\11.bmp');
   if FileExists(patch + 'Icons\12.bmp') then SpeedButton2.Glyph.LoadFromFile(patch + 'Icons\12.bmp');
// Загрузка настроек внешнего вида:
   if FileExists(patch + 'Set\settings.txt') then
   begin
      if OpenParam (patch + 'Set\settings.txt', 'Режим сценария', ':') = 'off' then N20.Checked := false else N20.OnClick(Sender);
      if OpenParam (patch + 'Set\settings.txt', 'Режим подсчёта гласных', ':') = 'off' then N32.Checked := false else N32.OnClick(Sender);
      if OpenParam (patch + 'Set\settings.txt', 'Верхняя панель', ':') = 'off' then N33.Checked := false else N33.OnClick(Sender);
      MainForm.Width  := strtoint(OpenParam (patch + 'Set\settings.txt', 'Ширина окна', ':'));
      MainForm.Height := strtoint(OpenParam (patch + 'Set\settings.txt', 'Высота окна', ':'));
      memo1.Font.Name := OpenParam (patch + 'Set\settings.txt', 'Гарнитура', ':');
      memo1.Font.Size := strtoint(OpenParam (patch + 'Set\settings.txt', 'Кегль', ':'));
//      memo3.Font.Name := OpenParam (patch + 'Set\settings.txt', 'Гарнитура', ':');
      memo3.Font.Size := strtoint(OpenParam (patch + 'Set\settings.txt', 'Кегль', ':'));
      memo1.Font.Color := StringToColor(OpenParam (patch + 'Set\settings.txt', 'Цвет шрифта', ':'));
      memo1.Color := StringToColor(OpenParam (patch + 'Set\settings.txt', 'Цвет фона', ':'));
      // Установка левого поля:
      SendMessage( Memo1.Handle, EM_GETRECT, 0, LongInt(@Rect));
      Rect.Left:= strtoint(OpenParam (patch + 'Set\settings.txt', 'Левое поле', ':'));
      SendMessage(Memo1.Handle, EM_SETRECT, 0, LongInt(@Rect));
      Memo1.Refresh;
   end;
//Другое:
//if memo3.Visible = true then Panel2.Visible := true else Panel2.Visible := false;
end;

procedure TMAINFORM.N21Click(Sender: TObject);
begin
AddItemDlg.Show;
end;

procedure TMAINFORM.N25Click(Sender: TObject);
Var
selit : integer;
filedel : string;

SL: TStringList;
begin
selit := ListBox1.ItemIndex;           
filedel := patch + 'Scenario\' + OpenParam (patch + 'Scenario\list.txt', ListBox1.Items[selit], '&');
deletefile(filedel);

   SL := TStringList.Create;
   SL.LoadFromFile(patch + 'Scenario\list.txt');
   SL.Delete(SearchNoSting(patch + 'Scenario\list.txt',ListBox1.Items[selit], '&'));
   SL.SaveToFile(patch + 'Scenario\list.txt');
   SL.Free;

{удаление строки по номеру из файла:
var SL: TStringList;
begin
   SL := TStringList.Create;
   SL.LoadFromFile('tekstfile.txt');
   SL.Delete(5);
   SL.SaveToFile('tekstfile.txt');
   SL.Free;
end;}

ListBox1.DeleteSelected;
memo1.Lines.Clear;
   // Установка активности на созданном пункте:
  listbox1.ItemIndex := listbox1.Items.Count-1;
end;

procedure TMAINFORM.ListBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
   DropPosition, StartPosition: Integer;
   DropPoint: TPoint;
begin
   DropPoint.X := X;
   DropPoint.Y := Y;
   with Source as TListBox do
   begin
     StartPosition := ItemAtPos(StartingPoint,True) ;
     DropPosition := ItemAtPos(DropPoint,True) ;
     Items.Move(StartPosition, DropPosition) ;
   end;
   // Установка активности на перенесённом пункте:
   MainForm.listbox1.ItemIndex := DropPosition;
end;

procedure TMAINFORM.ListBox1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
Accept := Source = ListBox1;
end;

procedure TMAINFORM.ListBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   StartingPoint.X := X;
   StartingPoint.Y := Y;
end;

procedure TMAINFORM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// Сохранение текстухи, если был новый файл:
if (change = true) and (load = '') then
   begin
   buttonSelected := MessageDlg('Сохранить файл?',mtCustom,
                              [mbYes,mbNo,mbCancel], 0);
   if buttonSelected = mrYes then
      if SaveDialog1.Execute then
      begin
      FName := SaveDialog1.FileName;
      Memo1.Lines.SaveToFile(FName);
      end;
   if buttonSelected = mrNo then sleep(1);
   if buttonSelected = mrCancel then Action := caNone;
   end;
// ---
// Сохранение текстухи, если файл был открыт:
if (change = true) and (load <> '') then
   begin
   buttonSelected := MessageDlg('Сохранить файл?',mtCustom,
                              [mbYes,mbNo,mbCancel], 0);
   if buttonSelected = mrYes then
      if SaveDialog1.Execute then
      Memo1.Lines.SaveToFile(load);
   if buttonSelected = mrNo then sleep(1);
   if buttonSelected = mrCancel then Action := caNone;
   end;
// ---

if ListBox1.Items.Count > 0 then
   begin
   ListBox1.Items.SaveToFile(patch + 'Scenario\count.txt');
   if panel3.Visible = true then
      begin
// (пункт должен быть активным для сохранения, активируется при создании):
   Save := patch + 'Scenario\' + OpenParam (patch + 'Scenario\list.txt', ListBox1.Items[ListBox1.ItemIndex], '&');
   memo1.Lines.SaveToFile(save);
      end;
   end;

// Сохранение настроек:
if FileExists(patch + 'Set\settings.txt') then
   begin
   if N20.Checked = true then Ch_Param(patch + 'Set\settings.txt', ':', 'Режим сценария', 'on')
                         else Ch_Param(patch + 'Set\settings.txt', ':', 'Режим сценария', 'off');
   if N32.Checked = true then Ch_Param(patch + 'Set\settings.txt', ':', 'Режим подсчёта гласных', 'on')
                         else Ch_Param(patch + 'Set\settings.txt', ':', 'Режим подсчёта гласных', 'off');
   if N33.Checked = true then Ch_Param(patch + 'Set\settings.txt', ':', 'Верхняя панель', 'on')
                         else Ch_Param(patch + 'Set\settings.txt', ':', 'Верхняя панель', 'off');
   Ch_Param(patch + 'Set\settings.txt', ':', 'Высота окна', inttostr(MainForm.Height));
   Ch_Param(patch + 'Set\settings.txt', ':', 'Ширина окна', inttostr(MainForm.Width));
   Ch_Param(patch + 'Set\settings.txt', ':', 'Гарнитура', memo1.Font.Name);
   Ch_Param(patch + 'Set\settings.txt', ':', 'Кегль', inttostr(memo1.Font.Size));
   Ch_Param(patch + 'Set\settings.txt', ':', 'Цвет шрифта', ColorToString(memo1.Font.Color));
   Ch_Param(patch + 'Set\settings.txt', ':', 'Цвет фона', ColorToString(memo1.Color));
   end;
//procedure Ch_Param(f_name, ch, paramA, paramB : string);
end;

procedure TMAINFORM.ListBox1Click(Sender: TObject);
var
load : string;
begin
memo1.Lines.SaveToFile(save);
load := patch + 'Scenario\' + OpenParam (patch + 'Scenario\list.txt', ListBox1.Items[ListBox1.ItemIndex], '&');
memo1.Lines.LoadFromFile(load);
save := load;
end;

procedure TMAINFORM.N29Click(Sender: TObject);
begin
ReNameDlg.show;
end;

procedure TMAINFORM.Splitter2Moved(Sender: TObject);
begin
panel2.Width := memo3.Width;
//if memo3.Width > 250 then panel2.Width := 250;
// СДЕЛАТЬ СВЯЗЬ С РАЗМЕРОМ ОКНА!!!
end;

procedure TMAINFORM.N30Click(Sender: TObject);
begin
MapForm.Show;
end;

procedure TMAINFORM.N31Click(Sender: TObject);
begin
memo1.SelectAll;
memo1.CopyToClipboard;
end;

procedure TMAINFORM.N32Click(Sender: TObject);
begin
if memo3.Visible = true then
   begin
   memo3.Visible := false;
   splitter2.Visible := false;
//   Panel2.Visible := false;
   N32.Checked := false;
   end else
   begin
   memo3.Visible := true;
   splitter2.Visible := true;
//   Panel2.Visible := true;
   N32.Checked := true;
   end;
if N32.Checked = true then Panel2.Visible := true else Panel2.Visible := false;
end;

procedure TMAINFORM.N33Click(Sender: TObject);
begin
if N33.Checked = true then
   begin
   panel1.Visible := false;
   N33.Checked := false;
   end
   else
   begin
   panel1.Visible := true;
   N33.Checked := true;
   end;
if memo3.Visible = true then Panel2.Visible := true else Panel2.Visible := false;
end;

procedure TMAINFORM.N13Click(Sender: TObject);
begin
FntBgForm.show;
end;

procedure TMAINFORM.Memo1KeyPress(Sender: TObject; var Key: Char);
var
  KeyState : Word;
begin
//Пасхалка:
KeyState := GetKeyState(VK_F5);
if KeyState and $8000 = $8000 then
if Key in ['y'] then
   Memo1.Lines.Add('бородой из хризолита'+#13#10+'крутит времени бураны'+#13#10+'в неолите позабыты'+#13#10+'в ночь уходят графоманы');
end;

procedure TMAINFORM.FormCreate(Sender: TObject);
begin
change := false;
load := '';
// Путь к исполняемомоу файлу:
patch := ExtractFileDir(Application.ExeName) + '\';
//Для открытия файла по "Открыть при помощи..."
if ParamStr(1) <> '' then
   begin
   load := ParamStr(1);
   memo1.Lines.LoadFromFile(ParamStr(1));
   caption := caption + ' : ' + load;
   end;
end;

procedure TMAINFORM.N37Click(Sender: TObject);
begin
DictForm.Show;
end;

procedure TMAINFORM.N38Click(Sender: TObject);
begin
memo1.CutToClipboard;
end;

procedure TMAINFORM.N39Click(Sender: TObject);
begin
memo1.CopyToClipboard;
end;

procedure TMAINFORM.N40Click(Sender: TObject);
begin
memo1.PasteFromClipboard;
end;

procedure TMAINFORM.N41Click(Sender: TObject);
begin
memo1.ClearSelection;
end;

procedure TMAINFORM.N44Click(Sender: TObject);
begin
// Сохранение текстухи, если был новый файл:
if (change = true) and (load = '') then
   begin
   buttonSelected := MessageDlg('Сохранить файл?',mtCustom,
                              [mbYes,mbNo,mbCancel], 0);
   if buttonSelected = mrYes then
      if SaveDialog1.Execute then
      begin
      FName := SaveDialog1.FileName;
      Memo1.Lines.SaveToFile(FName);
      end;
   if buttonSelected = mrNo then sleep(1);
   if buttonSelected = mrCancel then exit;
   end;
// ---
// Сохранение текстухи, если файл был открыт:
if (change = true) and (load <> '') then
   begin
   buttonSelected := MessageDlg('Сохранить файл?',mtCustom,
                              [mbYes,mbNo,mbCancel], 0);
   if buttonSelected = mrYes then
      if SaveDialog1.Execute then
      Memo1.Lines.SaveToFile(load);
   if buttonSelected = mrNo then sleep(1);
   if buttonSelected = mrCancel then exit;
   end;
// ---
memo1.Clear;
caption := nam;
change := false;
end;

procedure TMAINFORM.N28Click(Sender: TObject);
begin
if caption = nam then N17Click(N17)
   else
   begin
   memo1.Lines.SaveToFile(load);
   change := false;
   end;
end;

procedure TMAINFORM.Memo1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if change = true then exit;
case key of
     37, 38, 39, 40, 27, 112, 113, 114, 115, 116, 117, 118, 45, 36,
     119, 120, 121, 122, 123, 44, 145, 19, 16, 17, 18, 20, 33, 34, 35 : change := false;
     else change := true;
     end;
//if change = true then caption := 'Изменилось' else caption := 'Не изменилось';
end;

procedure TMAINFORM.Button1Click(Sender: TObject);
begin
sel_slogi('1-1-1-1');   sel_slogi('1-1-1-1-1');
sel_slogi('2-2-2-2');   sel_slogi('2-2-2-2-2');
sel_slogi('3-3-3-3');   sel_slogi('3-3-3-3-3');
sel_slogi('4-4-4-4');   sel_slogi('4-4-4-4-4');
sel_slogi('5-5-5-5');   sel_slogi('5-5-5-5-5');
sel_slogi('6-6-6-6');   sel_slogi('6-6-6-6-6');

sel_slogi('1-1-'+#13#10+'1-1');



end;

end.
