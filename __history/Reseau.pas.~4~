unit Reseau;

interface

uses
  System.SysUtils, Winapi.Windows;

function TestConnection(const IPAddress: string; const Port: string = ''): string;

implementation



function TestConnection(const IPAddress: string; const Port: string = ''): string;
var
  Command: string;
begin
  if Port = '' then
    Command := Format('ping %s', [IPAddress])
  else
    Command := Format('powershell.exe -Command "Test-NetConnection %s -Port %s"', [IPAddress, Port]);

  Result := (Command);
end;

end.
