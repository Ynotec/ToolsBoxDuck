unit Hardware;

interface

uses
  IdHTTP,
  SysUtils, Windows, ActiveX, ComObj;

function HasInternet: Boolean;
function getHostname: String;
function getCpu: String;
function getOs: String;
function getRam: String;
function getDd: String;

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
    Result := 'Windows 11 Pro';
  end;

  function getRam: String;
  var
  MemStatus: TMemoryStatusEx;
  begin
    MemStatus.dwLength := SizeOf(TMemoryStatusEx);
    if GlobalMemoryStatusEx(MemStatus) then
    begin
      Result := Format('%d Mo', [MemStatus.ullTotalPhys div 1024 div 1024]);
    end
    else
    begin
      Result := 'Erreur lors de la récupération de la mémoire vive';
    end;
  end;

  function getDd: String;
  var
  FreeAvailable, TotalSpace, FreeSpace: Int64;
  Drive: string;
  begin
    Drive := 'C:\';  // Vous pouvez changer cette lettre en fonction de votre lecteur
    if GetDiskFreeSpaceEx(PChar(Drive), FreeAvailable, TotalSpace, @FreeSpace) then
    begin
      // Conversion des bytes en gigaoctets
      Result := Format('(%s) %.2f Go de libre sur %.2f Go', [Drive,FreeSpace / 1024 / 1024 / 1024 ,TotalSpace / 1024 / 1024 / 1024]);
    end
    else
    begin
      Result := 'Erreur lors de la récupération des informations du disque';

  end;
  end;

end.
