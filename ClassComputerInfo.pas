unit ClassComputerInfo;

interface

Uses
  IdHTTP,
  IpHlpApi, Winsock2, IpTypes,
  SysUtils, Windows, ActiveX, ComObj;

type
  ComputerInfo = class
  public
    AdapterName: String;
    IPAddress: String;
    SubnetMask: String;
    Gateway: String;

    function GetHostname: string;
    function GetCPUInfo: string;
    function GetRAMInfo: string;
    function GetDiskInfo: string;
    function GetNetworkInfo: string;
    function GetOs: string;
  end;

implementation

function ComputerInfo.GetOs: string;
begin
  Result := 'Windows 11 Pro';
end;

function ComputerInfo.GetHostname: string;
begin
  Result := GetEnvironmentVariable('COMPUTERNAME');
    if ('' = Result) then
  Result := GetEnvironmentVariable('HOSTNAME');
end;

function ComputerInfo.GetCPUInfo: string;
begin
  Result := GetEnvironmentVariable('PROCESSOR_ARCHITECTURE');
    if ('' = Result) then
  Result := 'Une erreur est survenue..';
end;

function ComputerInfo.GetRAMInfo: string;
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

function ComputerInfo.GetDiskInfo: string;
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

function ComputerInfo.GetNetworkInfo: string;
var
  AdapterInfo: PIP_ADAPTER_INFO;
  AdapterInfoSize: ULONG;
  RetVal: DWORD;

begin
  AdapterInfoSize := SizeOf(IP_ADAPTER_INFO);
  GetMem(AdapterInfo, AdapterInfoSize);
    try
      RetVal := GetAdaptersInfo(AdapterInfo, AdapterInfoSize);
      if RetVal = ERROR_BUFFER_OVERFLOW then
      begin
        FreeMem(AdapterInfo);
        GetMem(AdapterInfo, AdapterInfoSize);
        RetVal := GetAdaptersInfo(AdapterInfo, AdapterInfoSize);
      end;

      if RetVal = NO_ERROR then
      begin
          AdapterName := AdapterInfo^.Description;
          IPAddress   := AdapterInfo^.IpAddressList.IpAddress.S;
          SubnetMask  := AdapterInfo^.IpAddressList.IpMask.S;
          Gateway     := AdapterInfo^.GatewayList.IpAddress.S;
          AdapterInfo := AdapterInfo^.Next;
      end
    finally
      FreeMem(AdapterInfo);
    end;
  end;

