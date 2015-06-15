unit datcaptura;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, ZStoredProcedure,
  datGeneral, zcontroladoredicion, datBase, funciones, Dialogs;

type

  { TdmCapturas }

  TdmCapturas = class(TDmBase)
    dsByCatch: TDataSource;
    dsEspecies2: TDataSource;
    dsEspecies3: TDataSource;
    LongintField1: TLongintField;
    LongintField2: TLongintField;
    zqDetCapturadsc_abrev: TStringField;
    zqCapturacant_aros: TLongintField;
    zqDetCapturaEsNoObservado: TSmallintField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    zqDetCapturacant_trampas: TLongintField;
    zqDetCapturanro_orden: TLongintField;
    zqDetCapturarequiere_nro_ejemplares: TSmallintField;
    StringField3: TStringField;
    zqAntCaptura: TZQuery;
    zqAntCapturacomentarios: TStringField;
    zqAntCapturafecha: TDateField;
    zqAntCapturahora: TTimeField;
    zqAntCapturaidcaptura: TLongintField;
    zqAntCapturaidespecie1: TLongintField;
    zqAntCapturaidespecie2: TLongintField;
    zqAntCapturaidespecie3: TLongintField;
    zqAntCapturaidlance: TLongintField;
    zqAntCapturaidmarea: TLongintField;
    zqAntCapturanro_boya: TLongintField;
    zqAntCapturanro_lance: TLongintField;
    zqAntCapturanro_linea: TLongintField;
    zqCapturainvestigacion: TSmallintField;
    zqCapturaidtipo_trampa: TLongintField;
    StringField1: TStringField;
    StringField2: TStringField;
    zqByCatchcantidad: TLongintField;
    zqByCatchidbycatch: TLongintField;
    zqByCatchidcaptura: TLongintField;
    zqByCatchidespecie: TLongintField;
    zqByCatchpeso: TFloatField;
    zqCapturaComercEsp1: TSmallintField;
    zqCapturaComercEsp2: TSmallintField;
    zqCapturaComercEsp3: TSmallintField;
    zqCapturaEncabezadoCorto: TStringField;
    zqDetCapturacod_estadopuerta: TLongintField;
    zqDetCapturacod_tipo: TStringField;
    zqDetCapturadsc_tipo: TStringField;
    zqDetCapturadsc_estadopuerta: TStringField;
    zqDetCapturacod_estadotrampa: TStringField;
    zqDetCapturadsc_estadotrampa: TStringField;
    zqCapturaespecie_vulg1: TStringField;
    zqCapturaespecie_vulg2: TStringField;
    zqCapturaespecie_vulg3: TStringField;
    zqCapturaespecie1: TStringField;
    zqCapturaespecie2: TStringField;
    zqCapturaespecie3: TStringField;
    zqCapturaidespecie1: TLongintField;
    zqCapturaidespecie2: TLongintField;
    zqCapturaidespecie3: TLongintField;
    zqCapturanro_lance: TLongintField;
    zqCapturaFecha: TDateField;
    dsLances: TDataSource;
    dsEspecies1: TDataSource;
    dsEstadosPuerta: TDataSource;
    dsEstadosTrampa: TDataSource;
    dsCaptura: TDataSource;
    dsDetCaptura: TDataSource;
    dsEspecies: TDataSource;
    dsTiposTrampa: TDataSource;
    zqCapturahora: TTimeField;
    zqCapturadsc_lance: TStringField;
    zqCapturacomentarios: TStringField;
    zqCapturaEncabezado: TStringField;
    zqCapturaidcaptura: TLongintField;
    zqCapturaidlance: TLongintField;
    zqDetCapturacomerciales_especie1: TLongintField;
    zqDetCapturacomerciales_especie2: TLongintField;
    zqDetCapturacomerciales_especie3: TLongintField;
    zqDetCapturaidcaptura: TLongintField;
    zqDetCapturaiddetalle_captura: TLongintField;
    zqDetCapturaidestado_puerta: TLongintField;
    zqDetCapturaidestado_trampa: TLongintField;
    zqDetCapturaidtipo_trampa: TLongintField;
    zqDetCapturatotal_especie1: TLongintField;
    zqDetCapturatotal_especie2: TLongintField;
    zqDetCapturatotal_especie3: TLongintField;
    zqEspecies1: TZQuery;
    zqEspecies1comercial: TSmallintField;
    zqEspecies1comercial1: TSmallintField;
    zqEspecies1frecuente: TLongintField;
    zqEspecies1frecuente1: TLongintField;
    zqEspecies2: TZQuery;
    zqEspecies3: TZQuery;
    zqEspeciescodigo_inidep: TStringField;
    zqEspeciescodigo_inidep1: TStringField;
    zqEspeciescodigo_inidep2: TStringField;
    zqEspeciescodigo_inidep3: TStringField;
    zqEspeciescodigo_rapido: TStringField;
    zqEspeciescodigo_rapido1: TStringField;
    zqEspeciescodigo_rapido2: TStringField;
    zqEspeciescodigo_rapido3: TStringField;
    zqEspeciescomercial: TSmallintField;
    zqEspeciescomercial1: TSmallintField;
    zqEspeciesfrecuente: TLongintField;
    zqEspeciesfrecuente1: TLongintField;
    zqEspeciesidespecie: TLongintField;
    zqEspeciesidespecie1: TLongintField;
    zqEspeciesidespecie2: TLongintField;
    zqEspeciesidespecie3: TLongintField;
    zqEspeciesnombre_cientifico: TStringField;
    zqEspeciesnombre_cientifico1: TStringField;
    zqEspeciesnombre_cientifico2: TStringField;
    zqEspeciesnombre_cientifico3: TStringField;
    zqEspeciesnombre_vulgar: TStringField;
    zqEspeciesnombre_vulgar1: TStringField;
    zqEspeciesnombre_vulgar2: TStringField;
    zqEspeciesnombre_vulgar3: TStringField;
    zqEstadosPuerta: TZQuery;
    zqEstadosPuertacodigo: TLongintField;
    zqEstadosPuertacod_desc: TStringField;
    zqEstadosPuertadescripcion: TStringField;
    zqEstadosPuertaidestado_puerta: TLongintField;
    zqEstadosTrampa: TZQuery;
    zqCaptura: TZQuery;
    zqDetCaptura: TZQuery;
    zqEspecies: TZQuery;
    zqEstadosTrampacodigo: TStringField;
    zqEstadosTrampacod_desc: TStringField;
    zqEstadosTrampadescripcion: TStringField;
    zqEstadosTrampaes_fallo: TSmallintField;
    zqEstadosTrampaes_no_observado: TSmallintField;
    zqEstadosTrampaidestado_trampa: TLongintField;
    zqEstadosTramparequiere_nro_ejemplares: TSmallintField;
    zqEstadoTrampaPredetidestado_trampa: TLongintField;
    zqLancescalada: TLongintField;
    zqLancescanastos_procesados: TLongintField;
    zqLancescant_aros: TLongintField;
    zqLancescant_trampas_caladas: TLongintField;
    zqLancescant_trampas_recuperadas: TLongintField;
    zqLancescluster_por_canasto: TLongintField;
    zqLancescod_estado_mar: TLongintField;
    zqLancescomentarios_calado: TStringField;
    zqLancescomentarios_virada: TStringField;
    zqLancesdireccion_viento: TLongintField;
    zqLancesdsc_virada: TStringField;
    zqLancesenviado: TSmallintField;
    zqLancesfecha_fin_calado: TDateField;
    zqLancesfecha_fin_virada: TDateField;
    zqLancesfecha_ini_calado: TDateField;
    zqLancesfecha_ini_virada: TDateField;
    zqLanceshora_fin_calado: TTimeField;
    zqLanceshora_fin_virada: TTimeField;
    zqLanceshora_ini_calado: TTimeField;
    zqLanceshora_ini_virada: TTimeField;
    zqLancesidcarnada: TLongintField;
    zqLancesidlance: TLongintField;
    zqLancesidlinea: TLongintField;
    zqLancesidmarea: TLongintField;
    zqLancesidtipo_trampa: TLongintField;
    zqLancesinvestigacion: TSmallintField;
    zqLanceskg_carnada: TFloatField;
    zqLanceslat_fin_calado: TFloatField;
    zqLanceslat_fin_virada: TFloatField;
    zqLanceslat_ini_calado: TFloatField;
    zqLanceslat_ini_virada: TFloatField;
    zqLanceslong_fin_calado: TFloatField;
    zqLanceslong_fin_virada: TFloatField;
    zqLanceslong_ini_calado: TFloatField;
    zqLanceslong_ini_virada: TFloatField;
    zqLancesnro_boya: TLongintField;
    zqLancesnro_lance: TLongintField;
    zqLancesnro_linea: TLongintField;
    zqLancesnudos_viento: TLongintField;
    zqLancesprofundidad_fin_calado: TLongintField;
    zqLancesprofundidad_fin_virada: TLongintField;
    zqLancesprofundidad_ini_calado: TLongintField;
    zqLancesprofundidad_ini_virada: TLongintField;
    zqLancesprospeccion: TSmallintField;
    zqLancesrumbo_calado: TLongintField;
    zqLancesvirada: TLongintField;
    zqTiposTrampa: TZQuery;
    zqTiposTrampacant_aros: TLongintField;
    zqTiposTrampacodigo: TStringField;
    zqTiposTrampacod_desc: TStringField;
    zqTiposTrampadescripcion: TStringField;
    zqTiposTrampadsc_abrev: TStringField;
    zqTiposTrampaidtipo_trampa: TLongintField;
    zqLances: TZQuery;
    zqByCatch: TZQuery;
    zqEstadoTrampaPredet: TZQuery;
    procedure zqAntCapturaBeforeOpen(DataSet: TDataSet);
    procedure zqByCatchBeforeOpen(DataSet: TDataSet);
    procedure zqByCatchNewRecord(DataSet: TDataSet);
    procedure zqCapturaAfterOpen(DataSet: TDataSet);
    procedure zqCapturaAfterScroll(DataSet: TDataSet);
    procedure zqCapturaCalcFields(DataSet: TDataSet);
    procedure zqCapturaNewRecord(DataSet: TDataSet);
    procedure zqDetCapturaAfterOpen(DataSet: TDataSet);
    procedure zqDetCapturaBeforeOpen(DataSet: TDataSet);
    procedure zqDetCapturaBeforePost(DataSet: TDataSet);
    procedure zqDetCapturaNewRecord(DataSet: TDataSet);
    procedure zqLancesBeforeOpen(DataSet: TDataSet);
  private
    FHayEspecie1: boolean;
    FHayEspecie2: boolean;
    FHayEspecie3: boolean;
    FOrdenEspecies: integer;
    procedure SetHayEspecie1(AValue: boolean);
    procedure SetHayEspecie2(AValue: boolean);
    procedure SetHayEspecie3(AValue: boolean);
    procedure SetOrdenEspecies(AValue: integer);
    { private declarations }
  public
    { public declarations }
    property OrdenEspecies:integer read FOrdenEspecies write SetOrdenEspecies;
    property HayEspecie1: boolean read FHayEspecie1 write SetHayEspecie1;
    property HayEspecie2: boolean read FHayEspecie2 write SetHayEspecie2;
    property HayEspecie3: boolean read FHayEspecie3 write SetHayEspecie3;
  end;

var
  dmCapturas: TdmCapturas;
  max_nro_trampa: integer=0;

implementation

{$R *.lfm}

{ TdmCapturas }

procedure TdmCapturas.zqCapturaCalcFields(DataSet: TDataSet);
begin
     if not zqCapturaidlance.IsNull then
     begin
        zqCapturadsc_lance.Value:='Lance '+zqCapturanro_lance.AsString+': '+zqCapturaFecha.AsString+' '+FormatDateTime('hh:mm',zqCapturahora.AsDateTime);
        zqCapturaEncabezado.Value:='Captura de la virada del '+zqCapturaFecha.AsString+' a las '+FormatDateTime('hh:mm',zqCapturahora.AsDateTime);
     end;
     if zqCapturainvestigacion.AsBoolean then
        zqCapturaEncabezado.Value:=zqCapturaEncabezado.Value+' (investigación)';
     zqCapturaEncabezadoCorto.Value:=zqCapturaFecha.AsString+' - '+FormatDateTime('hh:mm',zqCapturahora.AsDateTime);
end;

procedure TdmCapturas.zqCapturaAfterScroll(DataSet: TDataSet);
begin
  zqDetCaptura.ParamByName('idcaptura').Value:=zqCapturaidcaptura.Value;
  zqByCatch.ParamByName('idcaptura').Value:=zqCapturaidcaptura.Value;
end;

procedure TdmCapturas.zqByCatchNewRecord(DataSet: TDataSet);
begin
  zqByCatchidbycatch.Value:=NuevoID(zqByCatch.Connection, 'bycatch');
  zqByCatchidcaptura.Value:=zqCapturaidcaptura.Value;
end;

procedure TdmCapturas.zqCapturaAfterOpen(DataSet: TDataSet);
begin
  zqLances.Close;
  zqLances.Open;
end;

procedure TdmCapturas.zqByCatchBeforeOpen(DataSet: TDataSet);
begin
  zqByCatch.ParamByName('idcaptura').Value:=zqCapturaidcaptura.Value;
end;

procedure TdmCapturas.zqAntCapturaBeforeOpen(DataSet: TDataSet);
begin
  zqAntCaptura.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TdmCapturas.zqCapturaNewRecord(DataSet: TDataSet);
begin
  max_nro_trampa:=0;
  zqCapturaidcaptura.Value:=NuevoID(zqCaptura.Connection,'capturas');
  zqAntCaptura.Close;
  zqAntCaptura.Open;
  zqLances.Close;
  zqLances.Open;
  if zqAntCaptura.RecordCount > 0 then
  begin
     if (not zqAntCapturaidespecie1.IsNull) and (zqAntCapturaidespecie1.AsInteger<>0) then
       zqCapturaidespecie1.Value := zqAntCapturaidespecie1.Value;
     if (not zqAntCapturaidespecie2.IsNull) and (zqAntCapturaidespecie2.AsInteger<>0) then
       zqCapturaidespecie2.Value := zqAntCapturaidespecie2.Value;
     if (not zqAntCapturaidespecie3.IsNull) and (zqAntCapturaidespecie3.AsInteger<>0) then
       zqCapturaidespecie3.Value := zqAntCapturaidespecie3.Value;
  end;
end;

procedure TdmCapturas.zqDetCapturaAfterOpen(DataSet: TDataSet);
var
  n: integer;
begin
  n:=-1;
  with zqDetCaptura do
  begin
    DisableControls;
    first;
    while not EOF do
    begin
      if zqDetCapturanro_orden.Value>max_nro_trampa then
         max_nro_trampa:=zqDetCapturanro_orden.Value;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

procedure TdmCapturas.zqDetCapturaBeforeOpen(DataSet: TDataSet);
begin
  zqDetCaptura.ParamByName('idcaptura').Value:=zqCapturaidcaptura.Value;
end;

procedure TdmCapturas.zqDetCapturaBeforePost(DataSet: TDataSet);
begin
  if (zqDetCaptura.State in [dsInsert]) and
     (zqDetCapturanro_orden.Value>max_nro_trampa) then
  begin
     max_nro_trampa:=zqDetCapturanro_orden.Value;
  end;
end;

procedure TdmCapturas.zqDetCapturaNewRecord(DataSet: TDataSet);
begin
  if zqDetCaptura.RecordCount=0 then
     zqDetCapturanro_orden.Value:=1;
  zqDetCapturaiddetalle_captura.Value:=NuevoID((DataSet as TZQuery).Connection,'detalle_capturas');
  zqDetCapturaidcaptura.Value:=zqCapturaidcaptura.Value;
  zqDetCapturanro_orden.Value:=max_nro_trampa+1;
  if (not zqCapturaidtipo_trampa.IsNull) and (not zqCapturacant_aros.IsNull) then
     zqDetCapturaidtipo_trampa.Value:=zqCapturaidtipo_trampa.Value;
  zqDetCapturacant_trampas.Value:=1;
  if (not zqEstadoTrampaPredetidestado_trampa.IsNull) and (zqDetCapturaidestado_trampa.IsNull) then
  begin
    zqDetCapturaidestado_trampa.Value:=zqEstadoTrampaPredetidestado_trampa.Value;
  end;
end;

procedure TdmCapturas.zqLancesBeforeOpen(DataSet: TDataSet);
begin
  zqLances.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  zqLances.ParamByName('idcaptura').Value:=zqCapturaidcaptura.Value;
end;

procedure TdmCapturas.SetOrdenEspecies(AValue: integer);
begin
  if FOrdenEspecies=AValue then Exit;
  FOrdenEspecies:=AValue;
end;

procedure TdmCapturas.SetHayEspecie1(AValue: boolean);
begin
  if FHayEspecie1=AValue then Exit;
  FHayEspecie1:=AValue;
end;

procedure TdmCapturas.SetHayEspecie2(AValue: boolean);
begin
  if FHayEspecie2=AValue then Exit;
  FHayEspecie2:=AValue;
end;

procedure TdmCapturas.SetHayEspecie3(AValue: boolean);
begin
  if FHayEspecie3=AValue then Exit;
  FHayEspecie3:=AValue;
end;

end.

