unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.MaterialSources, FMX.Layouts, FMX.ExtCtrls, FMX.Objects, FMX.Ani,
  FMX.StdCtrls, FMX.Controls.Presentation, ComputerInfo;

type
  TIndex = class(TForm)
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
    procedure BtnHardwareClick(Sender: TObject);
    procedure BtnReseauClick(Sender: TObject);
    procedure BtnToolsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Index: TIndex;

implementation

{$R *.fmx}

procedure TIndex.BtnHardwareClick(Sender: TObject);
begin
  PanelReseau.Visible   := False;
  PanelTools.Visible    := False;
  PanelHardware.Visible := True;
end;

procedure TIndex.BtnReseauClick(Sender: TObject);
begin
  PanelHardware.Visible := False;
  PanelTools.Visible    := False;
  PanelReseau.Visible   := True;
end;

procedure TIndex.BtnToolsClick(Sender: TObject);
begin
  PanelReseau.Visible   := False;
  PanelHardware.Visible := False;
  PanelTools.Visible    := True;

end;


procedure TIndex.FormShow(Sender: TObject);
var
  ComputerInfo : TComputerInfo;
begin
  ComputerInfo := TComputerInfo.Create;
  try
    HostnameOutput.Text := ComputerInfo.GetHostname;
    OsOutput.Text       := ComputerInfo.GetOs;
    CpuOutput.Text      := ComputerInfo.GetCPUInfo;
    RamOutput.Text      := ComputerInfo.GetRAMInfo;
    DdOutput.Text       := ComputerInfo.GetDiskInfo;
  finally
    ComputerInfo.Free;
  end;


end;

end.
