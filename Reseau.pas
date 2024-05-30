unit Reseau;

interface

uses
  System.SysUtils, Winapi.Windows,IdHTTP, ActiveX, ComObj ;

function TestConnection(const IPAddress: string; const Port: string = ''): string;
function TestHTTP: Boolean;

implementation

uses
    System.Net.HttpClient;

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

function TestHTTP: Boolean;
  var
    Client: THTTPClient;
  begin
    Client := THTTPClient.Create;
    try
      try
        Client.Get('http://www.Google.com/');
        Result := True;
      except
        Result := False;
      end;
    finally
      Client.Free;
    end;
  end;

end.
