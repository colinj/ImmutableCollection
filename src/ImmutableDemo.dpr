program ImmutableDemo;

uses
  Vcl.Forms,
  fmMain in 'fmMain.pas' {Form1},
  ImmutableCollections in 'ImmutableCollections.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
