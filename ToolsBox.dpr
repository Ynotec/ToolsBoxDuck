program ToolsBox;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {FormIndex},
  ClassComputerInfo in 'ClassComputerInfo.pas',
  Reseau in 'Reseau.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormIndex, TForm);
  Application.Run;
end.
