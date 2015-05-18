unit frmexportarlances;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF MSWINDOWS}
  Windows,windirs,
  {$ENDIF}
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DbCtrls, EditBtn, Buttons, ActnList, DBGrids, ExtCtrls,
  datGeneral, ZDataset, ZSqlUpdate, db, memds, LSConfig;

type

  { TfmExportarLances }

  TfmExportarLances = class(TForm)
    acExportarLances: TAction;
    ActionList1: TActionList;
    bbGuardar: TBitBtn;
    cbMarcarEnviados: TCheckBox;
    dtFechaIni: TDateTimePicker;
    dtFechaFin: TDateTimePicker;
    dedCarpetaArchivo: TDirectoryEdit;
    dsExpLances: TDataSource;
    dbgLances: TDBGrid;
    dsTmp: TDataSource;
    dsLances: TDataSource;
    gbDestino: TGroupBox;
    gbProduccion: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mdsTmp: TMemDataset;
    rgFormato: TRadioGroup;
    rgFiltro: TRadioGroup;
    zqExpLancescanastos_procesados: TLongintField;
    zqExpLancescant_trampas: TLargeintField;
    zqExpLancescentolla_comercial: TLargeintField;
    zqExpLancescentolla_total: TLargeintField;
    zqExpLancescomentarios_calado: TStringField;
    zqExpLancescomentarios_virada: TStringField;
    zqExpLancesenviado: TSmallintField;
    zqExpLancesfecha: TDateTimeField;
    zqExpLancesidlance: TLongintField;
    zqExpLancesinvestigacion: TStringField;
    zqExpLanceslat_fin_calado: TFloatField;
    zqExpLanceslat_fin_virada: TFloatField;
    zqExpLanceslat_ini_calado: TFloatField;
    zqExpLanceslat_ini_virada: TFloatField;
    zqExpLanceslong_fin_calado: TFloatField;
    zqExpLanceslong_fin_virada: TFloatField;
    zqExpLanceslong_ini_calado: TFloatField;
    zqExpLanceslong_ini_virada: TFloatField;
    zqExpLancesnro_lance: TLongintField;
    zqExpLancesoperacion: TStringField;
    zqExpLancesseleccionado: TSmallintField;
    zqExpLancestrampas_con_fallo: TLargeintField;
    zqExpLancestrampas_sin_puerta: TLargeintField;
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
    zqLancesdsc_lance: TStringField;
    zqLancesdsc_virada: TStringField;
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
    zqExpLances: TZQuery;
    zqProduccion: TZQuery;
    zqProduccioncajas_p1: TLargeintField;
    zqProduccioncajas_p10: TLargeintField;
    zqProduccioncajas_p2: TLargeintField;
    zqProduccioncajas_p3: TLargeintField;
    zqProduccioncajas_p4: TLargeintField;
    zqProduccioncajas_p5: TLargeintField;
    zqProduccioncajas_p6: TLargeintField;
    zqProduccioncajas_p7: TLargeintField;
    zqProduccioncajas_p8: TLargeintField;
    zqProduccioncajas_p9: TLargeintField;
    zqProduccionfecha: TDateField;
    zqProduccionkilos_p1: TFloatField;
    zqProduccionkilos_p10: TFloatField;
    zqProduccionkilos_p2: TFloatField;
    zqProduccionkilos_p3: TFloatField;
    zqProduccionkilos_p4: TFloatField;
    zqProduccionkilos_p5: TFloatField;
    zqProduccionkilos_p6: TFloatField;
    zqProduccionkilos_p7: TFloatField;
    zqProduccionkilos_p8: TFloatField;
    zqProduccionkilos_p9: TFloatField;
    zqProduccionp1: TStringField;
    zqProduccionp10: TStringField;
    zqProduccionp2: TStringField;
    zqProduccionp3: TStringField;
    zqProduccionp4: TStringField;
    zqProduccionp5: TStringField;
    zqProduccionp6: TStringField;
    zqProduccionp7: TStringField;
    zqProduccionp8: TStringField;
    zqProduccionp9: TStringField;
    zqProducciontot_cajas: TLargeintField;
    zqProducciontot_kilos: TFloatField;
    zuExpLances: TZUpdateSQL;
    procedure acExportarLancesExecute(Sender: TObject);
    procedure ExportarTxt;
    procedure ExportarExcel;
    procedure dbgLancesColEnter(Sender: TObject);
    procedure dblkLanceFinChange(Sender: TObject);
    procedure dblkLanceIniChange(Sender: TObject);
    procedure dedCarpetaArchivoAcceptDirectory(Sender: TObject;
      var Value: String);
    procedure dedCarpetaArchivoChange(Sender: TObject);
    procedure dedCarpetaArchivoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgFiltroClick(Sender: TObject);
    procedure zqExpLancesAfterOpen(DataSet: TDataSet);
    procedure zqExpLancesBeforeOpen(DataSet: TDataSet);
    procedure zqLancesBeforeOpen(DataSet: TDataSet);
    procedure zqProduccionBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
    Procedure HabilitarAcciones;
  public
    { public declarations }
  end;

var
  fmExportarLances: TfmExportarLances;
  max_fecha_lance: TDateTime=-1;
  fecha_ini_prod, fecha_fin_prod:TDateTime;

implementation

{$R *.lfm}

{ TfmExportarLances }

procedure TfmExportarLances.FormShow(Sender: TObject);
var
  destino:String;
begin
//  destino:= ipsPreferencias.ReadString('carpeta_destino', GetWindowsSpecialDir(CSIDL_PERSONAL));
  LSLoadConfig(['destino_archivo_lances'],[destino],[@destino]);
  {$IFDEF MSWINDOWS}
  if destino='' then
     destino:=GetWindowsSpecialDir(CSIDL_PERSONAL);
  {$ENDIF}
  dedCarpetaArchivo.Directory := destino;
  zqLances.Close;
  zqLances.Open;
  zqExpLances.Close;
  zqExpLances.Open;
  HabilitarAcciones;
end;

procedure TfmExportarLances.rgFiltroClick(Sender: TObject);
begin
  zqExpLances.Close;
  zqExpLances.Open;
end;

procedure TfmExportarLances.zqExpLancesAfterOpen(DataSet: TDataSet);
begin
  fecha_ini_prod:=MaxDateTime;
  fecha_fin_prod:=MinDateTime;
  with zqExpLances do
  begin
    DisableControls;
    First;
    while not EOF do
    begin
      if zqExpLancesenviado.AsBoolean=False then
      begin
        Edit;
        zqExpLancesseleccionado.AsBoolean:=True;
        Post;
      end;
      if zqExpLancesoperacion.AsString='Virado' then
      begin
        if zqExpLancesfecha.AsDateTime>fecha_fin_prod then
           fecha_fin_prod:=zqExpLancesfecha.AsDateTime;
        if zqExpLancesfecha.AsDateTime<fecha_ini_prod then
           fecha_ini_prod:=zqExpLancesfecha.AsDateTime;
      end;
    Next;
    end;
    First;
    if fecha_ini_prod<>MaxDateTime then
       dtFechaIni.Date:=fecha_ini_prod;
    if fecha_fin_prod<>MinDateTime then
       dtFechaFin.Date:=fecha_fin_prod;
    EnableControls;
  end;
end;

procedure TfmExportarLances.zqExpLancesBeforeOpen(DataSet: TDataSet);
begin
  zqExpLances.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  zqExpLances.ParamByName('filtro').Value:=rgFiltro.ItemIndex;
end;

procedure TfmExportarLances.dedCarpetaArchivoChange(Sender: TObject);
begin
  LSSaveConfig(['destino_archivo_lances'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TfmExportarLances.dedCarpetaArchivoExit(Sender: TObject);
begin
  LSSaveConfig(['destino_archivo_lances'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TfmExportarLances.dedCarpetaArchivoAcceptDirectory(Sender: TObject;
  var Value: String);
begin
  LSSaveConfig(['destino_archivo_lances'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TfmExportarLances.acExportarLancesExecute(Sender: TObject);
begin
  if rgFormato.ItemIndex=0 then
     ExportarTxt
  else
    ExportarExcel;
end;

procedure TfmExportarLances.ExportarTxt;
var
  s:TStringList;
  tmp, archivo:string;
  i:integer;
  OLD_DC:char;
begin
  if dedCarpetaArchivo.Directory <> '' then
  begin
      try
        OLD_DC:=DecimalSeparator;
        DecimalSeparator:=',';
        s:=TStringList.Create;
        //Creo el encabezado
        s.Add(Trim('Marea: '+dmGeneral.zqMareaActivaMarea.AsString));
        s.Add(Trim('Observador: '+dmGeneral.zqMareaActivaobservador.AsString));
        s.Add('');
        s.Add('Lance;Linea investigacion;Actividad;Trampas;Rotas o abiertas;Sin puerta o anulada;Fecha/hora;Lat. calado inicial;Long. calado inicial;Lat. calado final;Long. calado final;Lat. virado inicial;Long. virado inicial;Lat. virado final;Long. virado final;Captura total;Captura comercial;Jaulas Prod;Comentarios Calado;Comentarios Virada');
        with zqExpLances do
        begin
          max_fecha_lance:=-1;
          DisableControls;
          First;
          if RecordCount>0 then
          begin
            while not EOF do
            begin
              if zqExpLancesseleccionado.AsBoolean=True then
              begin
                if zqExpLancesfecha.AsDateTime>max_fecha_lance then
                   max_fecha_lance:=zqExpLancesfecha.AsDateTime;
                //Concateno el valor de todos los campos (menos el último, que lo proceso aparte para que no
                //quede con un ";" final
                //Empiezo en el campo [3] porque el [0] es idlance, el [1] es la marca de "Seleccionado",
                // y el [2] es la marca de "Enviado"
                tmp:='';
                for i:=3 to Fields.Count-2 do
                begin
                  tmp:=tmp+Fields[i].AsString+';';
                end;
                tmp:=tmp+Fields[i+1].AsString;
                s.Add(Trim(tmp));
              end;
              Next;
            end;
          end else
          begin
            MessageDlg('No se encontró información de lances para exportar', mtInformation, [mbOK],0)
          end;
          First;
          EnableControls;
        end;

        //Agrego los datos de producción
        with zqProduccion do
        begin
           Close;
           Open;
           First;
           if RecordCount>0 then
           begin
             //Armo la línea de encabezado
             s.Add('');
             s.Add('Producción:');
             tmp:='Fecha;';
             for i:=1 to 10 do
             begin
               if FieldByName('p'+IntToStr(i)).AsString<>'' then
               begin
                 tmp:=tmp+'Cajas '+FieldByName('p'+IntToStr(i)).AsString+';';
                 tmp:=tmp+'Kilos '+FieldByName('p'+IntToStr(i)).AsString+';';
               end;
             end;
             tmp:=tmp+'Total Cajas;Total Kilos';
             s.Add(tmp);
             while not EOF do
             begin
               tmp:=FieldByName('fecha').AsString+';';
               //Agrego los valores siempre que exista el producto
               for i:=1 to 10 do
               begin
                 if FieldByName('p'+IntToStr(i)).AsString<>'' then
                 begin
                   tmp:=tmp+FieldByName('cajas_p'+IntToStr(i)).AsString+';';
                   tmp:=tmp+FieldByName('kilos_p'+IntToStr(i)).AsString+';';
                 end;
               end;
               tmp:=tmp+FieldByName('tot_cajas').AsString+';';
               tmp:=tmp+FieldByName('tot_kilos').AsString;
               s.Add(Trim(tmp));
               Next;
             end;
           end else
           begin
             MessageDlg('No se encontró información de producción para exportar', mtInformation, [mbOK],0)
           end;
        end;
        if max_fecha_lance=-1 then
          archivo:=dedCarpetaArchivo.Directory+DirectorySeparator+FormatDateTime('YYYYmmdd',Date)+'.txt'
        else
          archivo:=dedCarpetaArchivo.Directory+DirectorySeparator+FormatDateTime('YYYYmmdd',max_fecha_lance)+'.txt';

        if (not FileExistsUTF8(archivo)) or (MessageDlg('El archivo '+archivo+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
        begin
          s.SaveToFile(archivo);
          if cbMarcarEnviados.Checked then
             zqExpLances.ApplyUpdates;
          zqExpLances.Close;
          zqExpLances.Open;
          if MessageDlg('El informe de lances se ha generado correctamente y se ha guardado en '+archivo+'. ¿Desea visualizar el contenido del archivo?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
          begin
            {$IFDEF MSWINDOWS}
              ShellExecute(Handle, 'open', PChar(archivo), nil, nil, SW_SHOWNORMAL)
            {$ENDIF}
            {$IFDEF UNIX}
              Shell(format('gv %s',[ExpandFileNameUTF8(archivo)]));
            {$ENDIF}
          end;
        end;
      finally
        DecimalSeparator:=OLD_DC;
        s.Free;
    end;
  end;
end;

procedure TfmExportarLances.ExportarExcel;
begin

end;

procedure TfmExportarLances.dbgLancesColEnter(Sender: TObject);
begin
  //Sólo se permite editar la columna 0 (Seleccionado)
  if dbgLances.SelectedIndex<>0 then
     dbgLances.SelectedIndex := 0;
end;

procedure TfmExportarLances.dblkLanceFinChange(Sender: TObject);
begin
  HabilitarAcciones;
end;

procedure TfmExportarLances.dblkLanceIniChange(Sender: TObject);
begin
  HabilitarAcciones;
end;

procedure TfmExportarLances.zqLancesBeforeOpen(DataSet: TDataSet);
begin
  zqLances.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmExportarLances.zqProduccionBeforeOpen(DataSet: TDataSet);
begin
  zqProduccion.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  zqProduccion.ParamByName('fecha_ini').AsDate:=dtFechaIni.Date;
  zqProduccion.ParamByName('fecha_fin').AsDate:=dtFechaFin.Date;
end;

procedure TfmExportarLances.HabilitarAcciones;
begin
  acExportarLances.Enabled:=(dedCarpetaArchivo.Directory<>'');
end;

end.

