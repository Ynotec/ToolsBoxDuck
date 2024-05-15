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
begin
  // Code pour récupérer les informations RAM
end;

function TComputerInfo.GetDiskInfo: string;
begin
  // Code pour récupérer les informations sur le disque dur
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
