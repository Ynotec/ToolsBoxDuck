unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.MaterialSources, FMX.Layouts, FMX.ExtCtrls, FMX.Objects, FMX.Ani,
  FMX.StdCtrls, FMX.Controls.Presentation, ClassComputerInfo, IdBaseComponent,
  IdComponent, IdCustomTransparentProxy, IdSocks;

type
  TFormIndex = class(TForm)
    BarreMenuVertical: TRectangle;
    Fond: TRectangle;
    ColorKeyAnimation1: TColorKeyAnimation;
    Titre: TLabel;
    BtnHardware: TCornerButton;
    IconHardware: TImage;
    BtnReseau: TCornerButton;
    IconReseau: TImage;
    StyleBook1: TStyleBook;
    BtnTools: TCornerButton;
    IconTools: TImage;
    PanelHardware: TPanel;
    IconInfoHardware: TImage;
    TitreInfoHw: TLabel;
    PanelReseau: TPanel;
    IconInfoReseau: TImage;
    TitreInfoReseau: TLabel;
    PanelTools: TPanel;
    IconInfoTools: TImage;
    TitreInfoTools: TLabel;
    Hostname: TLabel;
    Os: TLabel;
    Cpu: TLabel;
    Ram: TLabel;
    Dd: TLabel;
    Health: TLabel;
    HostnameOutput: TLabel;
    OsOutput: TLabel;
    CpuOutput: TLabel;
    RamOutput: TLabel;
    DdOutput: TLabel;
    AdressIp: TLabel;
    AdressIpOutput: TLabel;
    procedure BtnHardwareClick(Sender: TObject);
    procedure BtnReseauClick(Sender: TObject);
    procedure BtnToolsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  TForm: TFormIndex;

implementation

{$R *.fmx}

procedure TFormIndex.BtnHardwareClick(Sender: TObject);
begin
  PanelReseau.Visible   := False;
  PanelTools.Visible    := False;
  PanelHardware.Visible := True;
end;

procedure TFormIndex.BtnReseauClick(Sender: TObject);
begin
  PanelHardware.Visible := False;
  PanelTools.Visible    := False;
  PanelReseau.Visible   := True;
end;

procedure TFormIndex.BtnToolsClick(Sender: TObject);
begin
  PanelReseau.Visible   := False;
  PanelHardware.Visible := False;
  PanelTools.Visible    := True;

end;


procedure TFormIndex.FormShow(Sender: TObject);
var
  ComputerInfoNew : ComputerInfo;
begin
  ComputerInfoNew := ComputerInfo.Create;
  try
    // Information Hardware
    HostnameOutput.Text := ComputerInfoNew.GetHostname;
    OsOutput.Text       := ComputerInfoNew.GetOs;
    CpuOutput.Text      := ComputerInfoNew.GetCPUInfo;
    RamOutput.Text      := ComputerInfoNew.GetRAMInfo;
    DdOutput.Text       := ComputerInfoNew.GetDiskInfo;

    // Information R�seau
    ComputerInfoNew.GetNetworkInfo;
    AdressIpOutput.Text := ComputerInfoNew.IPAddress;
  finally
    ComputerInfoNew.Free;
  end;


end;

end.
