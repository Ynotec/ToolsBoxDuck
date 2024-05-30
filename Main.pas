unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.MaterialSources, FMX.Layouts, FMX.ExtCtrls, FMX.Objects, FMX.Ani,
  FMX.StdCtrls, FMX.Controls.Presentation, ClassComputerInfo, IdBaseComponent,
  IdComponent, IdCustomTransparentProxy, IdSocks, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.ListBox;

type
  TFormIndex = class(TForm)
    BarreMenuVertical: TRectangle;
    Fond: TRectangle;
    ColorKeyAnimation1: TColorKeyAnimation;
    Titre: TLabel;
    BtnHardware: TCornerButton;
    IconHardware: TImage;
    BtnNetwork: TCornerButton;
    IconReseau: TImage;
    StyleBook1: TStyleBook;
    BtnTools: TCornerButton;
    IconTools: TImage;
    PanelHardware: TPanel;
    IconInfoHardware: TImage;
    TitreInfoHw: TLabel;
    PanelNetwork: TPanel;
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
    ReseauInfo: TMemo;
    ComboBox1: TComboBox;
    procedure BtnHardwareClick(Sender: TObject);
    procedure BtnNetworkClick(Sender: TObject);
    procedure BtnToolsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

  private
    { Déclarations privées }
    procedure SwitchBtnColor;
    procedure PanelSwitchVisible(VisiblePanel: TPanel);
  public
    { Déclarations publiques }
  end;

var
  TForm: TFormIndex;
  ComputerInfoNew : TComputerInfo;

implementation

{$R *.fmx}

procedure TFormIndex.SwitchBtnColor;
begin
  // Changement du style des boutons du menu
  if PanelNetwork.Visible then
    BtnNetwork.StyleLookup := 'CornerOnBtn'
  else
    BtnNetwork.StyleLookup := 'BtnInterface';

  if PanelHardware.Visible then
    BtnHardware.StyleLookup := 'CornerOnBtn'
  else
    BtnHardware.StyleLookup := 'BtnInterface';

  if PanelTools.Visible then
    BtnTools.StyleLookup := 'CornerOnBtn'
  else
    BtnTools.StyleLookup := 'BtnInterface';
end;

procedure TFormIndex.PanelSwitchVisible(VisiblePanel: TPanel);
begin
  // Routing des panels à afficher
  PanelNetwork.Visible   := False;
  PanelTools.Visible    := False;
  PanelHardware.Visible := False;


  VisiblePanel.Visible := True;
  SwitchBtnColor;
end;

procedure TFormIndex.BtnHardwareClick(Sender: TObject);
begin
  PanelSwitchVisible(PanelHardware);
end;

procedure TFormIndex.BtnNetworkClick(Sender: TObject);
begin
  PanelSwitchVisible(PanelNetwork);
end;

procedure TFormIndex.BtnToolsClick(Sender: TObject);
begin
  PanelSwitchVisible(PanelTools);
end;

procedure TFormIndex.ComboBox1Change(Sender: TObject);
begin
  ComputerInfoNew.GetNetworkInterfaces(ComboBox1, ReseauInfo);
end;

procedure TFormIndex.FormShow(Sender: TObject);
begin
  ComputerInfoNew := TComputerInfo.Create;
  SwitchBtnColor;
  try
    // Information Hardware
    HostnameOutput.Text := ComputerInfoNew.GetHostname;
    OsOutput.Text       := ComputerInfoNew.GetOs;
    CpuOutput.Text      := ComputerInfoNew.GetCPUInfo;
    RamOutput.Text      := ComputerInfoNew.GetRAMInfo;
    DdOutput.Text       := ComputerInfoNew.GetDiskInfo;

    // Information Réseau
    ComputerInfoNew.GetNetworkInfo(ComboBox1);
    ReseauInfo.ReadOnly := True;
    ComboBox1.ItemIndex := 0;




  finally

  end;




end;

end.
