unit frmeditarlances;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, rxdbgrid, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, ComCtrls,
  frmzedicionbase, ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup,
  zcontroladorgrilla, DtDBEdit, DtDBTimeEdit, dtdbcoordedit, db, datGeneral,
  LSRegEx, funciones, dateutils;

type

  { TfmEditarLances }

  TfmEditarLances = class(TZEdicionBase)
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    dbdtFechaIniCalado: TDBDateTimePicker;
    dbdtFechaFinCalado: TDBDateTimePicker;
    dbdtFechaIniVirada: TDBDateTimePicker;
    dbdtFechaFinVirada: TDBDateTimePicker;
    dbdtHoraFinCalado: TDtDBTimeEdit;
    dbdtHoraFinVirada: TDtDBTimeEdit;
    dbdtHoraIniCalado: TDtDBTimeEdit;
    dbdtHoraIniVirada: TDtDBTimeEdit;
    dbedKgCarnada: TDBEdit;
    dbedLatFinCalado: TDtDBCoordEdit;
    dbedLatFinVirada: TDtDBCoordEdit;
    dbedLatIniCalado: TDtDBCoordEdit;
    dbedLatIniVirada: TDtDBCoordEdit;
    dbedLongFinCalado: TDtDBCoordEdit;
    dbedLongFinVirada: TDtDBCoordEdit;
    dbedLongIniCalado: TDtDBCoordEdit;
    dbedLongIniVirada: TDtDBCoordEdit;
    dbedDistTpas: TDBEdit;
    dbedNroLance: TDBText;
    dbedProfIniCalado: TDBEdit;
    dbedRumbo: TDBEdit;
    dbedProfFinCalado: TDBEdit;
    dbedProfIniVirada: TDBEdit;
    dbedProfFinVirada: TDBEdit;
    dbedCanastos: TDBEdit;
    dbedClusterCanasto: TDBEdit;
    dbedTrampasCaladas: TDBEdit;
    dbedBoya: TDBEdit;
    dblkCarnada: TDBLookupComboBox;
    dblkTipoTrampas: TDBLookupComboBox;
    dbmComentarios: TDBMemo;
    dbmComentarios1: TDBMemo;
    dbtDistCalado: TDBText;
    dbtDistTrampas: TDBText;
    dbtRumbo: TDBText;
    dbtDistTrampas2: TDBText;
    dbtDistVirada: TDBText;
    dbtTiempoCalado: TDBText;
    dbtTiempoVirada: TDBText;
    dbtVelocCalado: TDBText;
    dbtVelocVirada: TDBText;
    gbComentarios: TGroupBox;
    gbComentarios1: TGroupBox;
    gbInformacion1: TGroupBox;
    gbInicioCalado: TGroupBox;
    gbFinCalado: TGroupBox;
    gbDatosInicio2: TGroupBox;
    gbDatosInicio3: TGroupBox;
    gbInformacion: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    laDistTrampas: TLabel;
    laDistancia: TLabel;
    laDistancia1: TLabel;
    laDistTrampas2: TLabel;
    LargeintField1: TLargeintField;
    laTiempo: TLabel;
    laTiempo1: TLabel;
    laVelocidad: TLabel;
    laVelocidad1: TLabel;
    Panel2: TPanel;
    StringField1: TStringField;
    StringField2: TStringField;
    zqDatosLineas: TZQuery;
    zqDatosLineascalada: TLongintField;
    zqDatosLineascalada2: TLargeintField;
    zqDatosLineascant_trampas: TLargeintField;
    zqDatosLineasdistancia_entre_trampas: TLargeintField;
    zqDatosLineasidmarea: TLongintField;
    zqDatosLineasidtipo_trampa: TLongintField;
    zqDatosLineasinvestigacion: TSmallintField;
    zqDatosLineasnro_boya: TLongintField;
    zqDatosLineasnro_linea: TLongintField;
    zqAntLance: TZQuery;
    zqAntLancecanastos_procesados: TLongintField;
    zqAntLancecant_trampas_caladas: TLongintField;
    zqAntLancecluster_por_canasto: TLongintField;
    zqAntLancecod_estado_mar: TLongintField;
    zqAntLancecomentarios_calado: TStringField;
    zqAntLancecomentarios_virada: TStringField;
    zqAntLancedireccion_viento: TLongintField;
    zqAntLanceenviado_calado: TSmallintField;
    zqAntLanceenviado_virado: TSmallintField;
    zqAntLancefecha_fin_calado: TDateField;
    zqAntLancefecha_fin_virada: TDateField;
    zqAntLancefecha_ini_calado: TDateField;
    zqAntLancefecha_ini_virada: TDateField;
    zqAntLancehora_fin_calado: TTimeField;
    zqAntLancehora_fin_virada: TTimeField;
    zqAntLancehora_ini_calado: TTimeField;
    zqAntLancehora_ini_virada: TTimeField;
    zqAntLanceidcarnada: TLongintField;
    zqAntLanceidlance: TLongintField;
    zqAntLanceidmarea: TLongintField;
    zqAntLanceinvestigacion: TSmallintField;
    zqAntLancekg_carnada: TFloatField;
    zqAntLancelat_fin_calado: TFloatField;
    zqAntLancelat_fin_virada: TFloatField;
    zqAntLancelat_ini_calado: TFloatField;
    zqAntLancelat_ini_virada: TFloatField;
    zqAntLancelong_fin_calado: TFloatField;
    zqAntLancelong_fin_virada: TFloatField;
    zqAntLancelong_ini_calado: TFloatField;
    zqAntLancelong_ini_virada: TFloatField;
    zqAntLancenro_lance: TLongintField;
    zqAntLancenudos_viento: TLongintField;
    zqAntLanceprofundidad_fin_calado: TLongintField;
    zqAntLanceprofundidad_fin_virada: TLongintField;
    zqAntLanceprofundidad_ini_calado: TLongintField;
    zqAntLanceprofundidad_ini_virada: TLongintField;
    zqAntLanceprospeccion: TSmallintField;
    zqAntLancerumbo_calado: TLongintField;
    zqOrdenViradaidlance: TLongintField;
    zqOrdenViradaidmarea: TLongintField;
    zqOrdenViradaorden_virada: TLargeintField;
    zqPrincipaldistancia_entre_trampas: TLongintField;
    zqPrincipalDistCalado: TFloatField;
    zqPrincipalDistVirada: TFloatField;
    zqPrincipaldist_trampas_prom_calado: TFloatField;
    zqPrincipaldist_trampas_prom_virada: TFloatField;
    zqPrincipalenviado: TSmallintField;
    zqPrincipalidtipo_trampa: TLongintField;
    zqPrincipalinvestigacion: TSmallintField;
    zqPrincipalnro_boya: TLongintField;
    zqPrincipalnro_linea: TLongintField;
    zqPrincipalRumboCaladoCalc: TFloatField;
    zqPrincipalTiempoCalado: TFloatField;
    zqPrincipalTiempoVirada: TFloatField;
    paFechaHora: TPanel;
    paFechaHora1: TPanel;
    paFechaHora2: TPanel;
    paFechaHora3: TPanel;
    Panel1: TPanel;
    pcLances: TPageControl;
    tsVirada: TTabSheet;
    tsCalado: TTabSheet;
    zqCarnadasdescripcion: TStringField;
    zqCarnadasidcarnada: TLongintField;
    zqCarnadasidmarea: TLongintField;
    zqLineascant_trampas: TLongintField;
    zqLineasdistancia_entre_trampas: TLongintField;
    zqLineasidmarea: TLongintField;
    zqLineasinvestigacion: TSmallintField;
    zqLineasnro_boya: TLongintField;
    zqLineasnro_linea: TLongintField;
    zqPrincipalcanastos_procesados: TLongintField;
    zqPrincipalcant_trampas_caladas: TLongintField;
    zqPrincipalcluster_por_canasto: TLongintField;
    zqPrincipalcod_estado_mar: TLongintField;
    zqPrincipalcomentarios_calado: TStringField;
    zqPrincipalcomentarios_virada: TStringField;
    zqPrincipaldireccion_viento: TLongintField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalfecha_fin_calado: TDateField;
    zqPrincipalfecha_fin_virada: TDateField;
    zqPrincipalfecha_ini_calado: TDateField;
    zqPrincipalfecha_ini_virada: TDateField;
    zqPrincipalhora_fin_calado: TTimeField;
    zqPrincipalhora_fin_virada: TTimeField;
    zqPrincipalhora_ini_calado: TTimeField;
    zqPrincipalhora_ini_virada: TTimeField;
    zqPrincipalidcarnada: TLongintField;
    zqPrincipalidlance: TLongintField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalkg_carnada: TFloatField;
    zqPrincipallat_fin_calado: TFloatField;
    zqPrincipallat_fin_virada: TFloatField;
    zqPrincipallat_ini_calado: TFloatField;
    zqPrincipallat_ini_virada: TFloatField;
    zqPrincipallong_fin_calado: TFloatField;
    zqPrincipallong_fin_virada: TFloatField;
    zqPrincipallong_ini_calado: TFloatField;
    zqPrincipallong_ini_virada: TFloatField;
    zqPrincipalnro_lance: TLongintField;
    zqPrincipalnudos_viento: TLongintField;
    zqPrincipalprofundidad_fin_calado: TLongintField;
    zqPrincipalprofundidad_fin_virada: TLongintField;
    zqPrincipalprofundidad_ini_calado: TLongintField;
    zqPrincipalprofundidad_ini_virada: TLongintField;
    zqPrincipalprospeccion: TSmallintField;
    zqPrincipalrumbo_calado: TLongintField;
    zqCarnadas: TZQuery;
    zqPrincipalVelocCalado: TFloatField;
    zqPrincipalVelocVirada: TFloatField;
    zqProxLance: TZQuery;
    zqProxLanceprox_lance: TLargeintField;
    zqTiposTrampa: TZQuery;
    zqTiposTrampacant_aros: TLongintField;
    zqTiposTrampacodigo: TStringField;
    zqTiposTrampacod_desc: TStringField;
    zqTiposTrampadescripcion: TStringField;
    zqTiposTrampaidtipo_trampa: TLongintField;
    zqOrdenVirada: TZQuery;
    procedure dbdtFechaFinCaladoEnter(Sender: TObject);
    procedure dbdtFechaIniViradaEnter(Sender: TObject);
    procedure dbdtFechaFinViradaEnter(Sender: TObject);
    procedure dbdtFechaIniCaladoEnter(Sender: TObject);
    procedure dbedBoyaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gbDatosInicio2Exit(Sender: TObject);
    procedure gbInicioCaladoExit(Sender: TObject);
    procedure pcLancesChange(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject;
      var ValidacionOK: boolean);
    procedure zqAntLanceBeforeOpen(DataSet: TDataSet);
    procedure zqCarnadasBeforeOpen(DataSet: TDataSet);
    procedure zqDatosLineasBeforeOpen(DataSet: TDataSet);
    procedure zqOrdenViradaBeforeOpen(DataSet: TDataSet);
    procedure zqPrincipalAfterOpen(DataSet: TDataSet);
    procedure zqPrincipalBeforeOpen(DataSet: TDataSet);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqPrincipalnro_boyaValidate(Sender: TField);
    procedure zqPrincipalprofundidad_fin_caladoValidate(Sender: TField);
    procedure zqPrincipalprofundidad_fin_viradaValidate(Sender: TField);
    procedure zqPrincipalprofundidad_ini_caladoValidate(Sender: TField);
    procedure zqPrincipalprofundidad_ini_viradaValidate(Sender: TField);
    procedure zqPrincipalrumbo_caladoValidate(Sender: TField);
    procedure zqProxLanceBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarLances: TfmEditarLances;

implementation

{$R *.lfm}

{ TfmEditarLances }

procedure TfmEditarLances.pcLancesChange(Sender: TObject);
begin
  if pcLances.ActivePage=tsCalado then
  begin
     if dbdtFechaIniCalado.CanFocus then
        dbdtFechaIniCalado.SetFocus;
  end else if pcLances.ActivePage=tsVirada then
  begin
     if dbdtFechaIniVirada.CanFocus then
        dbdtFechaIniVirada.SetFocus;
  end;
end;

procedure TfmEditarLances.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
  if (zqPrincipalnro_boya.IsNull) then
  begin
     ValidacionOK:=False;
     MessageDlg('Debe indicar el número de boya correspondiente a la línea', mtError, [mbOK], 0);
     if dbedBoya.CanFocus then
        dbedBoya.SetFocus;
  end
  else if (zqPrincipalfecha_ini_calado.IsNull) then
  begin
     ValidacionOK:=False;
     MessageDlg('Debe indicar la fecha de inicio de calado', mtError, [mbOK], 0);
     if dbdtFechaIniCalado.CanFocus then
        dbdtFechaIniCalado.SetFocus;
  end
  else if (zqPrincipalhora_ini_calado.IsNull) then
  begin
     ValidacionOK:=False;
     MessageDlg('Debe indicar la hora de inicio de calado', mtError, [mbOK], 0);
     if dbdtHoraIniCalado.CanFocus then
        dbdtHoraIniCalado.SetFocus;
  end
  else if (zqPrincipallat_ini_calado.IsNull) then
  begin
     ValidacionOK:=False;
     MessageDlg('Debe indicar la latitud de inicio de calado', mtError, [mbOK], 0);
     if dbedLatIniCalado.CanFocus then
        dbedLatIniCalado.SetFocus;
  end
  else if (zqPrincipallong_ini_calado.IsNull) then
  begin
     ValidacionOK:=False;
     MessageDlg('Debe indicar la longitud de inicio de calado', mtError, [mbOK], 0);
     if dbedLongIniCalado.CanFocus then
        dbedLongIniCalado.SetFocus;
  end
  else if (zqPrincipalfecha_fin_calado.IsNull) then
  begin
     ValidacionOK:=False;
     MessageDlg('Debe indicar la fecha de finalización de calado', mtError, [mbOK], 0);
     if dbdtFechaFinCalado.CanFocus then
        dbdtFechaFinCalado.SetFocus;
  end
  else if (zqPrincipalfecha_fin_calado.AsDateTime<zqPrincipalfecha_ini_calado.AsDateTime) then
  begin
     ValidacionOK:=False;
     MessageDlg('La fecha de finalización de calado no puede ser menor a la de inicio', mtError, [mbOK], 0);
     if dbdtFechaFinCalado.CanFocus then
        dbdtFechaFinCalado.SetFocus;
  end
  else if (zqPrincipalhora_fin_calado.IsNull) then
  begin
     ValidacionOK:=False;
     MessageDlg('Debe indicar la hora de finalización de calado', mtError, [mbOK], 0);
     if dbdtHoraFinCalado.CanFocus then
        dbdtHoraFinCalado.SetFocus;
  end
  else if (not zqPrincipalfecha_fin_virada.IsNull) and (not zqPrincipalfecha_ini_virada.IsNull)
     and (zqPrincipalfecha_fin_virada.AsDateTime<zqPrincipalfecha_ini_virada.AsDateTime) then
  begin
     ValidacionOK:=False;
     MessageDlg('La fecha de finalización de virada no puede ser menor a la de inicio', mtError, [mbOK], 0);
     if dbdtFechaIniVirada.CanFocus then
        dbdtFechaIniVirada.SetFocus;
  end
  else if (not zqPrincipalfecha_ini_virada.IsNull) and (not zqPrincipalfecha_fin_calado.IsNull)
     and (zqPrincipalfecha_ini_virada.AsDateTime<zqPrincipalfecha_fin_calado.AsDateTime) then
  begin
     ValidacionOK:=False;
     MessageDlg('La fecha de inicio de virada no puede ser menor a la de fin de calado', mtError, [mbOK], 0);
     if dbdtFechaIniVirada.CanFocus then
        dbdtFechaIniVirada.SetFocus;
  end
  else if (zqPrincipallat_fin_calado.IsNull) then
  begin
     ValidacionOK:=False;
     MessageDlg('Debe indicar la latitud de finalización de calado', mtError, [mbOK], 0);
     if dbedLatFinCalado.CanFocus then
        dbedLatFinCalado.SetFocus;
  end
  else if (zqPrincipallong_fin_calado.IsNull) then
  begin
     ValidacionOK:=False;
     MessageDlg('Debe indicar la longitud de finalización de calado', mtError, [mbOK], 0);
     if dbedLongFinCalado.CanFocus then
        dbedLongFinCalado.SetFocus;
  end
  else if (zqPrincipalcant_trampas_caladas.Value<1) then
  begin
     ValidacionOK:=False;
     MessageDlg('Debe indicar la cantidad de trampas caladas', mtError, [mbOK], 0);
     if dbedTrampasCaladas.CanFocus then
        dbedTrampasCaladas.SetFocus;
  end
  else
  begin
    pcLances.ActivePage:=tsCalado;
  end;
end;

procedure TfmEditarLances.zqAntLanceBeforeOpen(DataSet: TDataSet);
begin
  zqAntLance.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
  zqAntLance.ParamByName('nro_lance').Value := zqPrincipalnro_lance.Value;
end;

procedure TfmEditarLances.zqCarnadasBeforeOpen(DataSet: TDataSet);
begin
  zqCarnadas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmEditarLances.zqDatosLineasBeforeOpen(DataSet: TDataSet);
begin
  zqDatosLineas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  zqDatosLineas.ParamByName('idlance').Value:=zqPrincipalidlance.Value;
end;

procedure TfmEditarLances.zqOrdenViradaBeforeOpen(DataSet: TDataSet);
begin
  zqOrdenVirada.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmEditarLances.zqPrincipalAfterOpen(DataSet: TDataSet);
begin
  zqOrdenVirada.Close;
  zqOrdenVirada.Open;
end;

procedure TfmEditarLances.zqPrincipalBeforeOpen(DataSet: TDataSet);
begin
  zqOrdenVirada.Close;
  zqOrdenVirada.Open;
end;

procedure TfmEditarLances.zqPrincipalCalcFields(DataSet: TDataSet);
var
  distancia_segun_trampas: double;
  dif_rumbo:double;
begin
  zqPrincipalEncabezado.Value:='Id. Línea '+zqPrincipalnro_boya.AsString;

  //Calculo distancias
  laDistancia.Hint:='';
  laDistTrampas.Hint:='';
  laDistTrampas2.Hint:='';
  if (zqPrincipallat_ini_calado.AsFloat>0) and (zqPrincipallong_ini_calado.AsFloat>0)
     and (zqPrincipallat_fin_calado.AsFloat>0) and (zqPrincipallong_fin_calado.AsFloat>0) then
  begin
     zqPrincipalDistCalado.AsFloat:=DistanciaEnMillas(zqPrincipallat_ini_calado.Value, zqPrincipallong_ini_calado.Value,
      zqPrincipallat_fin_calado.Value, zqPrincipallong_fin_calado.Value);
     //Calculo la distancia entre trampas. Lo convierto a metros
     if (zqPrincipalDistCalado.AsFloat>0) and (zqPrincipalcant_trampas_caladas.AsInteger>0) then
     begin
       zqPrincipaldist_trampas_prom_calado.Value:=(zqPrincipalDistCalado.AsFloat/zqPrincipalcant_trampas_caladas.AsFloat)*1852;
       laDistTrampas.Hint:='Distancia promedio entre trampas para '+zqPrincipalcant_trampas_caladas.AsString+' trampas distribuidas en '+FormatFloat('0',zqPrincipalDistCalado.Value*1852)+' metros';
       //Calculo diferencia > 10%
       if (abs(zqPrincipaldist_trampas_prom_calado.Value-zqPrincipaldistancia_entre_trampas.Value) > (zqPrincipaldistancia_entre_trampas.Value*0.10)) then
       begin
         dbtDistTrampas.Font.Color := clRed;
       end
       else
       begin
            dbtDistTrampas.Font.Color := clDefault;
       end;
     end;
     // Pongo en rojo valores dudosos (dif. > 10% respecto a calculado x trampas)
     if (not zqPrincipaldistancia_entre_trampas.IsNull) and (not zqPrincipalcant_trampas_caladas.IsNull) then
     begin
        //Distancia máxima: distancia e/trampas x trampas de la linea + 100m de tolerancia. Lo convierto a millas
        // (Hay unos 50m entre el ancla y la primera trampa)
        distancia_segun_trampas:=((zqPrincipaldistancia_entre_trampas.Value*zqPrincipalcant_trampas_caladas.Value)+100)/1852;
        laDistancia.Hint:='Distancia calculada para '+zqPrincipalcant_trampas_caladas.AsString+' trampas cada '+zqPrincipaldistancia_entre_trampas.AsString+' metros(considerando espacio entre anclas): '+FormatFloat('0.00', distancia_segun_trampas)+'mn';
     end else
     begin
       distancia_segun_trampas:=3;
     end;
     //Calculo diferencia > 20%
     if (abs(zqPrincipalDistCalado.Value-distancia_segun_trampas) > (distancia_segun_trampas*0.20)) or
       (zqPrincipalDistCalado.Value < 1.5) then
     begin
       dbtDistCalado.Font.Color := clRed;
     end
     else
     begin
          dbtDistCalado.Font.Color := clDefault;
     end;
  end;
  if (zqPrincipallat_ini_virada.AsFloat>0) and (zqPrincipallong_ini_virada.AsFloat>0)
     and (zqPrincipallat_fin_virada.AsFloat>0) and (zqPrincipallong_fin_virada.AsFloat>0) then
  begin
     zqPrincipalDistVirada.AsFloat:=DistanciaEnMillas(zqPrincipallat_ini_virada.Value, zqPrincipallong_ini_virada.Value,
      zqPrincipallat_fin_virada.Value, zqPrincipallong_fin_virada.Value);
     //Calculo la distancia entre trampas (virada). Lo convierto a metros
     //Sigo usando la cantidad de trampas caladas porque las viradas no las tengo hasta la muestra de captura
     if (zqPrincipalDistVirada.AsFloat>0) and (zqPrincipalcant_trampas_caladas.AsInteger>0) then
     begin
       zqPrincipaldist_trampas_prom_virada.Value:=(zqPrincipalDistVirada.AsFloat/zqPrincipalcant_trampas_caladas.AsFloat)*1852;
       laDistTrampas2.Hint:='Distancia promedio entre trampas para '+zqPrincipalcant_trampas_caladas.AsString+' trampas distribuidas en '+FormatFloat('0',zqPrincipalDistVirada.Value*1852)+' metros';
       //Calculo diferencia > 10%
       if (abs(zqPrincipaldist_trampas_prom_virada.Value-zqPrincipaldistancia_entre_trampas.Value) > (zqPrincipaldistancia_entre_trampas.Value*0.10)) then
       begin
         dbtDistTrampas2.Font.Color := clRed;
       end
       else
       begin
            dbtDistTrampas2.Font.Color := clDefault;
       end;
     end;

     // Pongo en rojo valores dudosos
     if (not zqPrincipaldistancia_entre_trampas.IsNull) and (not zqPrincipalcant_trampas_caladas.IsNull) then
     begin
        //Distancia máxima: distancia e/trampas x trampas de la linea + 100m de tolerancia. Lo convierto a millas
        // (Hay unos 100m entre el ancla y la primera trampa)
        distancia_segun_trampas:=(zqPrincipaldistancia_entre_trampas.Value*zqPrincipalcant_trampas_caladas.Value+100)/1852;
        laDistancia1.Hint:='Distancia calculada para '+zqPrincipalcant_trampas_caladas.AsString+' trampas cada '+zqPrincipaldistancia_entre_trampas.AsString+' metros(considerando espacio entre anclas): '+FormatFloat('0.00', distancia_segun_trampas)+'mn';
     end else
     begin
       distancia_segun_trampas:=3;
     end;
     if (abs(zqPrincipalDistVirada.Value-distancia_segun_trampas) > (distancia_segun_trampas*0.20)) or
       (zqPrincipalDistVirada.Value < 1.5) then
       dbtDistVirada.Font.Color := clRed
     else
       dbtDistVirada.Font.Color := clDefault;
  end;

  //Calculo el rumbo de calado
  //Tengo en cuenta que si la distancia es 0, el cálculo de rumbo da error
  if (zqPrincipallat_ini_calado.AsFloat>0) and (zqPrincipallong_ini_calado.AsFloat>0)
     and (zqPrincipallat_fin_calado.AsFloat>0) and (zqPrincipallong_fin_calado.AsFloat>0)
     and (not zqPrincipalDistCalado.IsNull ) and (zqPrincipalDistCalado.Value>0) then
  begin
     zqPrincipalRumboCaladoCalc.AsFloat:=Rumbo(zqPrincipallat_ini_calado.Value, zqPrincipallong_ini_calado.Value,
      zqPrincipallat_fin_calado.Value, zqPrincipallong_fin_calado.Value);
     //Calculo diferencia > 15°
     dif_rumbo:=abs(zqPrincipalRumboCaladoCalc.Value-zqPrincipalrumbo_calado.Value);
     //Me aseguro de que la diferencia no sea mayor a 180°
     if dif_rumbo>180 then
        dif_rumbo:=360-dif_rumbo;

     if dif_rumbo > 15 then
     begin
       dbtRumbo.Font.Color := clRed;
     end
     else
     begin
          dbtRumbo.Font.Color := clDefault;
     end;
  end;


  //Calculo tiempos
  if (not zqPrincipalfecha_ini_calado.IsNull) and (not zqPrincipalfecha_fin_calado.IsNull)
     and (not zqPrincipalhora_ini_calado.IsNull) and (not zqPrincipalhora_fin_calado.IsNull)then
  begin
     zqPrincipalTiempoCalado.AsFloat:=MinutesBetween(zqPrincipalfecha_ini_calado.AsDateTime +
      zqPrincipalhora_ini_calado.AsDateTime, zqPrincipalfecha_fin_calado.AsDateTime +
      zqPrincipalhora_fin_calado.AsDateTime);
     // Pongo en rojo valores dudosos
     if (zqPrincipalTiempoCalado.Value > 40) or
       (zqPrincipalTiempoCalado.Value < 10) then
       dbtTiempoCalado.Font.Color := clRed
     else
       dbtTiempoCalado.Font.Color := clDefault;
  end;
  if (not zqPrincipalfecha_ini_virada.IsNull) and (not zqPrincipalfecha_fin_virada.IsNull)
     and (not zqPrincipalhora_ini_virada.IsNull) and (not zqPrincipalhora_fin_virada.IsNull)then
  begin
     zqPrincipalTiempoVirada.AsFloat:=MinutesBetween(zqPrincipalfecha_ini_virada.AsDateTime +
      zqPrincipalhora_ini_virada.AsDateTime, zqPrincipalfecha_fin_virada.AsDateTime +
      zqPrincipalhora_fin_virada.AsDateTime);
     // Pongo en rojo valores dudosos
     if (zqPrincipalTiempoVirada.Value > 120) or
       (zqPrincipalTiempoVirada.Value < 30) then
       dbtTiempoVirada.Font.Color := clRed
     else
       dbtTiempoVirada.Font.Color := clDefault;
  end;

  //Calculo velocidades
  if (zqPrincipalDistCalado.Value>0) and (zqPrincipalTiempoCalado.Value>0) then
  begin
     zqPrincipalVelocCalado.Value := zqPrincipalDistCalado.Value * 60 / zqPrincipalTiempoCalado.Value;
     // Pongo en rojo valores dudosos
     if (zqPrincipalVelocCalado.Value > 6.5) or
       (zqPrincipalVelocCalado.Value < 3) then
       dbtVelocCalado.Font.Color := clRed
     else
       dbtVelocCalado.Font.Color := clDefault;
  end;
  if (zqPrincipalDistVirada.Value>0) and (zqPrincipalTiempoVirada.Value>0) then
  begin
     zqPrincipalVelocVirada.Value := zqPrincipalDistVirada.Value * 60 / zqPrincipalTiempoVirada.Value;
     // Pongo en rojo valores dudosos
     if (zqPrincipalVelocVirada.Value > 3) or
       (zqPrincipalVelocVirada.Value < 0.5) then
       dbtVelocVirada.Font.Color := clRed
     else
       dbtVelocVirada.Font.Color := clDefault;
  end;

  //Refresco campos calculados en pantalla
  zqPrincipal.DisableControls;
  zqPrincipal.EnableControls;
end;

procedure TfmEditarLances.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalidlance.Value:=zcePrincipal.NuevoID('lances');
  zqPrincipalprospeccion.Value:=0;
  zqPrincipalinvestigacion.Value:=0;
  zqPrincipalnro_lance.Value := zqProxLanceprox_lance.Value;
  zqAntLance.Close;
  zqAntLance.Open;
  if zqAntLance.RecordCount > 0 then
  begin
    zqPrincipalfecha_ini_calado.Value := zqAntLancefecha_ini_calado.Value;
    zqPrincipalidcarnada.Value := zqAntLanceidcarnada.Value;
    if zqAntLancekg_carnada.AsFloat>0 then
       zqPrincipalkg_carnada.Value := zqAntLancekg_carnada.Value;
  end;
end;

procedure TfmEditarLances.zqPrincipalnro_boyaValidate(Sender: TField);
begin
end;

procedure TfmEditarLances.zqPrincipalprofundidad_fin_caladoValidate(
  Sender: TField);
begin
  if (Sender.AsInteger<40) or (Sender.AsInteger>250) then
  begin
     MessageDlg('Ingrese la profundidad en metros', mtError, [mbOK], 0);
     if dbedProfFinCalado.CanFocus then
        dbedProfFinCalado.SetFocus;
  end;
end;

procedure TfmEditarLances.zqPrincipalprofundidad_fin_viradaValidate(
  Sender: TField);
begin
  if (Sender.AsInteger<40) or (Sender.AsInteger>250) then
  begin
     MessageDlg('Ingrese la profundidad en metros', mtError, [mbOK], 0);
     if dbedProfFinVirada.CanFocus then
        dbedProfFinVirada.SetFocus;
  end;
end;

procedure TfmEditarLances.zqPrincipalprofundidad_ini_caladoValidate(
  Sender: TField);
begin
  if (Sender.AsInteger<40) or (Sender.AsInteger>250) then
  begin
     MessageDlg('Ingrese la profundidad en metros', mtError, [mbOK], 0);
     if dbedProfIniCalado.CanFocus then
        dbedProfIniCalado.SetFocus;
  end;
end;

procedure TfmEditarLances.zqPrincipalprofundidad_ini_viradaValidate(
  Sender: TField);
begin
  if (Sender.AsInteger<40) or (Sender.AsInteger>250) then
  begin
     MessageDlg('Ingrese la profundidad en metros', mtError, [mbOK], 0);
     if dbedProfIniVirada.CanFocus then
        dbedProfIniVirada.SetFocus;
  end;
end;

procedure TfmEditarLances.zqPrincipalrumbo_caladoValidate(Sender: TField);
begin
  if (Sender.AsInteger<1) or (Sender.AsInteger>360) then
  begin
     MessageDlg('Ingrese el rumbo en grados, de 1 a 360', mtError, [mbOK], 0);
     if dbedRumbo.CanFocus then
        dbedRumbo.SetFocus;
  end;
end;

procedure TfmEditarLances.zqProxLanceBeforeOpen(DataSet: TDataSet);
begin
  zqProxLance.ParamByName('idmarea').Value := dmGeneral.IdMareaActiva;
end;

procedure TfmEditarLances.FormShow(Sender: TObject);
begin
  pcLances.ActivePage:=tsCalado;
end;

procedure TfmEditarLances.gbDatosInicio2Exit(Sender: TObject);
begin
  if dsPrincipal.State in [dsInsert, dsEdit] then
  begin
     if (zqPrincipalfecha_ini_virada.AsString<>'') and ((zqPrincipalfecha_fin_virada.AsString='') or (StrToDate(zqPrincipalfecha_ini_calado.AsString)>StrToDate(zqPrincipalfecha_ini_virada.AsString))) then
        zqPrincipalfecha_fin_virada.Value:=zqPrincipalfecha_ini_virada.Value;
  end;
end;

procedure TfmEditarLances.gbInicioCaladoExit(Sender: TObject);
begin
  if dsPrincipal.State in [dsInsert, dsEdit] then
  begin
     if ((zqPrincipalfecha_ini_calado.AsString<>'') and (zqPrincipalfecha_fin_calado.AsString=''))
        or (zqPrincipalfecha_ini_calado.AsDateTime > zqPrincipalfecha_fin_calado.AsDateTime) then
        zqPrincipalfecha_fin_calado.Value:=zqPrincipalfecha_ini_calado.Value;
  end;
end;

procedure TfmEditarLances.dbdtFechaIniCaladoEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarLances.dbedBoyaExit(Sender: TObject);
begin
  if dbedBoya.Text='' then
  begin
     MessageDlg('Debe ingresar el número de boya. No se permite indicar un número de boya correspondiente a una línea registrada como calada.', mtError, [mbOK], 0);
     if dbedBoya.CanFocus then
        dbedBoya.SetFocus;
  end else
  begin
       zqDatosLineas.Close;
       zqDatosLineas.ParamByName('nro_boya').Value:=zqPrincipalnro_boya.Value;
       zqDatosLineas.Open;
       if zqDatosLineas.RecordCount>0 then
       begin
          if zqDatosLineascalada2.AsInteger=1 then
          begin
             MessageDlg('La línea '+zqPrincipalnro_boya.AsString+' ya está calada. Por favor verifique el dato ingresado', mtError, [mbOK], 0);
             if dbedBoya.CanFocus then
                dbedBoya.SetFocus;
          end else
          begin
               if (zqPrincipal.State in [dsInsert, dsEdit]) then
               begin
                  if (zqPrincipalnro_linea.IsNull) and (not zqDatosLineasnro_linea.IsNull) then
                  begin
                     zqPrincipalnro_linea.Value:=zqDatosLineasnro_linea.Value;
                  end;
                  if (zqPrincipalcant_trampas_caladas.IsNull) and (zqDatosLineascant_trampas.AsInteger>0) then
                  begin
                    zqPrincipalcant_trampas_caladas.Value:=zqDatosLineascant_trampas.Value;
                  end;
                  if (zqPrincipaldistancia_entre_trampas.IsNull)  and (not zqDatosLineasdistancia_entre_trampas.IsNull)then
                  begin
                     zqPrincipaldistancia_entre_trampas.Value:=zqDatosLineasdistancia_entre_trampas.Value;
                  end;
                  if (zqPrincipalidtipo_trampa.IsNull) and (not zqDatosLineasidtipo_trampa.IsNull) then
                  begin
                     zqPrincipalidtipo_trampa.Value:=zqDatosLineasidtipo_trampa.Value;
                  end;

                  zqPrincipalinvestigacion.Value:=zqDatosLineasinvestigacion.Value;
               end;
          end;
       end else if zqPrincipalnro_boya.AsString<>'' then
       begin
         if MessageDlg('La línea indicada ('+zqPrincipalnro_boya.AsString+') no ha sido registrada anteriormente. ¿Éste dato es correcto?', mtWarning, [mbYes,mbNo], 0)= mrNo then
         begin
              if dbedBoya.CanFocus then
                 dbedBoya.SetFocus;
         end;
       end;
  end;
end;

procedure TfmEditarLances.dbdtFechaFinCaladoEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarLances.dbdtFechaIniViradaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarLances.dbdtFechaFinViradaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

end.

