program ToolsBox;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Index},
  Hardware in 'Hardware.pas',
  ComputerInfo in 'ComputerInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TIndex, Index);
  Application.Run;
end.
