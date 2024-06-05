unit Reseau;

interface

uses
  System.SysUtils, Winapi.Windows,IdHTTP, ActiveX, ComObj, FMX.Memo, IdTCPClient ;

function TestHTTP(Memo: TMemo): Boolean;
procedure PingIP(AIPAddress: string; Memo: TMemo);
procedure TestTCP(const AIPAddress: string; APort: Integer; Memo: TMemo);

implementation

uses
    System.Net.HttpClient, System.Net.URLClient,IdIcmpClient;



function TestHTTP(Memo: TMemo): Boolean;
var
  Client: THTTPClient;
  Response: IHTTPResponse;
begin
  Client := THTTPClient.Create;
  try
    try
      Response := Client.Get(string(Memo.Lines.Text));
      Result := Response.StatusCode = 200;
    except
      on E: ENetHTTPClientException do
        Result := False;
    end;
  finally
    Client.Free;
  end;
end;




procedure PingIP(AIPAddress: string; Memo: TMemo);
var
  ICMPClient: TIdIcmpClient;
begin
  ICMPClient := TIdIcmpClient.Create(nil);
  try
    ICMPClient.Host := AIPAddress;
    ICMPClient.ReceiveTimeout := 5000; // Temps d'attente en millisecondes

    Memo.Lines.Add('Ping '+ AIPAddress + '...');
    ICMPClient.Ping;

    if ICMPClient.ReplyStatus.ReplyStatusType = rsEcho then
      Memo.Lines.Add('Réponse de ' + AIPAddress + ': bytes=' +
        IntToStr(ICMPClient.ReplyStatus.BytesReceived) + ' time=' +
        IntToStr(ICMPClient.ReplyStatus.MsRoundTripTime) + 'ms')
    else
      Memo.Lines.Add('Pas de réponse ' + AIPAddress);
  finally
    ICMPClient.Free;
  end;
end;

procedure TestTCP(const AIPAddress: string; APort: Integer; Memo: TMemo);
var
  TCPClient: TIdTCPClient;
begin
  TCPClient := TIdTCPClient.Create(nil);
  try
    TCPClient.Host := AIPAddress;
    TCPClient.Port := APort;
    Memo.Lines.Add('Test de connexion TCP IP : ' + AIPAddress + ' Port : ' + IntToStr(APort) + '...');
    try
      TCPClient.ConnectTimeout := 5000;
      TCPClient.Connect;
      if TCPClient.Connected then
      begin
        Memo.Lines.Add('Connexion réussie IP : ' + AIPAddress + ' Port : ' + IntToStr(APort));
        TCPClient.Disconnect;
      end
      else
      begin
        Memo.Lines.Add('Connexion échouée IP : ' + AIPAddress + ' Port : ' + IntToStr(APort));
      end;
    except
      on E: Exception do
        Memo.Lines.Add('Erreur : ' + E.Message);
    end;
  finally
    TCPClient.Free;
  end;
end;


end.
