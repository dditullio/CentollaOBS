unit frmEditarMarea;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, rxdbgrid,
  RxDBGridExportSpreadSheet, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, DbCtrls, Buttons, ComCtrls, frmzedicionbase, ZDataset,
  SQLQueryGroup, zcontroladoredicion, zdatasetgroup, zcontroladorgrilla, db,
  datGeneral;

type

  { TfmEditarMarea }

  TfmEditarMarea = class(TZEdicionBase)
    bbExportar: TBitBtn;
    dbdtInicioTemporada: TDBDateTimePicker;
    dbedMareaInidep1: TDBEdit;
    dbedPesoCanasto: TDBEdit;
    dbmComentarios: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    dsDatosGen: TDataSource;
    dsResumen: TDataSource;
    dbdtArribo: TDBDateTimePicker;
    dbdtFinalizacion: TDBDateTimePicker;
    dbdtInicio: TDBDateTimePicker;
    dbdtZarpada: TDBDateTimePicker;
    dbedAnio: TDBEdit;
    dbedCapitan: TDBEdit;
    dbedMareaInidep: TDBEdit;
    dbedObservador: TDBEdit;
    dbedOficial: TDBEdit;
    dbedPesoCajaProd: TDBEdit;
    dblkBuque: TDBLookupComboBox;
    dsBuques: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    gbGeneral: TGroupBox;
    dbDiario: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    paBaseResumen: TPanel;
    Panel1: TPanel;
    paCalculando: TPanel;
    pcGeneral: TPageControl;
    paFondo: TPanel;
    rxdbgDiario: TRxDBGrid;
    dbgeExportar: TRxDBGridExportSpreadSheet;
    sdExportar: TSaveDialog;
    zqPrincipalPrefijoBuque: TStringField;
    tsComentarios: TTabSheet;
    tsResumen: TTabSheet;
    tsDatosGenerales: TTabSheet;
    zcgDiario: TZControladorGrilla;
    zqBuquescod_buque: TLongintField;
    zqBuquesprefijo_marea: TStringField;
    zqDatosGendias_navegados: TLargeintField;
    zqDatosGendias_pesca: TLargeintField;
    zqDatosGenduracion_marea: TLargeintField;
    zqDatosGenidmarea: TLongintField;
    zqPrincipalcomentarios: TStringField;
    zqPrincipalfecha_inicio_temporada: TDateField;
    zqPrincipalNombreBuque: TStringField;
    zqBuques: TZQuery;
    zqBuquesidbuque: TLongintField;
    zqBuquesnombre: TStringField;
    zqPrincipalanio_marea: TLongintField;
    zqPrincipalcapitan: TStringField;
    zqPrincipalDscMarea: TStringField;
    zqPrincipalfecha_arribo: TDateField;
    zqPrincipalfecha_finalizacion: TDateField;
    zqPrincipalfecha_inicio: TDateField;
    zqPrincipalfecha_zarpada: TDateField;
    zqPrincipalidbuque: TLongintField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalmarea_buque: TStringField;
    zqPrincipalnro_marea_buque: TLongintField;
    zqPrincipalnro_marea_inidep: TLongintField;
    zqPrincipalobservador: TStringField;
    zqPrincipaloficial: TStringField;
    zqPrincipalpeso_caja_producto: TFloatField;
    zqPrincipalpeso_canasto: TFloatField;
    zqPrincipalTemporada: TStringField;
    zqResumen: TZQuery;
    zqResumenfecha: TDateField;
    zqResumenidmarea: TLongintField;
    zqResumenl_caladas: TLargeintField;
    zqResumenl_viradas: TLargeintField;
    zqResumenm_captura: TLargeintField;
    zqResumenm_tallas: TLargeintField;
    zqDatosGen: TZQuery;
    procedure dbdtArriboEnter(Sender: TObject);
    procedure dbdtFinalizacionEnter(Sender: TObject);
    procedure dbdtInicioEnter(Sender: TObject);
    procedure dbdtInicioTemporadaExit(Sender: TObject);
    procedure dbdtZarpadaEnter(Sender: TObject);
    procedure dbedMareaInidep1Exit(Sender: TObject);
    procedure dblkBuqueChange(Sender: TObject);
    procedure dblkBuqueExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pcGeneralChange(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject;
      var ValidacionOK: boolean);
    procedure zqDatosGenBeforeOpen(DataSet: TDataSet);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalidbuqueChange(Sender: TField);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqResumenBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
    function GetCodMareaProyCentolla: string;
    procedure SetCodMareaProyCentolla;
  public
    { public declarations }
  end;

var
  fmEditarMarea: TfmEditarMarea;

implementation

{$R *.lfm}

{ TfmEditarMarea }

procedure TfmEditarMarea.zqPrincipalCalcFields(DataSet: TDataSet);
var
  dia, mes, anio: Word;
begin
  if (zqPrincipalanio_marea.AsString<>'') and (zqPrincipalmarea_buque.AsString<>'') and (zqPrincipalnro_marea_inidep.AsString<>'') and (not zqPrincipalidbuque.IsNull) then
     zqPrincipalDscMarea.AsString:='Marea '+zqPrincipalnro_marea_inidep.AsString+'/'+
     zqPrincipalanio_marea.AsString+', '+zqPrincipalNombreBuque.AsString+' '+zqPrincipalmarea_buque.AsString;
  if not zqPrincipalfecha_inicio_temporada.IsNull then
  begin
    DecodeDate(zqPrincipalfecha_inicio_temporada.AsDateTime, anio, mes,dia);
    zqPrincipalTemporada.AsString:=IntToStr(anio-2000)+'-'+IntToStr(anio-1999);
  end;
end;

procedure TfmEditarMarea.zqPrincipalidbuqueChange(Sender: TField);
begin
    SetCodMareaProyCentolla;
end;

procedure TfmEditarMarea.dbdtInicioEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMarea.dbdtInicioTemporadaExit(Sender: TObject);
begin
  SetCodMareaProyCentolla;
end;

procedure TfmEditarMarea.dbdtZarpadaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMarea.dbedMareaInidep1Exit(Sender: TObject);
begin
    SetCodMareaProyCentolla;
end;

procedure TfmEditarMarea.dblkBuqueChange(Sender: TObject);
begin
end;

procedure TfmEditarMarea.dblkBuqueExit(Sender: TObject);
begin
    SetCodMareaProyCentolla;
end;

procedure TfmEditarMarea.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  // Si la está dando de alta, la establezco inmediatamente como activa
  if zcePrincipal.Accion=ED_AGREGAR then
     dmGeneral.IdMareaActiva:=zqPrincipalidmarea.Value;
  dmGeneral.zqMareaActiva.Close;
  dmGeneral.zqMareaActiva.Open;
end;

procedure TfmEditarMarea.FormShow(Sender: TObject);
begin
  pcGeneral.ActivePage:=tsDatosGenerales;
end;

procedure TfmEditarMarea.pcGeneralChange(Sender: TObject);
begin
  if pcGeneral.ActivePage=tsResumen then
  begin
    paCalculando.Visible:=True;
    Application.ProcessMessages;
    zqResumen.Close;
    zqResumen.Open;
    zqDatosGen.Close;
    zqDatosGen.Open;
    paCalculando.Visible:=False;
    if rxdbgDiario.CanFocus then
      rxdbgDiario.SetFocus;
    zcgDiario.HabilitarAcciones;
  end else if pcGeneral.ActivePage=tsComentarios then
  begin
    if dbmComentarios.CanFocus then
    dbmComentarios.SetFocus;
  end;
end;

procedure TfmEditarMarea.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
    if zqPrincipalmarea_buque.IsNull then
    begin
      ValidacionOK:=False;
      MessageDlg('Debe identificar la marea indicando año y N° de marea (OBS y buque), fecha de inicio de temporada y nombre del buque.', mtError, [mbOK],0);
      if dbdtInicioTemporada.CanFocus then
         dbdtInicioTemporada.SetFocus;
    end;
end;

procedure TfmEditarMarea.zqDatosGenBeforeOpen(DataSet: TDataSet);
begin
  zqDatosGen.ParamByName('idmarea').Value:=zqPrincipalidmarea.Value;
end;

procedure TfmEditarMarea.dbdtArriboEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMarea.dbdtFinalizacionEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMarea.zqPrincipalNewRecord(DataSet: TDataSet);
var
  dia, mes, anio: Word;
begin
  zqPrincipalidmarea.Value:=zcePrincipal.NuevoID('mareas');
  DecodeDate(Date, anio, mes,dia);
  zqPrincipalanio_marea.AsInteger:=anio;
  if mes <= 7 then
    zqPrincipalfecha_inicio_temporada.AsDateTime:=EncodeDate(anio-1, 10,1)
  else
    zqPrincipalfecha_inicio_temporada.AsDateTime:=EncodeDate(anio, 10,1);
end;

procedure TfmEditarMarea.zqResumenBeforeOpen(DataSet: TDataSet);
begin
  zqResumen.ParamByName('idmarea').Value:=zqPrincipalidmarea.Value;
end;

function TfmEditarMarea.GetCodMareaProyCentolla: string;
begin
  result:= zqPrincipalPrefijoBuque.AsString+'-'+RightStr('0'+zqPrincipalnro_marea_buque.AsString,2)+'-'+zqPrincipalTemporada.AsString;
end;

procedure TfmEditarMarea.SetCodMareaProyCentolla;
begin
    if not (dsPrincipal.State in [dsInsert, dsEdit]) then
       dsPrincipal.Edit;
    zqPrincipalmarea_buque.AsString:=GetCodMareaProyCentolla;
end;

end.

