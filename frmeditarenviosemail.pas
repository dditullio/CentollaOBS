unit frmEditarEnviosEmail;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF MSWINDOWS}
  Windows,windirs,
  {$ENDIF}
  Classes, SysUtils, FileUtil, DividerBevel, DateTimePicker, DBDateTimePicker,
  AbZipper, rxdbgrid, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DbCtrls, Buttons, ActnList, DBGrids, EditBtn, frmzedicionbase, ZDataset,
  ZSqlUpdate, SQLQueryGroup, zcontroladoredicion, zdatasetgroup, db, datGeneral,
  LSConfig, LCLIntf, ComCtrls, comobj, variants;

type

  { TFmEditarEnviosEmail }

  TFmEditarEnviosEmail = class(TZEdicionBase)
    azEnvio: TAbZipper;
    acExportarLances: TAction;
    acExportarLances1: TAction;
    acAgregarLances: TAction;
    ActionList1: TActionList;
    bbAgregar: TBitBtn;
    bbGuardar: TBitBtn;
    ckComprimir: TCheckBox;
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
    laProceso: TLabel;
    LongintField1: TLongintField;
    paProceso: TPanel;
    pbProceso: TProgressBar;
    rgFormato: TRadioGroup;
    zqDetalleEnviosenviado: TLargeintField;
    zqDetalleEnviosiddetalle_envio_email: TLongintField;
    zqDetalleEnviosidenvio_email: TLongintField;
    zqDetalleEnviosidlance: TLongintField;
    zqDetalleEnviosidmarea: TLongintField;
    zqDetalleEnviosseleccionado: TLargeintField;
    zqExpLances: TZQuery;
    zqExpLancesarania_total: TLongintField;
    zqExpLancescanastos_procesados: TLongintField;
    zqExpLancescant_trampas: TLargeintField;
    zqExpLancescaptura_por_trampa: TFloatField;
    zqExpLancescaptura_por_trampa_3_aros: TFloatField;
    zqExpLancescaptura_por_trampa_sin_aros: TFloatField;
    zqExpLancescarnada: TStringField;
    zqExpLancescentolla_comercial: TLongintField;
    zqExpLancescentolla_total: TLongintField;
    zqExpLancescluster_por_canasto: TLargeintField;
    zqExpLancescomentarios: TMemoField;
    zqExpLancescomerciales_por_trampa: TFloatField;
    zqExpLancesdias_pesca: TFloatField;
    zqExpLancesdistancia_entre_trampas: TLongintField;
    zqExpLancesfecha_envio: TDateField;
    zqExpLancesfecha_fin_produccion: TDateField;
    zqExpLancesfecha_fin_virada: TDateField;
    zqExpLancesfecha_hora_fin_calado: TDateTimeField;
    zqExpLancesfecha_hora_fin_virada: TDateTimeField;
    zqExpLancesfecha_hora_ini_calado: TDateTimeField;
    zqExpLancesfecha_hora_ini_virada: TDateTimeField;
    zqExpLancesfecha_ini_calado: TDateField;
    zqExpLancesfecha_ini_produccion: TDateField;
    zqExpLanceshoras_pesca: TLongintField;
    zqExpLanceshora_fin_virada: TTimeField;
    zqExpLanceshora_ini_calado: TTimeField;
    zqExpLancesidenvio_email: TLongintField;
    zqExpLancesidlance: TLongintField;
    zqExpLancesidmarea: TLongintField;
    zqExpLancesinvestigacion: TStringField;
    zqExpLanceskg_carnada: TFloatField;
    zqExpLanceslat_fin_calado: TFloatField;
    zqExpLanceslat_fin_virada: TFloatField;
    zqExpLanceslat_ini_calado: TFloatField;
    zqExpLanceslat_ini_virada: TFloatField;
    zqExpLanceslat_prom_calado_dec: TFloatField;
    zqExpLanceslong_fin_calado: TFloatField;
    zqExpLanceslong_fin_virada: TFloatField;
    zqExpLanceslong_ini_calado: TFloatField;
    zqExpLanceslong_ini_virada: TFloatField;
    zqExpLanceslong_prom_calado_dec: TFloatField;
    zqExpLancesmuestra: TStringField;
    zqExpLancesnro_boya: TLongintField;
    zqExpLancesnro_lance: TLongintField;
    zqExpLancesorden_virada: TLargeintField;
    zqExpLancesotras_trampas: TLongintField;
    zqExpLancesporcent_trampas_obs: TFloatField;
    zqExpLancesprofundidad_fin_calado: TLongintField;
    zqExpLancesprofundidad_ini_calado: TLongintField;
    zqExpLancesprof_fin_virada: TLongintField;
    zqExpLancesprof_ini_virada: TLongintField;
    zqExpLancesrumbo: TLongintField;
    zqExpLancestrampas_con_3_aros: TFloatField;
    zqExpLancestrampas_con_fallo: TLargeintField;
    zqExpLancestrampas_sin_aro: TFloatField;
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
    procedure ExportarTXT;
    procedure ExportarExcel(xls:olevariant);
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
    procedure zqExpLancesCalcFields(DataSet: TDataSet);
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
  acExportarLances.Enabled:=((dedCarpetaArchivo.Directory<>'') and (DirectoryExistsUTF8(dedCarpetaArchivo.Directory)));
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

procedure TFmEditarEnviosEmail.zqExpLancesCalcFields(DataSet: TDataSet);
begin
    zqExpLancesotras_trampas.AsInteger:=zqExpLancescant_trampas.AsInteger-zqExpLancestrampas_sin_aro.AsInteger-zqExpLancestrampas_con_3_aros.AsInteger;
end;

procedure TFmEditarEnviosEmail.acExportarLancesExecute(Sender: TObject);
var
  xls: olevariant;
  archivo_origen, archivo_destino, tmp: WideString;
  archivo, archivo_zip:string;
  i:integer;
  OLD_DS:char;
begin
  if rgFormato.ItemIndex=0 then
     ExportarTXT
  else
  begin
    //Primero verifico que el objeto se pueda crear
    try
      xls := CreateOleObject('Excel.Application');
    except
      MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
      Exit;
    end;
    //Pongo el resto dentro de un Try para si o si finalizar Excel al terminar
    if dedCarpetaArchivo.Directory <> '' then
    begin
        try
          OLD_DS:=DecimalSeparator;
          DecimalSeparator:=',';
          archivo_origen := ExtractFilePath(Application.ExeName) +
            'PlanillasExcel' + DirectorySeparator + 'InformeEmail.xls';
          //Armo el nombre del archivo destino con año y número de marea
          tmp:='Marea '+dmGeneral.zqMareaActivamarea_buque.AsString+' OBS '+dmGeneral.zqMareaActivaanio_marea.AsString+'-'+dmGeneral.zqMareaActivanro_marea_inidep.AsString;
          archivo_destino := dedCarpetaArchivo.Directory+DirectorySeparator+'MAREA '+dmGeneral.zqMareaActivamarea_buque.AsString+' OBS '+dmGeneral.zqMareaActivaanio_marea.AsString+'-'+dmGeneral.zqMareaActivanro_marea_inidep.AsString+'-LANCES_'+RightStr('0'+zqPrincipalnro_envio.AsString,2) + '.xls';
          if (not FileExistsUTF8(archivo_destino)) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
          begin
            CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
            archivo_destino:=UTF8Decode(archivo_destino);
            xls.Workbooks.Open(archivo_destino);

            //Se realiza la exportación del archivo
            ExportarExcel(xls);

            xls.ActiveWorkBook.Sheets('Lances').Activate;
            xls.ActiveWorkBook.Save;
            xls.Quit;
            xls := Unassigned;

            //Si se indicó, lo comprimo en ZIP
            if ckComprimir.Checked then
            begin
              archivo_zip:=StringReplace(archivo_destino, '.xls', '.zip', [rfReplaceAll, rfIgnoreCase]);
              //No lo borro, así si quiero puedo agregar el otro formato
              //if FileExistsUTF8(archivo_zip) then
              //   DeleteFileUTF8(archivo_zip);
              azEnvio.BaseDirectory:=dedCarpetaArchivo.Directory;
              azEnvio.FileName:=archivo_zip;

              //Agego los archivos de script
              azEnvio.AddFiles(archivo_destino,0);
              DeleteFileUTF8(archivo_destino);
              azEnvio.CloseArchive;
            end;

            if MessageDlg('El informe ha sido guardado en la carpeta indicada. ¿Desea abrir esta carpeta?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
            begin
              OpenDocument(dedCarpetaArchivo.Directory);
            end;
          end;
        finally
          DecimalSeparator:=OLD_DS;
          if xls <> Unassigned then
          begin
            xls.Quit;
            xls := Unassigned;
          end;
          //Close;
      end;
    end;
  end;
end;

procedure TFmEditarEnviosEmail.ExportarTXT;
var
  s:TStringList;
  tmp_str, tmp_fld, archivo, archivo_zip, str_enc:string;
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
        s.Add(Trim('Informe Nº '+zqPrincipalnro_envio.AsString+' del '+zqPrincipalfecha.AsString));
        s.Add(Trim('Marea: '+dmGeneral.zqMareaActivaMareaStr.AsString));
        s.Add(Trim('Observador: '+dmGeneral.zqMareaActivaobservador.AsString));
        s.Add('');

        with zqExpLances do
        begin
          //Para armar el encabezado, recorro todos los campos "Visibles" y concateno el "DisplayLabel"
          str_enc:='';
          for i:=0 to Fields.Count-1 do
          begin
            if Fields[i].Visible then
               str_enc:=str_enc+Fields[i].DisplayLabel+';';
          end;
          //Elimino el ";" final
          if RightStr(str_enc,1)=';' then
             tmp_str:=LeftStr(str_enc,Length(str_enc)-1);
          s.Add(str_enc);

          max_fecha_lance:=-1;
          DisableControls;
          Close;
          Open;
          First;
          if RecordCount>0 then
          begin
            laProceso.Caption:='Lances';
            pbProceso.Max:=RecordCount;
            pbProceso.Position:=RecNo;
            paProceso.Visible:=True;
            while not EOF do
            begin
              pbProceso.Position:=RecNo;
              Application.ProcessMessages;
              if zqExpLancesfecha_hora_fin_virada.AsDateTime>max_fecha_lance then
                 max_fecha_lance:=zqExpLancesfecha_hora_fin_virada.AsDateTime;
              //Concateno el valor de todos los campos
              //Sólo se incluyen los campos "Visibles"
              tmp_str:='';
              for i:=0 to Fields.Count-1 do
              begin
                if Fields[i].Visible then
                begin
                  if (not Fields[i].IsNull) and (Fields[i] is TFloatField) then
                     tmp_fld:=FormatFloat('##.####', Fields[i].Value)
                  else
                     tmp_fld:=Fields[i].AsString;
                  tmp_str:=tmp_str+tmp_fld+';';
                end;
              end;
              //Elimino el ";" final
              if RightStr(tmp_str,1)=';' then
                 tmp_str:=LeftStr(tmp_str,Length(tmp_str)-1);
              s.Add(Trim(tmp_str));
              Next;
            end;
            paProceso.Visible:=False;
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
             laProceso.Caption:='Producción';
             pbProceso.Max:=RecordCount;
             pbProceso.Position:=RecNo;
             paProceso.Visible:=True;
             //Armo la línea de encabezado
             s.Add('');
             s.Add('Producción:');
             tmp_str:='Fecha;';
             for i:=1 to 10 do
             begin
               if FieldByName('p'+IntToStr(i)).AsString<>'' then
               begin
                 tmp_str:=tmp_str+'Cajas '+FieldByName('p'+IntToStr(i)).AsString+';';
                 tmp_str:=tmp_str+'Kilos '+FieldByName('p'+IntToStr(i)).AsString+';';
               end;
             end;
             tmp_str:=tmp_str+'Total Cajas;Total Kilos';
             s.Add(tmp_str);
             while not EOF do
             begin
               pbProceso.Position:=RecNo;
               Application.ProcessMessages;
               tmp_str:=FieldByName('fecha').AsString+';';
               //Agrego los valores siempre que exista el producto
               for i:=1 to 10 do
               begin
                 if FieldByName('p'+IntToStr(i)).AsString<>'' then
                 begin
                   tmp_str:=tmp_str+FieldByName('cajas_p'+IntToStr(i)).AsString+';';
                   tmp_str:=tmp_str+FieldByName('kilos_p'+IntToStr(i)).AsString+';';
                 end;
               end;
               tmp_str:=tmp_str+FieldByName('tot_cajas').AsString+';';
               tmp_str:=tmp_str+FieldByName('tot_kilos').AsString;
               s.Add(Trim(tmp_str));
               Next;
             end;
             paProceso.Visible:=False;
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

          if ckComprimir.Checked then
          begin
            archivo_zip:=StringReplace(archivo, '.txt', '.zip', [rfReplaceAll, rfIgnoreCase]);
            //No lo borro, así si quiero puedo agregar el otro formato
            //if FileExistsUTF8(archivo_zip) then
            //   DeleteFileUTF8(archivo_zip);
            azEnvio.BaseDirectory:=dedCarpetaArchivo.Directory;
            azEnvio.FileName:=archivo_zip;

            //Agego los archivos de script
            azEnvio.AddFiles(archivo,0);
            DeleteFileUTF8(archivo);
            azEnvio.CloseArchive;
          end;

          if MessageDlg('El informe ha sido guardado en la carpeta indicada. ¿Desea abrir esta carpeta?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
          begin
              OpenDocument(dedCarpetaArchivo.Directory);
          end;

          //Como puede ser un zip, en lugar del documento abrí la carpeta
          //if MessageDlg('El informe de lances se ha generado correctamente y se ha guardado en '+archivo+'. ¿Desea visualizar el contenido del archivo?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
          //begin
          //  OpenDocument(archivo);
          //end;
        end;
      finally
        DecimalSeparator:=OLD_DC;
        s.Free;
    end;
  end;
end;

procedure TFmEditarEnviosEmail.ExportarExcel(xls:olevariant);
const
  XLCENTER=-4108;
  PWD='proyectocentolla';
var
  tmp, tmp_fld:WideString;
  archivo:string;
  i:integer;
  fila, columna: integer;

begin
  if dedCarpetaArchivo.Directory <> '' then
  begin
    if zqPrincipal.State in [dsInsert,dsEdit] then
       zqPrincipal.Post;
    zdgPrincipal.ApplyUpdates;

    xls.ActiveWorkBook.Sheets('Lances').Activate;

    with zqExpLances do
    begin
      //Para armar el encabezado, recorro todos los campos "Visibles" y utilizo el "DisplayLabel"
      fila:=5;
      columna :=1;
      for i:=0 to Fields.Count-1 do
      begin
        if Fields[i].Visible then
        begin
          tmp := UTF8Decode(Fields[i].DisplayLabel);
          xls.Cells[fila, columna] := tmp;
          xls.Cells[fila, columna].HorizontalAlignment:=XLCENTER;
          inc(columna);
        end;
      end;

      //Proceso datos de lances
      max_fecha_lance:=-1;
      DisableControls;
      Close;
      Open;
      First;
      if RecordCount>0 then
      begin
        laProceso.Caption:='Lances';
        pbProceso.Max:=RecordCount;
        pbProceso.Position:=RecNo;
        paProceso.Visible:=True;
        fila:=6;
        while not EOF do
        begin
          pbProceso.Position:=RecNo;
          Application.ProcessMessages;
          columna :=1;
          if zqExpLancesfecha_hora_fin_virada.AsDateTime>max_fecha_lance then
             max_fecha_lance:=zqExpLancesfecha_hora_fin_virada.AsDateTime;
          //Sólo se incluyen los campos "Visibles"
          for i:=0 to Fields.Count-1 do
          begin
            if Fields[i].Visible then
            begin
              //Verifico el tipo de campo para que queden bien en el excel
              //Si es numérico, redondeo a un máximo de 4 dígitos
              if Fields[i] is TNumericField then
                 xls.Cells[fila, columna] := Round(Fields[i].AsFloat*10000)/10000
              else if Fields[i] is TDateTimeField then
                 xls.Cells[fila, columna] := Fields[i].AsDateTime
              else
              begin
                 tmp := UTF8Decode(Fields[i].AsString);
                 xls.Cells[fila, columna] := tmp;
              end;
              xls.Cells[fila, columna].EntireColumn.AutoFit;
              inc(columna);
            end;
          end;
          Next;
          inc(fila);
        end;

        //Creo el encabezado. Lo hago al final para que no afecte el "Autofit" de las primeras columnas
        tmp := UTF8Decode(Trim('Informe Nº '+zqPrincipalnro_envio.AsString+' del '+zqPrincipalfecha.AsString));
        xls.Cells[1, 1] := tmp;
        tmp := UTF8Decode(Trim(dmGeneral.zqMareaActivaMareaStr.AsString));
        xls.Cells[2, 2] := tmp;
        tmp := UTF8Decode(Trim(dmGeneral.zqMareaActivaobservador.AsString));
        xls.Cells[3, 2] := tmp;

        //Protejo la hoja para que el usuario no modifique los datos
        xls.ActiveWorkBook.ActiveSheet.Protect(PWD);

        paProceso.Visible:=False;
      end else
      begin
        MessageDlg('No se encontró información de lances para exportar', mtInformation, [mbOK],0)
      end;
      First;
      EnableControls;
    end;

    //Agrego los datos de producción
    tmp := UTF8Decode('Producción'); //Lo hago así porque el acento da problemas
    xls.ActiveWorkBook.Sheets(tmp).Activate;
    with zqProduccion do
    begin
       Close;
       Open;
       First;
       fila:=1;
       columna:=1;
       if RecordCount>0 then
       begin
         laProceso.Caption:='Producción';
         pbProceso.Max:=RecordCount;
         pbProceso.Position:=RecNo;
         paProceso.Visible:=True;
         //Armo la línea de encabezado
         tmp := UTF8Decode('Fecha');
         xls.Cells[fila, columna] := tmp;
         xls.Cells[fila, columna].HorizontalAlignment:=XLCENTER;
         inc(columna);
         //Pongo el encabezado con las categorías
         for i:=1 to 10 do
         begin
           if FieldByName('p'+IntToStr(i)).AsString<>'' then
           begin
             tmp := UTF8Decode('Cajas '+FieldByName('p'+IntToStr(i)).AsString);
             xls.Cells[fila, columna] := tmp;
             xls.Cells[fila, columna].HorizontalAlignment:=XLCENTER;
             inc(columna);
             tmp := UTF8Decode('Kilos '+FieldByName('p'+IntToStr(i)).AsString);
             xls.Cells[fila, columna] := tmp;
             xls.Cells[fila, columna].HorizontalAlignment:=XLCENTER;
             inc(columna);
           end;
         end;
         tmp := UTF8Decode('Total Cajas');
         xls.Cells[fila, columna] := tmp;
         xls.Cells[fila, columna].HorizontalAlignment:=XLCENTER;
         inc(columna);
         tmp := UTF8Decode('Total Kilos');
         xls.Cells[fila, columna] := tmp;
         xls.Cells[fila, columna].HorizontalAlignment:=XLCENTER;

         //Proceso los datos
         fila:=2;
         while not EOF do
         begin
           pbProceso.Position:=RecNo;
           Application.ProcessMessages;
           columna:=1;
           tmp := UTF8Decode(FieldByName('fecha').AsString);
           xls.Cells[fila, columna] := tmp;
           inc(columna);

           //Agrego los valores siempre que exista el producto
           for i:=1 to 10 do
           begin
             if FieldByName('p'+IntToStr(i)).AsString<>'' then
             begin
               tmp := UTF8Decode(FieldByName('cajas_p'+IntToStr(i)).AsString);
               xls.Cells[fila, columna] := tmp;
               inc(columna);

               tmp := UTF8Decode(FieldByName('kilos_p'+IntToStr(i)).AsString);
               xls.Cells[fila, columna] := tmp;
               inc(columna);

             end;
           end;
           tmp := UTF8Decode(FieldByName('tot_cajas').AsString);
           xls.Cells[fila, columna] := tmp;
           inc(columna);

           tmp := UTF8Decode(FieldByName('tot_kilos').AsString);
           xls.Cells[fila, columna] := tmp;

           Next;
           inc(fila);
         end;

         //Protejo la hoja para que el usuario no modifique los datos
         xls.ActiveWorkBook.ActiveSheet.Protect(PWD);

         paProceso.Visible:=False;
       end else
       begin
         MessageDlg('No se encontró información de producción para exportar', mtInformation, [mbOK],0)
       end;
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
  if (destino='') or (not DirectoryExistsUTF8(destino)) then
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

