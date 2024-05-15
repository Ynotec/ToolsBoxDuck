unit Hardware;

interface

uses
  IdHTTP,
  SysUtils, Windows, ActiveX, ComObj;

function HasInternet: Boolean;
function getHostname: String;
function getCpu: String;
function getOs: String;

implementation

// Check Internet
  uses
    System.Net.HttpClient;

  function HasInternet: Boolean;
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

  function getHostname: String;
  begin
      Result := GetEnvironmentVariable('COMPUTERNAME');
    if ('' = Result) then
      Result := GetEnvironmentVariable('HOSTNAME');
  end;

  function getCpu: String;
  begin
      Result := GetEnvironmentVariable('PROCESSOR_ARCHITECTURE');
    if ('' = Result) then
      Result := 'Une erreur est survenue..';
  end;

  function getOs: String;
  begin
      Result := GetEnvironmentVariable('OS');
    if ('' = Result) then
      Result := 'Une erreur est survenue..';
  end;


end.
