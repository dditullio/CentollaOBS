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
    dbedPesoCanasto: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    dsDatosGen: TDataSource;
    dsResumen: TDataSource;
    dbdtArribo: TDBDateTimePicker;
    dbdtFinalizacion: TDBDateTimePicker;
    dbdtInicio: TDBDateTimePicker;
    dbdtZarpada: TDBDateTimePicker;
    dbedAnio: TDBEdit;
    dbedCapitan: TDBEdit;
    dbedMareaBuque: TDBEdit;
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
    tsResumen: TTabSheet;
    tsDatosGenerales: TTabSheet;
    zcgDiario: TZControladorGrilla;
    zqDatosGendias_navegados: TLargeintField;
    zqDatosGendias_pesca: TLargeintField;
    zqDatosGenduracion_marea: TLargeintField;
    zqDatosGenidmarea: TLongintField;
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
    zqPrincipalnro_marea_inidep: TLongintField;
    zqPrincipalobservador: TStringField;
    zqPrincipaloficial: TStringField;
    zqPrincipalpeso_caja_producto: TFloatField;
    zqPrincipalpeso_canasto: TFloatField;
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
    procedure dbdtZarpadaEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pcGeneralChange(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject;
      var ValidacionOK: boolean);
    procedure zqDatosGenBeforeOpen(DataSet: TDataSet);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqResumenBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarMarea: TfmEditarMarea;

implementation

{$R *.lfm}

{ TfmEditarMarea }

procedure TfmEditarMarea.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  if (zqPrincipalanio_marea.AsString<>'') and (zqPrincipalmarea_buque.AsString<>'') and (zqPrincipalnro_marea_inidep.AsString<>'') and (not zqPrincipalidbuque.IsNull) then
     zqPrincipalDscMarea.AsString:='Marea '+zqPrincipalnro_marea_inidep.AsString+'/'+
     zqPrincipalanio_marea.AsString+', '+zqPrincipalNombreBuque.AsString+' '+zqPrincipalmarea_buque.AsString;
end;

procedure TfmEditarMarea.dbdtInicioEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMarea.dbdtZarpadaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
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
  end;
end;

procedure TfmEditarMarea.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
    if zqPrincipalmarea_buque.IsNull then
    begin
      ValidacionOK:=False;
      MessageDlg('Debe ingrear la identificación de la marea.', mtError, [mbOK],0);
      if dbedMareaBuque.CanFocus then
         dbedMareaBuque.SetFocus;
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
begin
  zqPrincipalidmarea.Value:=zcePrincipal.NuevoID('mareas');
end;

procedure TfmEditarMarea.zqResumenBeforeOpen(DataSet: TDataSet);
begin
  zqResumen.ParamByName('idmarea').Value:=zqPrincipalidmarea.Value;
end;

end.

