program Project1;

uses
  Forms,
  FrmMain in 'FrmMain.pas' {Form1},
  UnitVideoPlay in 'UnitVideoPlay.pas' {FrmVideoPlay};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmVideoPlay, FrmVideoPlay);
  Application.Run;
end.
