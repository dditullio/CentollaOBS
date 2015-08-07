unit frmlances;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, TAGraph, TASeries, TAFuncSeries,
  TAChartListbox, TASources, TATools, TADataTools, rxdbgrid, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, ActnList, StdCtrls, DBGrids, ComCtrls,
  frmlistabase, db, ZDataset, zcontroladorgrilla, datGeneral, frmeditarlances,
  dateutils, funciones, math, TAChartAxisUtils, TANavigation, types, LSConfig,
  LSControls, TACustomSeries, LCLIntf, TAChartUtils, TALegend;

const
  COLOR_CALADA_NORMAL=$00D7F3FD;
  COLOR_CALADA_INVEST=$005CAAF8;
  COLOR_VIRADA_NORMAL=$00D7FDF3;
  COLOR_VIRADA_INVEST=$005CF8D1;
type

  { TfmLances }

  TfmLances = class(TfmListaBase)
    acGuardarImagen: TAction;
    acInfo: TAction;
    acMedir: TAction;
    acMover: TAction;
    acEtiquetarLances: TAction;
    acZoomLanceSeleccionado: TAction;
    acZoomIn: TAction;
    acZoomLances: TAction;
    acZoomOut: TAction;
    acZoomRect: TAction;
    alMapa: TActionList;
    cbCaladas: TCheckBox;
    cbViradas: TCheckBox;
    ctDistancia2: TDataPointDistanceTool;
    ctZoomDrag2: TZoomDragTool;
    chtLances: TChart;
    chtLancesLanceSeleccionadoSerie1: TLineSeries;
    chtLancesLimiteProvincia1: TLineSeries;
    chtLancesEtiquetaLances: TLineSeries;
    chtLancesMapaBaseSerie1: TBSplineSeries;
    chtLancesOtrasZonasSerie1: TLineSeries;
    chtLancesSerieLancesCalados1: TLineSeries;
    chtLancesSerieLancesCaladosInvest1: TLineSeries;
    chtLancesSerieLancesViradasInvest1: TLineSeries;
    chtLancesSerieLancesVirados1: TLineSeries;
    chtLancesZEESerie1: TLineSeries;
    ckMostrarEtiquetasLances: TCheckBox;
    ctInfoCoordenadas: TUserDefinedTool;
    chtLancesLanceSeleccionadoSerie: TLineSeries;
    chtLancesZEESerie: TLineSeries;
    ChartToolset1: TChartToolset;
    ChartToolset1DataPointCrosshairTool1: TDataPointCrosshairTool;
    chtLancesSerieLancesViradasInvest: TLineSeries;
    chtLancesSerieLancesCaladosInvest: TLineSeries;
    chtLancesSerieLancesCalados: TLineSeries;
    chtLancesMapaBaseSerie: TBSplineSeries;
    chtLancesOtrasZonasSerie: TLineSeries;
    chtLancesSerieLancesVirados: TLineSeries;
    chtLancesLimiteProvincia: TLineSeries;
    ckMapaLances: TCheckBox;
    ckOcultarMapaBase: TCheckBox;
    clbReferencias: TChartListbox;
    ctDistancia: TDataPointDistanceTool;
    ctInformacion: TDataPointHintTool;
    ctMover: TPanDragTool;
    ctPanDrag: TPanDragTool;
    ctZoomDrag: TZoomDragTool;
    ctZoomIn: TZoomClickTool;
    ctZoomOut: TZoomClickTool;
    ctZoomWheel: TZoomMouseWheelTool;
    dsLances: TDataSource;
    dtFecha: TDateTimePicker;
    ilToolbar: TImageList;
    lcsEtiquetasUM: TListChartSource;
    lcsLancesCaladosInvest: TListChartSource;
    lcsEtiquetasLances: TListChartSource;
    lcsLanceSeleccionado: TListChartSource;
    lcsLancesVirados: TListChartSource;
    lcsLancesCalados: TListChartSource;
    lcsLancesViradosInvest: TListChartSource;
    lcsZEE: TListChartSource;
    lcsMapaBase: TListChartSource;
    lcsOtrasZonas: TListChartSource;
    lcsLimiteProvincia: TListChartSource;
    LSExpandPanel1: TLSExpandPanel;
    paBaseMapa: TPanel;
    Panel2: TPanel;
    sbInfoMapa: TStatusBar;
    sdGuardarImagen: TSaveDialog;
    splDetalles: TSplitter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
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
    zqLancesetiqueta_fin: TStringField;
    zqLancesetiqueta_inicio: TStringField;
    zqLancesfecha_fin_calado: TDateField;
    zqLancesfecha_fin_virada: TDateField;
    zqLancesfecha_hora_orden: TDateTimeField;
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
    zqLanceslat_fin_gis: TFloatField;
    zqLanceslat_fin_virada: TFloatField;
    zqLanceslat_ini_calado: TFloatField;
    zqLanceslat_ini_gis: TFloatField;
    zqLanceslat_ini_virada: TFloatField;
    zqLancesLongFin: TFloatField;
    zqLancesLongIni: TFloatField;
    zqLanceslong_fin_calado: TFloatField;
    zqLanceslong_fin_gis: TFloatField;
    zqLanceslong_fin_virada: TFloatField;
    zqLanceslong_ini_calado: TFloatField;
    zqLanceslong_ini_gis: TFloatField;
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
    zqOtrosMapas: TZQuery;
    procedure acEtiquetarLancesExecute(Sender: TObject);
    procedure acGuardarImagenExecute(Sender: TObject);
    procedure acHabilitarHerramienta(Sender: TObject);
    procedure acZoomLanceSeleccionadoExecute(Sender: TObject);
    procedure acZoomLancesExecute(Sender: TObject);
    procedure cbCaladasChange(Sender: TObject);
    procedure cbViradasChange(Sender: TObject);
    procedure chtLancesAxisList0MarkToText(var AText: String; AMark: Double);
    procedure chtLancesAxisList1MarkToText(var AText: String; AMark: Double);
    procedure chtLancesExtentChanged(ASender: TChart);
    procedure ckMapaLancesChange(Sender: TObject);
    procedure ckMostrarEtiquetasLancesChange(Sender: TObject);
    procedure clbReferenciasAddSeries(ASender: TChartListbox;
      ASeries: TCustomChartSeries; AItems: TChartLegendItems; var ASkip: Boolean
      );
    procedure clbReferenciasCheckboxClick(ASender: TObject; AIndex: Integer);
    procedure ctDistanciaGetDistanceText(ASender: TDataPointDistanceTool;
      var AText: String);
    procedure ctInfoCoordenadasAfterMouseMove(ATool: TChartTool; APoint: TPoint
      );
    procedure dbgListaCellClick(Column: TColumn);
    procedure dbgListaGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure paGrillaResize(Sender: TObject);
    procedure Panel2MouseLeave(Sender: TObject);
    procedure zqLancesAfterOpen(DataSet: TDataSet);
    procedure zqLancesBeforeOpen(DataSet: TDataSet);
    procedure zqLancesCalcFields(DataSet: TDataSet);
  private
    { private declarations }
    procedure CargarMapa(mapa: string; var lcs: TListChartSource;clearSource: boolean=True;campoEtiqueta:string='');
    procedure InicializarMapas;
    procedure CargarMapaLances;
    procedure ZoomALances;
  public
    { public declarations }
  end;

var
  fmLances: TfmLances;
  FMapasCargados: Boolean=False;

implementation

{$R *.lfm}
{$R cursores.res}

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

procedure TfmLances.CargarMapa(mapa: string; var lcs: TListChartSource;
  clearSource: boolean; campoEtiqueta: string);
var
  Texto: string;
begin
  //Mapa de Argentina
  zqOtrosMapas.Close;
  zqOtrosMapas.ParamByName('mapa').AsString:=mapa;
  zqOtrosMapas.Open;
  if clearSource then
     lcs.Clear
  else
      lcs.Add(NaN,NaN);
  with zqOtrosMapas do
  begin
    First;
    while not EOF do
    begin
      if campoEtiqueta<>'' then
         Texto:=FieldByName(campoEtiqueta).AsString;
      if (FieldByName('Longitud').AsFloat<>0) and (FieldByName('Latitud').AsFloat<>0) then
         lcs.Add(FieldByName('Longitud').AsFloat,FieldByName('Latitud').AsFloat,Texto)
      else
          lcs.Add(NaN,NaN);
      Next;
    end;
  end;
end;

procedure TfmLances.InicializarMapas;
begin
  //Si el mapa no está cargado, lo cargo
  if not FMapasCargados then
  begin
    CargarMapa('ARGENTINA', lcsMapaBase);
    CargarMapa('URUGUAY', lcsMapaBase, False);
    CargarMapa('LIMITE PROVINCIAL', lcsLimiteProvincia);
    CargarMapa('ZONA ECONOMICA EXCLUSIVA', lcsZEE);
    CargarMapa('VEDA MERLUZA', lcsOtrasZonas);
    CargarMapa('VEDA MERLUZA NEGRA', lcsOtrasZonas, False);
    CargarMapa('ZONA COMUN', lcsOtrasZonas, False);
    CargarMapaLances;
    FMapasCargados:=True;
  end;
end;

procedure TfmLances.CargarMapaLances;
var
  bm: TBookMark;
  str_invest: string;
  prom_lat, prom_long: double;
begin
  lcsLancesVirados.Clear;
  lcsLancesCalados.Clear;
  lcsLancesViradosInvest.Clear;
  lcsLancesCaladosInvest.Clear;
  lcsLanceSeleccionado.Clear;
  lcsEtiquetasLances.Clear;
  chtLances.Refresh;
  if (zqLances.RecordCount > 0) and (ckMapaLances.Checked) then
  begin
    with zqLances do
    begin
      DisableControls;
      bm:=GetBookmark;
      First;
      while not EOF do
      begin
        if (not FieldByName('long_ini_gis').IsNull)
           and (not FieldByName('lat_ini_gis').IsNull)
           and (not FieldByName('long_fin_gis').IsNull)
           and (not FieldByName('lat_fin_gis').IsNull) then
        begin

          if FieldByName('investigacion').AsBoolean then
          begin
            str_invest:='Línea de INIDEP'+LineEnding;
          end else
          begin
               str_invest:='';
          end;
          if FieldByName('calada').AsBoolean then
          begin
            lcsLancesCalados.Add(FieldByName('long_ini_gis').AsFloat,FieldByName('lat_ini_gis').AsFloat,str_invest+FieldByName('etiqueta_inicio').AsString, clGreen);
            lcsLancesCalados.Add(FieldByName('long_fin_gis').AsFloat,FieldByName('lat_fin_gis').AsFloat,str_invest+FieldByName('etiqueta_fin').AsString, clRed);
            lcsLancesCalados.Add(NaN,NaN);
            //Si es línea de investigación, también la agrego a la otra serie
            if FieldByName('investigacion').AsBoolean then
            begin
              lcsLancesCaladosInvest.Add(FieldByName('long_ini_gis').AsFloat,FieldByName('lat_ini_gis').AsFloat,str_invest+FieldByName('etiqueta_inicio').AsString, clGreen);
              lcsLancesCaladosInvest.Add(FieldByName('long_fin_gis').AsFloat,FieldByName('lat_fin_gis').AsFloat,str_invest+FieldByName('etiqueta_fin').AsString, clRed);
              lcsLancesCaladosInvest.Add(NaN,NaN);
            end;
          end;
          if FieldByName('virada').AsBoolean then
          begin
            lcsLancesVirados.Add(FieldByName('long_ini_gis').AsFloat,FieldByName('lat_ini_gis').AsFloat,'Lance N° '+IntToStr(FieldByName('orden_virada').AsInteger)+LineEnding+str_invest+FieldByName('etiqueta_inicio').AsString, clGreen);
            lcsLancesVirados.Add(FieldByName('long_fin_gis').AsFloat,FieldByName('lat_fin_gis').AsFloat,'Lance N° '+IntToStr(FieldByName('orden_virada').AsInteger)+LineEnding+str_invest+FieldByName('etiqueta_fin').AsString, clRed);
            lcsLancesVirados.Add(NaN,NaN);
            //Si es línea de investigación, también la agrego a la otra serie
            if FieldByName('investigacion').AsBoolean then
            begin
              lcsLancesViradosInvest.Add(FieldByName('long_ini_gis').AsFloat,FieldByName('lat_ini_gis').AsFloat,'Lance N° '+IntToStr(FieldByName('orden_virada').AsInteger)+LineEnding+str_invest+FieldByName('etiqueta_inicio').AsString, clGreen);
              lcsLancesViradosInvest.Add(FieldByName('long_fin_gis').AsFloat,FieldByName('lat_fin_gis').AsFloat,'Lance N° '+IntToStr(FieldByName('orden_virada').AsInteger)+LineEnding+str_invest+FieldByName('etiqueta_fin').AsString, clRed);
              lcsLancesViradosInvest.Add(NaN,NaN);
            end;
          end;
          //Calculo el punto medio del lance para colocar la etiqueta
          prom_long:=(FieldByName('long_ini_gis').AsFloat+FieldByName('long_fin_gis').AsFloat)/2;
          prom_lat:=(FieldByName('lat_ini_gis').AsFloat+FieldByName('lat_fin_gis').AsFloat)/2;
          if FieldByName('virada').AsBoolean then
             lcsEtiquetasLances.Add(prom_long,prom_lat,'L'+FieldByName('orden_virada').AsString+'-'+FormatDateTime('dd/mm hh:mm',FieldByName('fecha_hora_orden').AsDateTime))
          else
             lcsEtiquetasLances.Add(prom_long,prom_lat,FormatDateTime('dd/mm hh:mm',FieldByName('fecha_hora_orden').AsDateTime));
          lcsEtiquetasLances.Add(NaN,NaN);
        end;
        Next;
      end;
      if BookmarkValid(bm) then
         GotoBookmark(bm);
      EnableControls;
    end;
    ZoomALances;
  end;
end;

procedure TfmLances.ZoomALances;
var
  NewExtent: TDoubleRect;
begin
  if (lcsLancesCalados.Count>0) or (lcsLancesVirados.Count>0) then
  begin
    NewExtent.a.X:=Min(chtLancesSerieLancesCalados.Extent.a.X, chtLancesSerieLancesVirados.Extent.a.X);
    NewExtent.a.Y:=Min(chtLancesSerieLancesCalados.Extent.a.Y, chtLancesSerieLancesVirados.Extent.a.Y);
    NewExtent.b.X:=Max(chtLancesSerieLancesCalados.Extent.b.X, chtLancesSerieLancesVirados.Extent.b.X);
    NewExtent.b.Y:=Max(chtLancesSerieLancesCalados.Extent.b.Y, chtLancesSerieLancesVirados.Extent.b.Y);
     chtLances.LogicalExtent:=NewExtent;
  end;
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

procedure TfmLances.acGuardarImagenExecute(Sender: TObject);
begin
  if sdGuardarImagen.Execute then
  begin
    if (not FileExistsUTF8(sdGuardarImagen.FileName)) or (MessageDlg('El archivo '+sdGuardarImagen.FileName+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
    begin
      chtLances.Title.Visible:=True;
      chtLances.Foot.Visible:=True;
      chtLances.SaveToFile(TJPEGImage, sdGuardarImagen.FileName);
      chtLances.Title.Visible:=False;
      chtLances.Foot.Visible:=False;
      OpenDocument(sdGuardarImagen.FileName);
    end;
  end;
end;

procedure TfmLances.acEtiquetarLancesExecute(Sender: TObject);
begin
  //Se quita esta funcionalidad porque la pantalla queda muy sobrecargada
  //chtLancesSerieLancesCalados.Marks.Visible:=tbEtiquetarLances.Down;
  //chtLancesSerieLancesVirados.Marks.Visible:=tbEtiquetarLances.Down;
end;

procedure TfmLances.acHabilitarHerramienta(Sender: TObject);
begin
  if (Sender is TAction) then
  begin
    ctInformacion.Enabled:= ((Sender as TAction).Tag=1);
    ctMover.Enabled:= ((Sender as TAction).Tag=2);
    ctZoomIn.Enabled:= ((Sender as TAction).Tag=3);
    ctZoomOut.Enabled:= ((Sender as TAction).Tag=4);
    ctZoomDrag.Enabled:= ((Sender as TAction).Tag=5);
    ctDistancia.Enabled:= ((Sender as TAction).Tag=6);
  end;
  //Pongo el cursor correspondiente
  case (Sender as TAction).Tag of
  2: chtLances.Cursor:=1;
  3: chtLances.Cursor:=2;
  4: chtLances.Cursor:=3;
  5: chtLances.Cursor:=4;
  6: chtLances.Cursor:=5;
  else
    chtLances.Cursor:=crDefault;
  end;
end;

procedure TfmLances.acZoomLanceSeleccionadoExecute(Sender: TObject);
var
  NewExtent: TDoubleRect;
begin
  if lcsLanceSeleccionado.Count>0 then
  begin
    NewExtent.a.X:=lcsLanceSeleccionado.Extent.a.X-max(0.001,abs((lcsLanceSeleccionado.Extent.a.X-lcsLanceSeleccionado.Extent.b.X)));
    NewExtent.a.Y:=lcsLanceSeleccionado.Extent.a.Y-max(0.001,abs((lcsLanceSeleccionado.Extent.a.Y-lcsLanceSeleccionado.Extent.b.Y)));
    NewExtent.b.X:=lcsLanceSeleccionado.Extent.b.X+max(0.001,abs((lcsLanceSeleccionado.Extent.a.X-lcsLanceSeleccionado.Extent.b.X)));
    NewExtent.b.Y:=lcsLanceSeleccionado.Extent.b.Y+max(0.001,abs((lcsLanceSeleccionado.Extent.a.Y-lcsLanceSeleccionado.Extent.b.Y)));
    chtLances.LogicalExtent:=NewExtent;
  end;
end;

procedure TfmLances.acZoomLancesExecute(Sender: TObject);
begin
     ZoomALances;
end;

procedure TfmLances.cbViradasChange(Sender: TObject);
begin
  if (not cbViradas.Checked) and (not cbCaladas.Checked) then
     cbCaladas.Checked:=TRUE;
  zcgLista.Buscar;
end;

procedure TfmLances.chtLancesAxisList0MarkToText(var AText: String;
  AMark: Double);
begin
  Atext:=FormatFloat('#°00.00´', GradoDecimalAGradoMinuto(AMark));
end;

procedure TfmLances.chtLancesAxisList1MarkToText(var AText: String;
  AMark: Double);
begin
  Atext:=FormatFloat('#°00.00´', GradoDecimalAGradoMinuto(AMark));
end;

procedure TfmLances.chtLancesExtentChanged(ASender: TChart);
var
  ext_y: double;
begin
  //Si se aumenta el zoom como para mostrar menos de 1/2 grado en vertical,
  //deshabilito el mapa base (si está marcada esta opción)
  ext_y:=ABS(chtLances.LogicalExtent.a.Y-chtLances.LogicalExtent.b.Y);
  if ckOcultarMapaBase.Checked then
  begin
       if (ext_y<0.5) and (chtLancesMapaBaseSerie.Active) then
          chtLancesMapaBaseSerie.Active:=False
       else if (ext_y>=0.5) and (not chtLancesMapaBaseSerie.Active) then
          chtLancesMapaBaseSerie.Active:=True;
  end;
  //Muestro las etiquetas de los lances cuando el zoom se aumenta como para
  //mostrar menos de 1/8 de grado en vertical
  if ckMostrarEtiquetasLances.Checked then
  begin
     if (ext_y<1/8) and (not chtLancesEtiquetaLances.Active) then
        chtLancesEtiquetaLances.Active:=True
     else if (ext_y>=1/8) and (chtLancesEtiquetaLances.Active) then
        chtLancesEtiquetaLances.Active:=False;
  end;
end;

procedure TfmLances.ckMapaLancesChange(Sender: TObject);
begin
  if ckMapaLances.Checked then
  begin
    paDetalles.Visible:=True;
    splDetalles.Visible:=True;
  end else
  begin
    splDetalles.Visible:=False;
    paDetalles.Visible:=False;
  end;
  ckMapaLances.Checked;
  LSSaveConfig(['ver_mapa_lances'], [ckMapaLances.Checked]);
  if ckMapaLances.Checked then
  begin
    InicializarMapas;
  end;
end;

procedure TfmLances.ckMostrarEtiquetasLancesChange(Sender: TObject);
begin
  if not ckMostrarEtiquetasLances.Checked then
     chtLancesEtiquetaLances.Active:=False
  else
    chtLancesExtentChanged(chtLances);
end;

procedure TfmLances.clbReferenciasAddSeries(ASender: TChartListbox;
  ASeries: TCustomChartSeries; AItems: TChartLegendItems; var ASkip: Boolean);
begin
  if ASeries=chtLancesEtiquetaLances then
     ASkip:=True;
end;

procedure TfmLances.clbReferenciasCheckboxClick(ASender: TObject;
  AIndex: Integer);
begin
  clbReferencias.Series[AIndex].Active:=clbReferencias.Checked[AIndex];
end;

procedure TfmLances.ctDistanciaGetDistanceText(ASender: TDataPointDistanceTool;
  var AText: String);
begin
  with ASender do
  begin
    Atext:=Format('Distancia: %f mn', [DistanciaEnMillas(GradoDecimalAGradoMinuto(PointStart.GraphPos.Y), GradoDecimalAGradoMinuto(PointStart.GraphPos.X), GradoDecimalAGradoMinuto(PointEnd.GraphPos.Y), GradoDecimalAGradoMinuto(PointEnd.GraphPos.X))])
                              +LineEnding+'Rumbo: '+FormatFloat('000°', Rumbo(Abs(GradoDecimalAGradoMinuto(PointStart.GraphPos.Y)),
                                                                        Abs(GradoDecimalAGradoMinuto(PointStart.GraphPos.X)),
                                                                        Abs(GradoDecimalAGradoMinuto(PointEnd.GraphPos.Y)),
                                                                        Abs(GradoDecimalAGradoMinuto(PointEnd.GraphPos.X))));
  end;
end;

procedure TfmLances.ctInfoCoordenadasAfterMouseMove(ATool: TChartTool;
  APoint: TPoint);
begin
  sbInfoMapa.Panels[0].Text:='Latitud: '+FormatFloat('00° 00.00´ S', Abs(GradoDecimalAGradoMinuto(chtLances.ImageToGraph(APoint).Y)))+
                         ' - Longitud: '+FormatFloat('00° 00.00´ O', Abs(GradoDecimalAGradoMinuto(chtLances.ImageToGraph(APoint).X)));
end;

procedure TfmLances.dbgListaCellClick(Column: TColumn);
var
  str_invest: string;
begin
  lcsLanceSeleccionado.Clear;
  with zqLances do
  begin
    if (not FieldByName('long_ini_gis').IsNull)
       and (not FieldByName('lat_ini_gis').IsNull)
       and (not FieldByName('long_fin_gis').IsNull)
       and (not FieldByName('lat_fin_gis').IsNull) then
    begin
      if FieldByName('investigacion').AsBoolean then
      begin
        str_invest:='Línea de INIDEP'+LineEnding;
      end else
      begin
           str_invest:='';
      end;
      if FieldByName('virada').AsBoolean then
      begin
        lcsLanceSeleccionado.Add(FieldByName('long_ini_gis').AsFloat,FieldByName('lat_ini_gis').AsFloat,'Lance N° '+IntToStr(FieldByName('orden_virada').AsInteger)+LineEnding+str_invest+FieldByName('etiqueta_inicio').AsString, clGreen);
        lcsLanceSeleccionado.Add(FieldByName('long_fin_gis').AsFloat,FieldByName('lat_fin_gis').AsFloat,'Lance N° '+IntToStr(FieldByName('orden_virada').AsInteger)+LineEnding+str_invest+FieldByName('etiqueta_fin').AsString, clRed);
      end else
      begin
        lcsLanceSeleccionado.Add(FieldByName('long_ini_gis').AsFloat,FieldByName('lat_ini_gis').AsFloat,str_invest+FieldByName('etiqueta_inicio').AsString, clGreen);
        lcsLanceSeleccionado.Add(FieldByName('long_fin_gis').AsFloat,FieldByName('lat_fin_gis').AsFloat,str_invest+FieldByName('etiqueta_fin').AsString, clRed);
      end;
      lcsLanceSeleccionado.Add(NaN,NaN);
    end;
  end;

end;

procedure TfmLances.dtFechaCheckBoxChange(Sender: TObject);
begin
  if dtFecha.Checked then
     dtFecha.Date:=Date
  else
    dtFecha.Date:=NullDate;
  zcgLista.Buscar;
end;

procedure TfmLances.FormCreate(Sender: TObject);
var
  Cur: TCursorImage;
begin
  Cur := TCursorImage.Create;
  Cur.LoadFromResourceName(HInstance, 'VPRHANDOPEN');
  Screen.Cursors[1] := Cur.ReleaseHandle;
  Cur.LoadFromResourceName(HInstance, 'ZOOM_IN');
  Screen.Cursors[2] := Cur.ReleaseHandle;
  Cur.LoadFromResourceName(HInstance, 'ZOOM_OUT');
  Screen.Cursors[3] := Cur.ReleaseHandle;
  Cur.LoadFromResourceName(HInstance, 'MAGNIFY_REGION');
  Screen.Cursors[4] := Cur.ReleaseHandle;
  Cur.LoadFromResourceName(HInstance, 'CR_CROSS');
  Screen.Cursors[5] := Cur.ReleaseHandle;
  Cur.LoadFromResourceName(HInstance, 'VPRHANDCLOSED');
  Screen.Cursors[6] := Cur.ReleaseHandle;
  Cur.Free;

  chtLances.Cursor:=1;
  ctMover.ActiveCursor:=6;
end;

procedure TfmLances.FormShow(Sender: TObject);
var
  str_conf: string;
begin
  dtFecha.Date:=NullDate;
  chtLances.Title.Text.Text:=PChar('Marea: '+dmGeneral.DscMareaActiva);
  chtLances.Foot.Text.Text:=PChar('Mapa generado por: '+ApplicationName+' v'+APP_VERSION);
  FMapasCargados:=False;
  LSLoadConfig(['ver_mapa_lances'], [str_conf], [@str_conf]);
  ckMapaLances.Checked:=(str_conf='True');
  inherited;
end;

procedure TfmLances.paGrillaResize(Sender: TObject);
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

procedure TfmLances.Panel2MouseLeave(Sender: TObject);
begin
  sbInfoMapa.Panels[0].Text:='';
end;

procedure TfmLances.zqLancesAfterOpen(DataSet: TDataSet);
begin
  if ckMapaLances.Checked then
  begin
    if not FMapasCargados then
       InicializarMapas
    else
       CargarMapaLances;
  end;
end;

end.

