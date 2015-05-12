unit frmEditarEnviosEmail;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF MSWINDOWS}
  Windows,windirs,
  {$ENDIF}
  Classes, SysUtils, FileUtil, DividerBevel, DateTimePicker, DBDateTimePicker,
  rxdbgrid, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls,
  Buttons, ActnList, DBGrids, EditBtn, frmzedicionbase, ZDataset, ZSqlUpdate,
  SQLQueryGroup, zcontroladoredicion, zdatasetgroup, db, datGeneral, LSConfig,
  LCLIntf;

type

  { TFmEditarEnviosEmail }

  TFmEditarEnviosEmail = class(TZEdicionBase)
    acExportarLances: TAction;
    acExportarLances1: TAction;
    acAgregarLances: TAction;
    ActionList1: TActionList;
    bbAgregar: TBitBtn;
    bbGuardar: TBitBtn;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    dsDetalleEnvios: TDataSource;
    dbdtFecha: TDBDateTimePicker;
    dbedNroEnvio: TDBEdit;
    dbgLances: TRxDBGrid;
    dedCarpetaArchivo: TDirectoryEdit;
    dsExpLances: TDataSource;
    dsLances: TDataSource;
    dsTmp: TDataSource;
    dtFechaFin: TDBDateTimePicker;
    dtFechaIni: TDBDateTimePicker;
    gbDestino: TGroupBox;
    gbProduccion: TGroupBox;
    gbLances: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LongintField1: TLongintField;
    zqDetalleEnviosenviado: TLargeintField;
    zqDetalleEnviosiddetalle_envio_email: TLongintField;
    zqDetalleEnviosidenvio_email: TLongintField;
    zqDetalleEnviosidlance: TLongintField;
    zqDetalleEnviosidmarea: TLongintField;
    zqDetalleEnviosseleccionado: TLargeintField;
    zqExpLances: TZQuery;
    zqExpLancescanastos_procesados: TLongintField;
    zqExpLancescant_trampas: TLargeintField;
    zqExpLancescentolla_comercial: TLongintField;
    zqExpLancescentolla_total: TLongintField;
    zqExpLancesfecha_hora_fin_virada: TDateTimeField;
    zqExpLancesfecha_hora_ini_calado: TDateTimeField;
    zqExpLancesidenvio_email: TLongintField;
    zqExpLanceslat_fin_virada: TFloatField;
    zqExpLanceslat_ini_calado: TFloatField;
    zqExpLanceslong_fin_virada: TFloatField;
    zqExpLanceslong_ini_calado: TFloatField;
    zqExpLancesorden_virada: TLargeintField;
    zqExpLancesporcent_trampas_obs: TFloatField;
    zqExpLancesprofundidad_fin_calado: TLongintField;
    zqExpLancesprofundidad_ini_calado: TLongintField;
    zqExpLancestrampas_con_fallo: TLargeintField;
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
    zqLancesfecha_hora_calado: TDateTimeField;
    zqLancesfecha_hora_virado: TDateTimeField;
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
    zqLancesPendientesfecha_fin_virada: TDateField;
    zqLancesPendientesidlance: TLongintField;
    zqLancesprofundidad_fin_calado: TLongintField;
    zqLancesprofundidad_fin_virada: TLongintField;
    zqLancesprofundidad_ini_calado: TLongintField;
    zqLancesprofundidad_ini_virada: TLongintField;
    zqLancesprospeccion: TSmallintField;
    zqLancesrumbo_calado: TLongintField;
    zqLancesvirada: TLongintField;
    zqPrincipalfecha: TDateField;
    zqPrincipalfecha_fin_produccion: TDateField;
    zqPrincipalfecha_ini_produccion: TDateField;
    zqPrincipalidenvio_email: TLongintField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalnotas: TStringField;
    zqPrincipalnro_envio: TLongintField;
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
    zqProxEnvio: TZQuery;
    zqProxEnvioprox_envio: TLargeintField;
    zqDetalleEnvios: TZQuery;
    zqLancesPendientes: TZQuery;
    zuDetalleEnvios: TZUpdateSQL;
    procedure acAgregarLancesExecute(Sender: TObject);
    procedure acExportarLancesExecute(Sender: TObject);
    procedure dedCarpetaArchivoAcceptDirectory(Sender: TObject;
      var Value: String);
    procedure dedCarpetaArchivoChange(Sender: TObject);
    procedure dedCarpetaArchivoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject;
      var ValidacionOK: boolean);
    procedure zqDetalleEnviosBeforeOpen(DataSet: TDataSet);
    procedure zqDetalleEnviosNewRecord(DataSet: TDataSet);
    procedure zqExpLancesBeforeOpen(DataSet: TDataSet);
    procedure zqLancesBeforeOpen(DataSet: TDataSet);
    procedure zqLancesPendientesBeforeOpen(DataSet: TDataSet);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqProduccionBeforeOpen(DataSet: TDataSet);
    procedure zqProxEnvioBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
    procedure HabilitarAcciones;
    procedure AgregarLancesPendientes;
  public
    { public declarations }
  end;

var
  FmEditarEnviosEmail: TFmEditarEnviosEmail;
  max_fecha_lance: TDateTime=-1;
  fecha_ini_prod, fecha_fin_prod:TDateTime;

implementation

{$R *.lfm}

{ TFmEditarEnviosEmail }

procedure TFmEditarEnviosEmail.zqLancesBeforeOpen(DataSet: TDataSet);
begin
  zqLances.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TFmEditarEnviosEmail.zqLancesPendientesBeforeOpen(DataSet: TDataSet);
begin
  zqLancesPendientes.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TFmEditarEnviosEmail.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalidenvio_email.Value:=zcePrincipal.NuevoID('envios_email');
  zqPrincipalnro_envio.Value:=zqProxEnvioprox_envio.Value;
  zqPrincipalfecha.Value:=Date;
  AgregarLancesPendientes;
  if zqPrincipalfecha_ini_produccion.IsNull then
     zqPrincipalfecha_ini_produccion.Value:=fecha_ini_prod;
  if zqPrincipalfecha_fin_produccion.IsNull then
     zqPrincipalfecha_fin_produccion.Value:=fecha_fin_prod;
end;

procedure TFmEditarEnviosEmail.zqProduccionBeforeOpen(DataSet: TDataSet);
begin
  zqProduccion.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  zqProduccion.ParamByName('fecha_ini').AsDate:=zqPrincipalfecha_ini_produccion.AsDateTime;
  zqProduccion.ParamByName('fecha_fin').AsDate:=zqPrincipalfecha_fin_produccion.AsDateTime;
end;

procedure TFmEditarEnviosEmail.zqProxEnvioBeforeOpen(DataSet: TDataSet);
begin
  zqProxEnvio.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TFmEditarEnviosEmail.HabilitarAcciones;
begin
  acExportarLances.Enabled:=(dedCarpetaArchivo.Directory<>'');
  acAgregarLances.Enabled:=zcePrincipal.Accion=ED_MODIFICAR;
end;

procedure TFmEditarEnviosEmail.AgregarLancesPendientes;
begin
  fecha_ini_prod:=MaxDateTime;
  fecha_fin_prod:=MinDateTime;
  zqDetalleEnvios.DisableControls;
  zqLancesPendientes.DisableControls;
  zqLancesPendientes.Close;
  zqLancesPendientes.Open;
  zqLancesPendientes.First;
  while not zqLancesPendientes.EOF do
  begin
    zqDetalleEnvios.Append;
    zqDetalleEnviosidlance.Value:=zqLancesPendientesidlance.Value;
    if zqLancesPendientesfecha_fin_virada.AsDateTime>fecha_fin_prod then
       fecha_fin_prod:=zqLancesPendientesfecha_fin_virada.AsDateTime;
    if zqLancesPendientesfecha_fin_virada.AsDateTime<fecha_ini_prod then
       fecha_ini_prod:=zqLancesPendientesfecha_fin_virada.AsDateTime;
    zqLancesPendientes.Next;
  end;
  zqLancesPendientes.EnableControls;
  zqDetalleEnvios.EnableControls;
end;

procedure TFmEditarEnviosEmail.zqExpLancesBeforeOpen(DataSet: TDataSet);
begin
  zqExpLances.ParamByName('idenvio_email').Value:=zqPrincipalidenvio_email.Value;
end;

procedure TFmEditarEnviosEmail.acExportarLancesExecute(Sender: TObject);
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
        if zqPrincipal.State in [dsInsert,dsEdit] then
           zqPrincipal.Post;
        zdgPrincipal.ApplyUpdates;
        s:=TStringList.Create;
        //Creo el encabezado
        s.Add(Trim('Marea: '+dmGeneral.zqMareaActivaMarea.AsString));
        s.Add(Trim('Observador: '+dmGeneral.zqMareaActivaobservador.AsString));
        s.Add(Trim('Informe Nº '+zqPrincipalnro_envio.AsString+' del '+zqPrincipalfecha.AsString));
        s.Add('');
        s.Add('Registro;Inicio calado;Fin virado;Prof. ini; Prof. fin;Lat. calado;Long. calado;Lat. virado;Long. virado;Nro. trampas;Fallos;Captura total;Captura comercial;Porcent.Tpas.Obs.;Jaulas prod.');
        with zqExpLances do
        begin
          max_fecha_lance:=-1;
          DisableControls;
          Close;
          Open;
          First;
          if RecordCount>0 then
          begin
            while not EOF do
            begin
              if zqExpLancesfecha_hora_fin_virada.AsDateTime>max_fecha_lance then
                 max_fecha_lance:=zqExpLancesfecha_hora_fin_virada.AsDateTime;
              //Concateno el valor de todos los campos (menos el último, que lo proceso aparte para que no
              //quede con un ";" final
              //Empiezo en el campo [1] porque el [0] es idenvio
              tmp:='';
              for i:=1 to Fields.Count-2 do
              begin
                tmp:=tmp+Fields[i].AsString+';';
              end;
              tmp:=tmp+Fields[i+1].AsString;
              s.Add(Trim(tmp));
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
        //if max_fecha_lance=-1 then
        //  archivo:=dedCarpetaArchivo.Directory+DirectorySeparator+FormatDateTime('YYYYmmdd',Date)+'.txt'
        //else
        //  archivo:=dedCarpetaArchivo.Directory+DirectorySeparator+FormatDateTime('YYYYmmdd',max_fecha_lance)+'.txt';
        archivo:=dedCarpetaArchivo.Directory+DirectorySeparator+'MAREA '+dmGeneral.zqMareaActivamarea_buque.AsString+' OBS '+dmGeneral.zqMareaActivaanio_marea.AsString+'-'+dmGeneral.zqMareaActivanro_marea_inidep.AsString+'-LANCES_'+RightStr('0'+zqPrincipalnro_envio.AsString,2)+'.txt';

        if (not FileExistsUTF8(archivo)) or (MessageDlg('El archivo '+archivo+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
        begin
          s.SaveToFile(archivo);
          if MessageDlg('El informe de lances se ha generado correctamente y se ha guardado en '+archivo+'. ¿Desea visualizar el contenido del archivo?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
          begin
            OpenDocument(archivo);
            //{$IFDEF MSWINDOWS}
            //  ShellExecute(Handle, 'open', PChar(archivo), nil, nil, SW_SHOWNORMAL)
            //{$ENDIF}
            //{$IFDEF UNIX}
            //  Shell(format('gv %s',[ExpandFileNameUTF8(archivo)]));
            //{$ENDIF}
          end;
        end;
      finally
        DecimalSeparator:=OLD_DC;
        s.Free;
    end;
  end;
end;

procedure TFmEditarEnviosEmail.dedCarpetaArchivoAcceptDirectory(
  Sender: TObject; var Value: String);
begin
  LSSaveConfig(['destino_archivo_lances'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TFmEditarEnviosEmail.dedCarpetaArchivoChange(Sender: TObject);
begin
  LSSaveConfig(['destino_archivo_lances'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TFmEditarEnviosEmail.dedCarpetaArchivoExit(Sender: TObject);
begin
  LSSaveConfig(['destino_archivo_lances'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TFmEditarEnviosEmail.acAgregarLancesExecute(Sender: TObject);
begin
  AgregarLancesPendientes;
end;

procedure TFmEditarEnviosEmail.FormShow(Sender: TObject);
var
  destino:String;
begin
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

procedure TFmEditarEnviosEmail.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
  //Antes de guardar, elimino los lances no seleccionados
  with zqDetalleEnvios do
  begin
    DisableControls;
    First;
    while not EOF do
    begin
      if FieldByName('seleccionado').AsBoolean=False then
      begin
        Delete;
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

procedure TFmEditarEnviosEmail.zqDetalleEnviosBeforeOpen(DataSet: TDataSet);
begin
  zqDetalleEnvios.ParamByName('idenvio_email').Value:=zqPrincipalidenvio_email.Value;
end;

procedure TFmEditarEnviosEmail.zqDetalleEnviosNewRecord(DataSet: TDataSet);
begin
  zqDetalleEnviosiddetalle_envio_email.Value:=zcePrincipal.NuevoID('detalle_envios_email');
  zqDetalleEnviosidenvio_email.Value:=zqPrincipalidenvio_email.Value;
  zqDetalleEnviosseleccionado.AsBoolean:=True;
  zqDetalleEnviosenviado.AsBoolean:=False;
end;

end.

