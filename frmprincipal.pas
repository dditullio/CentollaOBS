unit frmPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, IDEWindowIntf, Forms, Controls, Graphics,
  Dialogs, Menus, ActnList, StdActns, ExtCtrls, ComCtrls, IniPropStorage,
  StdCtrls, Buttons, DbCtrls, frmbase, frmmareas,datGeneral,
  frmlances, frmSplashScreenForm, frmdatosbase,
  frmcapturas, frmmuestras,frmProduccion, frmexportarlances, frmfactoresconversion,
  frmresumenproduccion, frmmarcado, frmmareaaexcel, frmenviosemail, frmbackup;

type

  { TfmPrincipal }

  TfmPrincipal = class(TForm)
    acMareas: TAction;
    acPruebaForm: TAction;
    acLances: TAction;
    acDatosBase: TAction;
    acCapturas: TAction;
    acProduccion: TAction;
    acEnvioEmail: TAction;
    acFactoresConversion: TAction;
    acMuestras: TAction;
    acInformes: TAction;
    acResumenProduccion: TAction;
    acMarcado: TAction;
    acBackup: TAction;
    alPrincipal: TActionList;
    apGeneral: TApplicationProperties;
    BitBtn1: TBitBtn;
    dbtMareaActiva: TDBText;
    FileExit1: TFileExit;
    ilBarra: TImageList;
    ilPrincipal: TImageList;
    Image1: TImage;
    ipsGeneral: TIniPropStorage;
    Label1: TLabel;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    mmPrincipal: TMainMenu;
    paBarraLateral: TPanel;
    paContenido: TPanel;
    paBaseLateral: TPanel;
    Panel1: TPanel;
    pcContenido: TPageControl;
    Splitter1: TSplitter;
    tbPrincipal: TToolBar;
    tbSalir: TToolBar;
    tmHabilitarMenu: TTimer;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    tsInicio: TTabSheet;
    procedure acBackupExecute(Sender: TObject);
    procedure acFactoresConversionExecute(Sender: TObject);
    procedure acCapturasExecute(Sender: TObject);
    procedure acEnvioEmailExecute(Sender: TObject);
    procedure acInformesExecute(Sender: TObject);
    procedure acProduccionExecute(Sender: TObject);
    procedure acLancesExecute(Sender: TObject);
    procedure acMareasExecute(Sender: TObject);
    procedure acMarcadoExecute(Sender: TObject);
    procedure acPruebaFormExecute(Sender: TObject);
    procedure acDatosBaseExecute(Sender: TObject);
    procedure acResumenProduccionExecute(Sender: TObject);
    procedure acMuestrasExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmHabilitarMenuTimer(Sender: TObject);
  private
    { private declarations }
    procedure ActivarForm (F: TfmBase; ImageIndex:integer=-1);
    procedure CerrarOtrasHojas(F:TfmBase);
  public
    { public declarations }
    procedure HabilitarMenu;
  end;

var
  fmPrincipal: TfmPrincipal;
  FormActivo: TfmBase;

implementation

{$R *.lfm}

{ TfmPrincipal }

procedure TfmPrincipal.acPruebaFormExecute(Sender: TObject);
begin
  if Assigned(FormActivo) then
    FormActivo.Free;
  FormActivo:=TfmBase.Create(Self);
  ActivarForm(FormActivo);
end;

procedure TfmPrincipal.acDatosBaseExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(fmDatosBase) then
    fmDatosBase:=TfmDatosBase.Create(Self);
  if (sender is taction) then
    imageindex:=(sender as taction).ImageIndex;
  ActivarForm(fmDatosBase, imageindex);
end;

procedure TfmPrincipal.acResumenProduccionExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(fmResumenProduccion) then
    fmResumenProduccion:=TfmResumenProduccion.Create(Self);
  if (sender is taction) then
    imageindex:=(sender as taction).ImageIndex;
  ActivarForm(fmResumenProduccion, imageindex);
end;

procedure TfmPrincipal.acMuestrasExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(fmMuestras) then
    fmMuestras:=TfmMuestras.Create(Self);
  if (sender is taction) then
    imageindex:=(sender as taction).ImageIndex;
  ActivarForm(fmMuestras, imageindex);
end;

procedure TfmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Width:=720;
  Height:=480;
end;

procedure TfmPrincipal.FormShow(Sender: TObject);
begin
  HideSplashScreen;
  HabilitarMenu;
  Caption:='Centolla OBS - v'+APP_VERSION;
end;

procedure TfmPrincipal.tmHabilitarMenuTimer(Sender: TObject);
begin
  if acDatosBase.Enabled=False then
    HabilitarMenu
  else
    tmHabilitarMenu.Enabled:=False;
end;

procedure TfmPrincipal.acLancesExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(fmLances) then
    fmLances:=TfmLances.Create(Self);
  if (sender is taction) then
    imageindex:=(sender as taction).ImageIndex;
  ActivarForm(fmLances, imageindex);
end;

procedure TfmPrincipal.acCapturasExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(fmCapturas) then
    fmCapturas:=TfmCapturas.Create(Self);
  if (sender is taction) then
    imageindex:=(sender as taction).ImageIndex;
  ActivarForm(fmCapturas, imageindex);
end;

procedure TfmPrincipal.acFactoresConversionExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(fmFactoresConversion) then
    fmFactoresConversion:=TfmFactoresConversion.Create(Self);
  if (sender is taction) then
    imageindex:=(sender as taction).ImageIndex;
  ActivarForm(fmFactoresConversion, imageindex);
end;

procedure TfmPrincipal.acBackupExecute(Sender: TObject);
begin
  CerrarOtrasHojas(nil);
  fmbackup.ShowModal;
end;

procedure TfmPrincipal.acEnvioEmailExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(FmEnviosEmail) then
    FmEnviosEmail:=TFmEnviosEmail.Create(Self);
  //No lo abro en una pestaña, sino en una ventana modal
  // Esto era antes, ahora son una lista y edición normales
  //fmExportarLances.ShowModal;
  if (sender is taction) then
    imageindex:=(sender as taction).ImageIndex;
  ActivarForm(FmEnviosEmail, imageindex);
end;

procedure TfmPrincipal.acInformesExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(fmMareaAExcel) then
    fmMareaAExcel:=TfmMareaAExcel.Create(Self);
  fmMareaAExcel.ShowModal;
end;

procedure TfmPrincipal.acProduccionExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(fmProduccion) then
    fmProduccion:=TfmProduccion.Create(Self);
  if (sender is taction) then
    imageindex:=(sender as taction).ImageIndex;
  ActivarForm(fmProduccion, imageindex);
end;

procedure TfmPrincipal.acMareasExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(fmMareas) then
    fmMareas:=TfmMareas.Create(Self);
  CerrarOtrasHojas(fmMareas);
  if (sender is taction) then
    imageindex:=(sender as taction).ImageIndex;
  ActivarForm(fmMareas, imageindex);
end;

procedure TfmPrincipal.acMarcadoExecute(Sender: TObject);
var
  imageindex: integer=-1;
begin
  if not Assigned(fmMarcado) then
    fmMarcado:=TfmMarcado.Create(Self);
  if (sender is taction) then
    imageindex:=(sender as taction).ImageIndex;
  ActivarForm(fmMarcado, imageindex);
end;

procedure TfmPrincipal.ActivarForm(F: TfmBase; ImageIndex:integer=-1);
var
  i: integer;
  EncontradoEnHoja:integer;
  ts: TTabSheet;
  Rotulo: TCaption;
begin
  if F<>nil then
  begin
    Rotulo:= F.Caption;
    //Buscar si está abierto en alguna pestaña
    EncontradoEnHoja:=-1;
    for i:=0 to pcContenido.PageCount-1 do
    begin
      if pcContenido.Pages[i].Name='ts'+F.Name then
        EncontradoEnHoja:=i;
    end;
    if EncontradoEnHoja=-1 then
    begin
      //Creo una nueva hoja
      ts:=pcContenido.AddTabSheet;
      ts.Name:='ts'+F.Name;
      ts.Caption:=Rotulo;
      ts.ImageIndex:=ImageIndex;
    end else
      ts:=pcContenido.Pages[EncontradoEnHoja];
    F.Parent:= ts;
    F.BorderStyle:=bsNone;
    F.Align:=alClient;
    F.Show;
    pcContenido.ActivePage:=ts;
  end;
end;

procedure TfmPrincipal.CerrarOtrasHojas(F: TfmBase);
var
  i: integer;
  ats: TStringList;
begin
  ats:= TStringList.Create;
  //if F<>nil then
  //begin
    //Buscar si está abierto en alguna pestaña
    for i:=0 to pcContenido.PageCount-1 do
    begin
      if (Assigned(pcContenido.Pages[i])) and ((not Assigned (F)) or (pcContenido.Pages[i].Name<>'ts'+F.Name)) then
        ats.Add(pcContenido.Pages[i].Name);
    end;
  //end;
  for i:=0 to ats.Count-1 do
  begin
    pcContenido.FindComponent(ats[i]).Free;
  end;
  ats.Free;
end;

procedure TfmPrincipal.HabilitarMenu;
var
  i: integer;
begin
  //Habilito acciones de menu
  for i := 0 to Pred(alPrincipal.ActionCount) do
  begin
    if (alPrincipal.Actions[i] is TAction) and (alPrincipal.Actions[i].Tag=0) then
      begin
        (alPrincipal.Actions[i] as TAction).Enabled:=dmGeneral.IdMareaActiva>0;
      end;
  end;
end;

end.

