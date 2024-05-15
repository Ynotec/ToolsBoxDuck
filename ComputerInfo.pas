unit ComputerInfo;

interface

Uses
  IdHTTP,
  SysUtils, Windows, ActiveX, ComObj;

type
  TComputerInfo = class
  public
    function GetHostname: string;
    function GetCPUInfo: string;
    function GetRAMInfo: string;
    function GetDiskInfo: string;
    function GetNetworkInfo: string;
    function GetIPAddress: string;
    function GetOs: string;
  end;

implementation

function TComputerInfo.GetOs: string;
begin
  Result := 'Windows 11 Pro';
end;

function TComputerInfo.GetHostname: string;
begin
  Result := GetEnvironmentVariable('COMPUTERNAME');
    if ('' = Result) then
  Result := GetEnvironmentVariable('HOSTNAME');
end;

function TComputerInfo.GetCPUInfo: string;
begin
  Result := GetEnvironmentVariable('PROCESSOR_ARCHITECTURE');
    if ('' = Result) then
  Result := 'Une erreur est survenue..';
end;

function TComputerInfo.GetRAMInfo: string;
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

function TComputerInfo.GetDiskInfo: string;
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

function TComputerInfo.GetNetworkInfo: string;
begin
  // Code pour récupérer les informations réseau
end;

function TComputerInfo.GetIPAddress: string;
begin
  // Code pour récupérer l'adresse IP
end;


end.
