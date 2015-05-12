unit frmlances;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, rxdbgrid, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, ActnList, StdCtrls, DBGrids,
  frmlistabase, db, ZDataset, zcontroladorgrilla, datGeneral, frmeditarlances,
  dateutils, funciones;

const
  COLOR_CALADA_NORMAL=$00D7F3FD;
  COLOR_CALADA_INVEST=$005CAAF8;
  COLOR_VIRADA_NORMAL=$00D7FDF3;
  COLOR_VIRADA_INVEST=$005CF8D1;
type

  { TfmLances }

  TfmLances = class(TfmListaBase)
    cbCaladas: TCheckBox;
    cbViradas: TCheckBox;
    dsLances: TDataSource;
    dtFecha: TDateTimePicker;
    zqLances: TZQuery;
    zqLancescalada: TLongintField;
    zqLancescanastos_procesados: TLongintField;
    zqLancescant_trampas_caladas: TLongintField;
    zqLancescant_trampas_recuperadas: TLongintField;
    zqLancescluster_por_canasto: TLongintField;
    zqLancescod_estado_mar: TLongintField;
    zqLancescomentarios_calado: TStringField;
    zqLancescomentarios_virada: TStringField;
    zqLancesdias_en_agua: TFloatField;
    zqLancesdireccion_viento: TLongintField;
    zqLancesDistancia: TFloatField;
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
    zqLancesLatFin: TFloatField;
    zqLancesLatIni: TFloatField;
    zqLanceslat_fin_calado: TFloatField;
    zqLanceslat_fin_virada: TFloatField;
    zqLanceslat_ini_calado: TFloatField;
    zqLanceslat_ini_virada: TFloatField;
    zqLancesLongFin: TFloatField;
    zqLancesLongIni: TFloatField;
    zqLanceslong_fin_calado: TFloatField;
    zqLanceslong_fin_virada: TFloatField;
    zqLanceslong_ini_calado: TFloatField;
    zqLanceslong_ini_virada: TFloatField;
    zqLancesnro_boya: TLongintField;
    zqLancesnro_lance: TLongintField;
    zqLancesnro_linea: TLongintField;
    zqLancesnudos_viento: TLongintField;
    zqLancesorden_virada: TLargeintField;
    zqLancesprofundidad_fin_calado: TLongintField;
    zqLancesprofundidad_fin_virada: TLongintField;
    zqLancesprofundidad_ini_calado: TLongintField;
    zqLancesprofundidad_ini_virada: TLongintField;
    zqLancesprospeccion: TSmallintField;
    zqLancesrumbo_calado: TLongintField;
    zqLancesVelocidadNecesaria: TFloatField;
    zqLancesvirada: TLongintField;
    procedure cbCaladasChange(Sender: TObject);
    procedure cbViradasChange(Sender: TObject);
    procedure dbgListaGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqLancesBeforeOpen(DataSet: TDataSet);
    procedure zqLancesCalcFields(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmLances: TfmLances;

implementation

{$R *.lfm}

{ TfmLances }

procedure TfmLances.zqLancesBeforeOpen(DataSet: TDataSet);
begin
  zqLances.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if dtFecha.Checked then
     zqLances.ParamByName('fecha').AsDateTime:=dtFecha.Date
  else
    zqLances.ParamByName('fecha').AsString:='';
  if cbCaladas.Checked then
     zqLances.ParamByName('caladas').AsInteger:=1
  else
    zqLances.ParamByName('caladas').AsInteger:=0;
  if cbViradas.Checked then
     zqLances.ParamByName('viradas').AsInteger:=1
  else
    zqLances.ParamByName('viradas').AsInteger:=0;
end;

procedure TfmLances.zqLancesCalcFields(DataSet: TDataSet);
begin
  {
  zqLancesLatIni.Value := zqLancesgrados_latitud_ini.Value * 100 +
    zqLancesminutos_latitud_ini.Value;
  zqLancesLongIni.Value := zqLancesgrados_longitud_ini.Value * 100 +
    zqLancesminutos_longitud_ini.Value;
  zqLancesLatFin.Value := zqLancesgrados_latitud_fin.Value * 100 +
    zqLancesminutos_latitud_fin.Value;
  zqLancesLongFin.Value := zqLancesgrados_longitud_fin.Value * 100 +
    zqLancesminutos_longitud_fin.Value;

  zqLancesDistancia.Value:=DistanciaEnMillas(zqLancesLatIni.Value, zqLancesLongIni.Value,
      zqLancesLatFin.Value, zqLancesLongFin.Value);
  if (not zqLancesDistancia.IsNull) and
    (zqLancesminutos_arrastre.Value > 0) then
  begin
    zqLancesVelocidadNecesaria.Value :=
      zqLancesDistancia.Value * 60 / zqLancesminutos_arrastre.Value;
  end;
  }
end;

procedure TfmLances.dtFechaChange(Sender: TObject);
begin
  zcgLista.Buscar;
end;

procedure TfmLances.dbgListaGetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
  if zqLancesvirada.AsBoolean then
  begin
     if zqLancesinvestigacion.AsBoolean then
       Background := COLOR_VIRADA_INVEST
     else
       Background := COLOR_VIRADA_NORMAL;
  end else //No está virada
  begin
     if zqLancesinvestigacion.AsBoolean then
       Background := COLOR_CALADA_INVEST
     else
       Background := COLOR_CALADA_NORMAL;
  end;
end;

procedure TfmLances.cbCaladasChange(Sender: TObject);
begin
  if (not cbCaladas.Checked) and (not cbViradas.Checked) then
     cbViradas.Checked:=TRUE;
  zcgLista.Buscar;
end;

procedure TfmLances.cbViradasChange(Sender: TObject);
begin
  if (not cbViradas.Checked) and (not cbCaladas.Checked) then
     cbCaladas.Checked:=TRUE;
  zcgLista.Buscar;
end;

procedure TfmLances.dtFechaCheckBoxChange(Sender: TObject);
begin
  if dtFecha.Checked then
     dtFecha.Date:=Date
  else
    dtFecha.Date:=NullDate;
  zcgLista.Buscar;
end;

procedure TfmLances.FormResize(Sender: TObject);
var
  ancho_min_grilla1: integer=1150;
  ancho_min_grilla2: integer=800;
begin
  dbgLista.ColumnByFieldName('cluster_por_canasto').Visible:=dbgLista.Width >=ancho_min_grilla1;
  dbgLista.ColumnByFieldName('prospeccion').Visible:=dbgLista.Width >=ancho_min_grilla1;
  dbgLista.ColumnByFieldName('investigacion').Visible:=dbgLista.Width >=ancho_min_grilla1;
  dbgLista.ColumnByFieldName('dias_en_agua').Visible:=dbgLista.Width >=ancho_min_grilla1;
  dbgLista.ColumnByFieldName('cant_trampas_caladas').Visible:=dbgLista.Width >=ancho_min_grilla1;
  //dbgLista.ColumnByFieldName('nro_linea').Visible:=dbgLista.Width >=ancho_min_grilla2;
  dbgLista.ColumnByFieldName('rumbo_calado').Visible:=dbgLista.Width >=ancho_min_grilla2;
  dbgLista.ColumnByFieldName('profundidad_ini_calado').Visible:=dbgLista.Width >=ancho_min_grilla2;
  dbgLista.ColumnByFieldName('profundidad_fin_virada').Visible:=dbgLista.Width >=ancho_min_grilla2;
  dbgLista.ColumnByFieldName('cant_trampas_recuperadas').Visible:=dbgLista.Width >=ancho_min_grilla2;
//  dbgLista.ColumnByFieldName('canastos_procesados').Visible:=dbgLista.Width >=ancho_min_grilla;
end;

procedure TfmLances.FormShow(Sender: TObject);
begin
  dtFecha.Date:=NullDate;
  inherited;
end;

end.

