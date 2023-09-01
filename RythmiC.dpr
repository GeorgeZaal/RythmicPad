program RythmiC;

uses
  Forms,
  Unit1 in 'Unit1.pas' {MAINFORM},
  Unit2 in 'Unit2.pas' {AboutForm},
  Unit3 in 'Unit3.pas' {ChartForm},
  Unit4 in 'Unit4.pas' {SpectroForm},
  Unit5 in 'Unit5.pas' {FrequencyForm},
  Unit6 in 'Unit6.pas' {MapForm},
  Unit7 in 'Unit7.pas' {StatForm},
  Unit8 in 'Unit8.pas' {AddItemDlg},
  Unit9 in 'Unit9.pas' {ReNameDlg},
  Unit10 in 'Unit10.pas' {FntBgForm},
  Unit11 in 'Unit11.pas' {DictForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMAINFORM, MAINFORM);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TChartForm, ChartForm);
  Application.CreateForm(TSpectroForm, SpectroForm);
  Application.CreateForm(TFrequencyForm, FrequencyForm);
  Application.CreateForm(TMapForm, MapForm);
  Application.CreateForm(TStatForm, StatForm);
  Application.CreateForm(TAddItemDlg, AddItemDlg);
  Application.CreateForm(TReNameDlg, ReNameDlg);
  Application.CreateForm(TFntBgForm, FntBgForm);
  Application.CreateForm(TDictForm, DictForm);
  Application.Run;
end.
