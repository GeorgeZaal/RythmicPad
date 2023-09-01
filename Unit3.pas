unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TChartForm = class(TForm)
    Chart1: TChart;
    Series1: TBarSeries;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    procedure ReCount;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChartForm: TChartForm;

implementation

uses Unit1;

{$R *.dfm}

procedure TChartForm.ReCount;
var
i : integer;
begin
Series1.Clear;
for i := 0 to MainForm.memo2.Lines.Count do
if MainForm.memo2.Lines[i] <> '' then Series1.Add(strtoint(MainForm.memo2.Lines[i]), '', clYellow);
end;

procedure TChartForm.SpeedButton1Click(Sender: TObject);
begin
ReCount;
end;

end.
