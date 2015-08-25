unit datmuestras;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, datBase, db,
  ZDataset, datGeneral;

type

  { TdmMuestras }

  TdmMuestras = class(TDmBase)
    BytesField1: TBytesField;
    zqDetalleMuestrasporcentaje_huevos: TFloatField;
    zqLancesidtipo_trampa: TLongintField;
    zqMuestrastipo_trampa_lance: TLongintField;
    StringField3: TStringField;
    zqAntMuestracod_tipo_muestra: TStringField;
    zqAntMuestracomentarios: TStringField;
    zqAntMuestrafecha: TDateField;
    zqAntMuestrahora: TTimeField;
    zqAntMuestraidespecie: TLongintField;
    zqAntMuestraidlance: TLongintField;
    zqAntMuestraidmarea: TLongintField;
    zqAntMuestraidmuestra: TLongintField;
    zqAntMuestranombre_cientifico: TStringField;
    zqAntMuestranombre_vulgar: TStringField;
    zqAntMuestranro_lance: TLongintField;
    zqAntMuestratipo_muestra: TStringField;
    zqMuestrasfecha: TDateField;
    LongintField1: TLongintField;
    LongintField2: TLongintField;
    zqMuestrases_submuestra: TSmallintField;
    zqMuestrases_relac_morf: TSmallintField;
    zqMuestrashora: TTimeField;
    zqAntMuestra: TZQuery;
    zqMuestrascod_tipo_muestra: TStringField;
    zqCodigosHuevos1: TZQuery;
    zqCodigosHuevos1codigo: TLongintField;
    zqCodigosHuevos1cod_desc: TBytesField;
    zqCodigosHuevos1descripcion: TStringField;
    zqCodigosHuevos1idcodigo_huevos: TLongintField;
    zqCodigosHuevos1tiene_huevos: TSmallintField;
    zqDetalleMuestrastiene_huevos: TSmallintField;
    StringField1: TStringField;
    StringField2: TStringField;
    zqCodigosHuevostiene_huevos: TSmallintField;
    zqDetalleMuestrasPesoKg: TFloatField;
    zqMuestrasdsc_virada: TStringField;
    zqLancesdsc_virada: TStringField;
    zqMuestrasidmarea: TLongintField;
    zqMuestrasidtipo_muestra: TLongintField;
    zqMuestrasidtipo_trampa: TLongintField;
    zqTiposMuestras: TZQuery;
    zqDetalleMuestrasdsc_caparazon: TBytesField;
    zqDetalleMuestrasdsc_huevos: TBytesField;
    dsMuestras: TDataSource;
    dsDetalleMuestras: TDataSource;
    zqCodigosCaparazon: TZQuery;
    zqCodigosCaparazoncodigo: TLongintField;
    zqCodigosCaparazoncod_desc: TBytesField;
    zqCodigosCaparazondescripcion: TStringField;
    zqCodigosCaparazonidcodigo_caparazon: TLongintField;
    zqCodigosHuevos: TZQuery;
    zqCodigosHuevoscodigo: TLongintField;
    zqCodigosHuevoscod_desc: TBytesField;
    zqCodigosHuevosdescripcion: TStringField;
    zqCodigosHuevosidcodigo_huevos: TLongintField;
    zqDetalleMuestrasidcodigo_caparazon: TLongintField;
    zqDetalleMuestrasidcodigo_huevos: TLongintField;
    zqDetalleMuestrasiddetalle_muestra: TLongintField;
    zqDetalleMuestrasidmuestra: TLongintField;
    zqDetalleMuestraslargo: TLongintField;
    zqDetalleMuestrasnro_ejemplar: TLongintField;
    zqDetalleMuestraspata_1_d_entera: TLongintField;
    zqDetalleMuestraspata_1_d_mero: TLongintField;
    zqDetalleMuestraspata_1_i_entera: TLongintField;
    zqDetalleMuestraspata_1_i_mero: TLongintField;
    zqDetalleMuestraspata_2_d_entera: TLongintField;
    zqDetalleMuestraspata_2_d_mero: TLongintField;
    zqDetalleMuestraspata_2_i_entera: TLongintField;
    zqDetalleMuestraspata_2_i_mero: TLongintField;
    zqDetalleMuestraspata_3_d_entera: TLongintField;
    zqDetalleMuestraspata_3_d_mero: TLongintField;
    zqDetalleMuestraspata_3_i_entera: TLongintField;
    zqDetalleMuestraspata_3_i_mero: TLongintField;
    zqDetalleMuestraspeso: TFloatField;
    zqDetalleMuestrassexo: TLongintField;
    zqEspecies: TZQuery;
    zqEspecies1: TZQuery;
    zqEspecies1comercial: TSmallintField;
    zqEspecies1frecuente: TLongintField;
    zqEspeciescodigo_inidep: TStringField;
    zqEspeciescodigo_inidep1: TStringField;
    zqEspeciescodigo_rapido: TStringField;
    zqEspeciescodigo_rapido1: TStringField;
    zqEspeciescomercial: TSmallintField;
    zqEspeciesfrecuente: TLongintField;
    zqEspeciesidespecie: TLongintField;
    zqEspeciesidespecie1: TLongintField;
    zqEspeciesnombre_cientifico: TStringField;
    zqEspeciesnombre_cientifico1: TStringField;
    zqEspeciesnombre_vulgar: TStringField;
    zqEspeciesnombre_vulgar1: TStringField;
    zqLances: TZQuery;
    zqLancescalada: TLongintField;
    zqLancescanastos_procesados: TLongintField;
    zqLancescant_trampas_caladas: TLongintField;
    zqLancescant_trampas_recuperadas: TLongintField;
    zqLancescluster_por_canasto: TLongintField;
    zqLancescod_estado_mar: TLongintField;
    zqLancescomentarios_calado: TStringField;
    zqLancescomentarios_virada: TStringField;
    zqLancesdireccion_viento: TLongintField;
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
    zqMuestras: TZQuery;
    zqDetalleMuestras: TZQuery;
    zqMuestrascomentarios: TStringField;
    zqMuestrasEncabezado: TStringField;
    zqMuestrasidespecie: TLongintField;
    zqMuestrasidlance: TLongintField;
    zqMuestrasidmuestra: TLongintField;
    zqTiposMuestrascodigo: TStringField;
    zqTiposMuestrascod_desc: TBytesField;
    zqTiposMuestrasdescripcion: TStringField;
    zqTiposMuestrases_relac_morf: TSmallintField;
    zqTiposMuestrases_submuestra: TSmallintField;
    zqTiposMuestrasidtipo_muestra: TLongintField;
    zqTiposMuestrasorden: TLongintField;
    zqTiposTrampa: TZQuery;
    zqTiposTrampacant_aros: TLongintField;
    zqTiposTrampacodigo: TStringField;
    zqTiposTrampacod_desc: TStringField;
    zqTiposTrampadescripcion: TStringField;
    zqTiposTrampaidtipo_trampa: TLongintField;
    procedure zqAntMuestraBeforeOpen(DataSet: TDataSet);
    procedure zqDetalleMuestrasAfterOpen(DataSet: TDataSet);
    procedure zqDetalleMuestrasBeforeOpen(DataSet: TDataSet);
    procedure zqDetalleMuestrasBeforePost(DataSet: TDataSet);
    procedure zqDetalleMuestrasCalcFields(DataSet: TDataSet);
    procedure zqDetalleMuestrasNewRecord(DataSet: TDataSet);
    procedure zqLancesBeforeOpen(DataSet: TDataSet);
    procedure zqMuestrasAfterOpen(DataSet: TDataSet);
    procedure zqMuestrasAfterScroll(DataSet: TDataSet);
    procedure zqMuestrasCalcFields(DataSet: TDataSet);
    procedure zqMuestrasidlanceValidate(Sender: TField);
    procedure zqMuestrasNewRecord(DataSet: TDataSet);
  private
    FOrdenEspecies: integer;
    procedure SetOrdenEspecies(AValue: integer);
    { private declarations }
  public
    { public declarations }
    property OrdenEspecies:integer read FOrdenEspecies write SetOrdenEspecies;
  end;

var
  dmMuestras: TdmMuestras;
  max_nro_ejemplar: integer=0;
  ult_sexo: integer=-1;

implementation

{$R *.lfm}

{ TdmMuestras }

procedure TdmMuestras.zqMuestrasNewRecord(DataSet: TDataSet);
begin
  max_nro_ejemplar:=0;
  ult_sexo:=-1;
  zqMuestrasidmuestra.Value:=NuevoID(zqMuestras.Connection,'muestras');
  zqMuestrasidmarea.Value:=dmGeneral.IdMareaActiva;
  zqMuestrasidtipo_muestra.Value:=1; //Código='M'
  if not zqAntMuestraidespecie.IsNull then
     zqMuestrasidespecie.Value:=zqAntMuestraidespecie.Value;
end;

procedure TdmMuestras.zqDetalleMuestrasNewRecord(DataSet: TDataSet);
begin
  zqDetalleMuestrasiddetalle_muestra.Value:=NuevoID(zqMuestras.Connection,'detalle_muestras');
  zqDetalleMuestrasidmuestra.Value:=zqMuestrasidmuestra.Value;
  zqDetalleMuestrasnro_ejemplar.Value:=max_nro_ejemplar+1;
  if ult_sexo in [1,2] then
     zqDetalleMuestrassexo.AsInteger:=ult_sexo;
end;

procedure TdmMuestras.zqDetalleMuestrasAfterOpen(DataSet: TDataSet);
var
  n: integer;
begin
  n:=-1;
  with zqDetalleMuestras do
  begin
    DisableControls;
    first;
    while not EOF do
    begin
      if zqDetalleMuestrasnro_ejemplar.Value>max_nro_ejemplar then
         max_nro_ejemplar:=zqDetalleMuestrasnro_ejemplar.Value;
         ult_sexo:=zqDetalleMuestrassexo.AsInteger;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

procedure TdmMuestras.zqAntMuestraBeforeOpen(DataSet: TDataSet);
begin
  zqAntMuestra.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if (not zqMuestrasfecha.IsNull) and (not zqMuestrashora.IsNull) then
    zqAntMuestra.ParamByName('fecha_hora').AsDateTime:=zqMuestrasfecha.AsDateTime+zqMuestrashora.AsDateTime
  else
    zqAntMuestra.ParamByName('fecha_hora').Value:=Null;
end;

procedure TdmMuestras.zqDetalleMuestrasBeforeOpen(DataSet: TDataSet);
begin
  zqDetalleMuestras.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
end;

procedure TdmMuestras.zqDetalleMuestrasBeforePost(DataSet: TDataSet);
begin
  if zqDetalleMuestras.State in [dsInsert] then
  begin
    if zqDetalleMuestrasnro_ejemplar.Value>max_nro_ejemplar then
    begin
       max_nro_ejemplar:=zqDetalleMuestrasnro_ejemplar.Value;
    end;
    ult_sexo:=zqDetalleMuestrassexo.AsInteger;
  end;
end;

procedure TdmMuestras.zqDetalleMuestrasCalcFields(DataSet: TDataSet);
begin
  zqDetalleMuestrasPesoKg.Value:=zqDetalleMuestraspeso.Value/1000;
  zqDetalleMuestras.DisableControls;
  zqDetalleMuestras.EnableControls;
end;

procedure TdmMuestras.zqLancesBeforeOpen(DataSet: TDataSet);
begin
  zqLances.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TdmMuestras.zqMuestrasAfterOpen(DataSet: TDataSet);
begin
  zqAntMuestra.Close;
  zqAntMuestra.Open;
end;

procedure TdmMuestras.zqMuestrasAfterScroll(DataSet: TDataSet);
begin
  zqDetalleMuestras.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
end;

procedure TdmMuestras.zqMuestrasCalcFields(DataSet: TDataSet);
begin
  zqMuestrasEncabezado.Value:='Lance '+zqMuestrasdsc_virada.Value;
  zqMuestras.DisableControls;
  zqMuestras.EnableControls;
end;

procedure TdmMuestras.zqMuestrasidlanceValidate(Sender: TField);
begin
  if not zqMuestrastipo_trampa_lance.IsNull then
  begin
    zqMuestrasidtipo_trampa.Value:=zqMuestrastipo_trampa_lance.Value;
  end;
end;

procedure TdmMuestras.SetOrdenEspecies(AValue: integer);
begin
  if FOrdenEspecies=AValue then Exit;
  FOrdenEspecies:=AValue;
end;

end.

