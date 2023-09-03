unit frmmareaaexcel;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF MSWINDOWS}
  Windows,windirs,
  {$ENDIF}
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, EditBtn, Buttons, ActnList, DBGrids, ExtCtrls, ComCtrls, datGeneral,
  ZDataset, ZSqlUpdate, ZStoredProcedure, db, memds, LSConfig, comobj, variants,
  LCLIntf;

type

  { TfmMareaAExcel }

  TfmMareaAExcel = class(TForm)
    acGenerarPlanilla: TAction;
    ActionList1: TActionList;
    bbGuardar: TBitBtn;
    dedCarpetaPlanilla: TDirectoryEdit;
    GroupBox1: TGroupBox;
    imAcomp: TImage;
    imCapturas: TImage;
    Label10: TLabel;
    laInfoProceso: TLabel;
    Label9: TLabel;
    paDatosPuente: TPanel;
    imProduccion: TImage;
    imFactor: TImage;
    imMarcado: TImage;
    paAcomp: TPanel;
    paMuestras: TPanel;
    paSubmuestras: TPanel;
    paProduccion: TPanel;
    paFactor: TPanel;
    paMarcado: TPanel;
    imPuente: TImage;
    imMuestras: TImage;
    imSubmuestras: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    paCapturas: TPanel;
    pbCapturas: TProgressBar;
    pbAcomp: TProgressBar;
    pbPuente: TProgressBar;
    pbMuestras: TProgressBar;
    pbSubmuestras: TProgressBar;
    pbProduccion: TProgressBar;
    pbFactor: TProgressBar;
    pbMarcado: TProgressBar;
    zqAcompTotal: TZQuery;
    zqDatosPuenteTotales: TZQuery;
    zqEspecies: TZQuery;
    zqFCTotales: TZQuery;
    zqMuestras: TZQuery;
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
    zqDatosPuente: TZQuery;
    zqCapturas: TZQuery;
    zqAcomp: TZQuery;
    zqMuestrasTotales: TZQuery;
    zqProduccionTotales: TZQuery;
    zqRelacMorf: TZQuery;
    zqFC: TZQuery;
    zqMarcas: TZQuery;
    zqSubmuestras: TZQuery;
    zqProduccion: TZQuery;
    procedure acGenerarPlanillaExecute(Sender: TObject);
    procedure dedCarpetaPlanillaAcceptDirectory(Sender: TObject;
      var Value: String);
    procedure dedCarpetaPlanillaChange(Sender: TObject);
    procedure dedCarpetaPlanillaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqAcompBeforeOpen(DataSet: TDataSet);
    procedure zqAcompTotalBeforeOpen(DataSet: TDataSet);
    procedure zqCapturasBeforeOpen(DataSet: TDataSet);
    procedure zqDatosPuenteBeforeOpen(DataSet: TDataSet);
    procedure zqDatosPuenteTotalesBeforeOpen(DataSet: TDataSet);
    procedure zqEspeciesBeforeOpen(DataSet: TDataSet);
    procedure zqFCBeforeOpen(DataSet: TDataSet);
    procedure zqFCTotalesBeforeOpen(DataSet: TDataSet);
    procedure zqMarcasBeforeOpen(DataSet: TDataSet);
    procedure zqMuestrasBeforeOpen(DataSet: TDataSet);
    procedure zqMuestrasTotalesBeforeOpen(DataSet: TDataSet);
    procedure zqProduccionBeforeOpen(DataSet: TDataSet);
    procedure zqProduccionTotalesBeforeOpen(DataSet: TDataSet);
    procedure zqRelacMorfBeforeOpen(DataSet: TDataSet);
    procedure zqSubmuestrasBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
    Procedure HabilitarAcciones;
    procedure GenerarDatosPuenteOLD(xls:olevariant; Password: WideString);
    function GenerarPlanillaMarea(Password: WideString): boolean;
    function GenerarPlanillaTotales(Password: WideString):boolean;

    //Planilla de la marea
    procedure GenerarDatosPuente(xls:olevariant; Password: WideString);
    procedure GenerarCapturas(xls:olevariant; Password: WideString);
    procedure GenerarAcomp(xls:olevariant; Password: WideString);
    procedure GenerarMuestras(xls:olevariant; Password: WideString);
    procedure GenerarSubmuestras(xls:olevariant; Password: WideString);
    procedure GenerarProduccion(xls:olevariant; Password: WideString);
    procedure GenerarFC(xls:olevariant; Password: WideString);
    procedure GenerarMarcas(xls:olevariant; Password: WideString);

    //Planilla para agrupar mareas
    procedure GenerarTotalesDatosPuente(xls:olevariant; Password: WideString);
    procedure GenerarTotalesCapturas(xls:olevariant; Password: WideString);
    procedure GenerarTotalesAcomp(xls:olevariant; Password: WideString);
    procedure GenerarTotalesMuestras(xls:olevariant; Password: WideString);
    procedure GenerarTotalesSubmuestras(xls:olevariant; Password: WideString);
    procedure GenerarTotalesProduccion(xls:olevariant; Password: WideString);
    procedure GenerarTotalesFC(xls:olevariant; Password: WideString);

    procedure ColocarDatosMarea(xls:olevariant; fila, columna: Integer);
  public
    { public declarations }
  end;

var
  fmMareaAExcel: TfmMareaAExcel;
  max_fecha_lance: TDateTime=-1;

implementation

{$R *.lfm}

{ TfmMareaAExcel }

procedure TfmMareaAExcel.FormShow(Sender: TObject);
var
  destino:String;
begin
  //Pongo esto al mostrar cada formulario, por si Windows lo cambió externamente
  DefaultFormatSettings.DecimalSeparator:='.';
  DefaultFormatSettings.ThousandSeparator:=',';

  pbPuente.Position:=0;
  imPuente.Visible:=False;
  pbCapturas.Position:=0;
  imCapturas.Visible:=False;
  pbAcomp.Position:=0;
  imAcomp.Visible:=False;
  pbMuestras.Position:=0;
  imMuestras.Visible:=False;
  pbSubmuestras.Position:=0;
  imSubmuestras.Visible:=False;
  pbProduccion.Position:=0;
  imProduccion.Visible:=False;
  pbFactor.Position:=0;
  imFactor.Visible:=False;
  pbMarcado.Position:=0;
  imMarcado.Visible:=False;
  LSLoadConfig(['destino_planilla_informe'],[destino],[@destino]);
  {$IFDEF MSWINDOWS}
  if (destino='') or (not DirectoryExistsUTF8(destino)) then
     destino:=GetWindowsSpecialDir(CSIDL_PERSONAL);
  {$ENDIF}
  dedCarpetaPlanilla.Directory := destino;
  zqDatosPuente.Close;
  zqDatosPuente.Open;
  HabilitarAcciones;
end;

procedure TfmMareaAExcel.zqAcompBeforeOpen(DataSet: TDataSet);
begin
  zqAcomp.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqAcompTotalBeforeOpen(DataSet: TDataSet);
begin
  zqAcompTotal.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqCapturasBeforeOpen(DataSet: TDataSet);
begin
  zqCapturas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqDatosPuenteBeforeOpen(DataSet: TDataSet);
begin
  zqDatosPuente.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqDatosPuenteTotalesBeforeOpen(DataSet: TDataSet);
begin
  zqDatosPuenteTotales.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqEspeciesBeforeOpen(DataSet: TDataSet);
begin
  zqEspecies.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqFCBeforeOpen(DataSet: TDataSet);
begin
  zqFC.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqFCTotalesBeforeOpen(DataSet: TDataSet);
begin
  zqFCTotales.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqMarcasBeforeOpen(DataSet: TDataSet);
begin
  zqMarcas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqMuestrasBeforeOpen(DataSet: TDataSet);
begin
  zqMuestras.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqMuestrasTotalesBeforeOpen(DataSet: TDataSet);
begin
  zqMuestrasTotales.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqProduccionBeforeOpen(DataSet: TDataSet);
begin
  zqProduccion.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqProduccionTotalesBeforeOpen(DataSet: TDataSet);
begin
  zqProduccionTotales.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.zqRelacMorfBeforeOpen(DataSet: TDataSet);
begin
  zqRelacMorf.ParamByName('idlance').Value:=zqFC.FieldByName('idlance').Value;
end;

procedure TfmMareaAExcel.zqSubmuestrasBeforeOpen(DataSet: TDataSet);
begin
  zqSubmuestras.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMareaAExcel.dedCarpetaPlanillaChange(Sender: TObject);
begin
  LSSaveConfig(['destino_planilla_informe'],[dedCarpetaPlanilla.Directory]);
  HabilitarAcciones;
end;

procedure TfmMareaAExcel.dedCarpetaPlanillaExit(Sender: TObject);
begin
  LSSaveConfig(['destino_planilla_informe'],[dedCarpetaPlanilla.Directory]);
  HabilitarAcciones;
end;

procedure TfmMareaAExcel.dedCarpetaPlanillaAcceptDirectory(Sender: TObject;
  var Value: String);
begin
  LSSaveConfig(['destino_planilla_informe'],[dedCarpetaPlanilla.Directory]);
  HabilitarAcciones;
end;

procedure TfmMareaAExcel.acGenerarPlanillaExecute(Sender: TObject);
const
  PWD='proyectocentolla';
var
  PlanillasOK: boolean=false;
begin
  //PlanillasOK:=GenerarPlanillaMarea(PWD);
  //PlanillasOK:=((MessageDlg('¿Desea generar la planilla de totales?', mtConfirmation, [mbYes, mbNo],0) = mrYes)
  //and GenerarPlanillaTotales(PWD)) or PlanillasOK;

  PlanillasOK:=GenerarPlanillaTotales(PWD);

  if PlanillasOK then
  begin
    laInfoProceso.Caption:='';
    if MessageDlg('Las planillas han sido guardadas en la carpeta indicada. ¿Desea abrir esta carpeta?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    begin
      OpenDocument(dedCarpetaPlanilla.Directory);
    end;
  end;
  Close;
end;

procedure TfmMareaAExcel.HabilitarAcciones;
begin
  acGenerarPlanilla.Enabled:=((dedCarpetaPlanilla.Directory<>'') and (DirectoryExistsUTF8(dedCarpetaPlanilla.Directory)));
end;

procedure TfmMareaAExcel.GenerarDatosPuenteOLD(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna: integer;
begin
  xls.ActiveWorkBook.Sheets('Datos de puente').Activate;
  with zqDatosPuente do
  begin
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbPuente.Max := RecordCount;
    Fila := 5;//Arranco en la fila 5 porque antes están los títulos
    while not EOF do
    begin
      xls.Cells[fila, 1] := FieldByName('nro_lance').AsInteger;
      xls.Cells[fila, 2] := FieldByName('nro_boya').AsInteger;
      tmp := UTF8Decode(FieldByName('investigacion').AsString);
      xls.Cells[fila, 3] := tmp;
      if not FieldByName('rumbo').IsNull then
        xls.Cells[fila, 4] := FieldByName('rumbo').AsInteger;
      if not FieldByName('cant_trampas').IsNull then
        xls.Cells[fila, 5] := FieldByName('cant_trampas').AsInteger;
      if not FieldByName('trampas_con_fallo').IsNull then
        xls.Cells[fila, 6] := FieldByName('trampas_con_fallo').AsInteger;
      xls.Cells[fila, 7] := FieldByName('distancia_entre_trampas').AsInteger;
      if not FieldByName('carnada').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('carnada').AsString);
        xls.Cells[fila, 8] := tmp;
      end;
      if not FieldByName('kg_carnada').IsNull then
        xls.Cells[fila, 9] := FieldByName('kg_carnada').AsFloat;
      xls.Cells[fila, 10] := FieldByName('fecha_hora_ini_calado').AsDateTime;
      xls.Cells[fila, 11] := FieldByName('fecha_hora_fin_virada').AsDateTime;
      xls.Cells[fila, 12] := FieldByName('lat_ini_virada').AsFloat;
      xls.Cells[fila, 13] := FieldByName('long_ini_virada').AsFloat;
      xls.Cells[fila, 14] := FieldByName('lat_fin_virada').AsFloat;
      xls.Cells[fila, 15] := FieldByName('long_fin_virada').AsFloat;
      xls.Cells[fila, 16] := FieldByName('prof_ini_virada').AsInteger;
      xls.Cells[fila, 17] := FieldByName('prof_fin_virada').AsInteger;
      if not FieldByName('dias_pesca').IsNull then
        xls.Cells[fila, 18] := FieldByName('dias_pesca').AsFloat;
      if not FieldByName('centolla_total').IsNull then
        xls.Cells[fila, 19] := FieldByName('centolla_total').AsInteger;
      if not FieldByName('centolla_comercial').IsNull then
        xls.Cells[fila, 20] := FieldByName('centolla_comercial').AsInteger;
      if not FieldByName('arania_total').IsNull then
        xls.Cells[fila, 21] := FieldByName('arania_total').AsInteger;
      if not FieldByName('canastos_procesados').IsNull then
        xls.Cells[fila, 22] := FieldByName('canastos_procesados').AsInteger;
      if (not FieldByName('cluster_por_canasto').IsNull) and (FieldByName('cluster_por_canasto').AsInteger>0) then
        xls.Cells[fila, 23] := FieldByName('cluster_por_canasto').AsInteger;
      if not FieldByName('trampas_con_aro').IsNull then
        xls.Cells[fila, 24] := FieldByName('trampas_con_aro').AsInteger;
      if not FieldByName('trampas_sin_puerta').IsNull then
        xls.Cells[fila, 25] := FieldByName('trampas_sin_puerta').AsInteger;
      if not FieldByName('muestra').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('muestra').AsString);
        xls.Cells[fila, 26] := tmp;
      end;
      tmp := UTF8Decode(FieldByName('comentarios').AsString);
      xls.Cells[fila, 27] := tmp;
      pbPuente.Position := RecNo;
      Application.ProcessMessages;
      Next;
      Inc(fila);
    end;
  end;
  Application.ProcessMessages;
  imPuente.Visible:=True;
end;

function TfmMareaAExcel.GenerarPlanillaMarea(Password: WideString): boolean;
var
  xls: olevariant;
  archivo_origen, archivo_destino, tmp: WideString;
  archivo:string;
  i:integer;
  OLD_DS:char;
  resultado:boolean=false;
begin
  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Result:=resultado;
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar Excel al terminar
  if dedCarpetaPlanilla.Directory <> '' then
  begin
      try
        pbPuente.Position:=0;
        imPuente.Visible:=False;
        pbCapturas.Position:=0;
        imCapturas.Visible:=False;
        pbAcomp.Position:=0;
        imAcomp.Visible:=False;
        pbMuestras.Position:=0;
        imMuestras.Visible:=False;
        pbSubmuestras.Position:=0;
        imSubmuestras.Visible:=False;
        pbProduccion.Position:=0;
        imProduccion.Visible:=False;
        pbFactor.Position:=0;
        imFactor.Visible:=False;
        pbMarcado.Position:=0;
        imMarcado.Visible:=False;
        OLD_DS:=DecimalSeparator;
        DecimalSeparator:=',';
        archivo_origen := ExtractFilePath(Application.ExeName) +
          'PlanillasExcel' + DirectorySeparator + 'centolla.xls';
        //Armo el nombre del archivo destino con año y número de marea
        tmp:='Marea '+dmGeneral.zqMareaActivamarea_buque.AsString+' OBS '+dmGeneral.zqMareaActivaanio_marea.AsString+'-'+dmGeneral.zqMareaActivanro_marea_inidep.AsString;
        archivo_destino := dedCarpetaPlanilla.Directory +
          DirectorySeparator + tmp + '.xls';
        if (not FileExistsUTF8(archivo_destino)) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
        begin
          CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
          archivo_destino:=UTF8Decode(archivo_destino);
          xls.Workbooks.Open(archivo_destino);
          GenerarDatosPuente(xls, Password);
          GenerarCapturas(xls, Password);
//          GenerarAcomp(xls, Password);
          GenerarMuestras(xls, Password);
          GenerarSubmuestras(xls, Password);
          GenerarProduccion(xls, Password);
          GenerarFC(xls, Password);
          //Por ahora la funcionalidad de registrar marcas está desactivada
          //GenerarMarcas(xls, Password);
          xls.ActiveWorkBook.Sheets('Datos de puente').Activate;
          xls.ActiveWorkBook.Save;
          resultado:=true;
        end;
      finally
        DecimalSeparator:=OLD_DS;
        xls.Quit;
        xls := Unassigned;
        //Close;
    end;
  end;
  Result:=resultado;
end;

function TfmMareaAExcel.GenerarPlanillaTotales(Password: WideString): boolean;
var
  xls: olevariant;
  archivo_origen, archivo_destino, tmp: WideString;
  archivo:string;
  i:integer;
  OLD_DS:char;
  resultado: boolean=false;
begin
  //Primero verifico que el objeto se pueda crear
  try
    xls := CreateOleObject('Excel.Application');
  except
    MessageDlg('No se puede abrir la aplicación Microsoft Office Excel, o la misma no está instalada', mtError, [mbClose], 0);
    Result:=resultado;
    Exit;
  end;
  //Pongo el resto dentro de un Try para si o si finalizar Excel al terminar
  if dedCarpetaPlanilla.Directory <> '' then
  begin
      try
        pbPuente.Position:=0;
        imPuente.Visible:=False;
        pbCapturas.Position:=0;
        imCapturas.Visible:=False;
        pbAcomp.Position:=0;
        imAcomp.Visible:=False;
        pbMuestras.Position:=0;
        imMuestras.Visible:=False;
        pbSubmuestras.Position:=0;
        imSubmuestras.Visible:=False;
        pbProduccion.Position:=0;
        imProduccion.Visible:=False;
        pbFactor.Position:=0;
        imFactor.Visible:=False;
        pbMarcado.Position:=0;
        imMarcado.Visible:=False;
        OLD_DS:=DecimalSeparator;
        DecimalSeparator:=',';
        archivo_origen := ExtractFilePath(Application.ExeName) +
          'PlanillasExcel' + DirectorySeparator + 'totales.xls';
        //Armo el nombre del archivo destino con año y número de marea
        tmp:='Totales '+dmGeneral.zqMareaActivamarea_buque.AsString+' OBS '+dmGeneral.zqMareaActivaanio_marea.AsString+'-'+dmGeneral.zqMareaActivanro_marea_inidep.AsString;
        archivo_destino := dedCarpetaPlanilla.Directory +
          DirectorySeparator + tmp + '.xls';
        if (not FileExistsUTF8(archivo_destino)) or (MessageDlg('El archivo '+archivo_destino+' ya existe. ¿Desea reemplazarlo?', mtConfirmation, [mbYes, mbNo],0) = mrYes) then
        begin
          CopyFile(archivo_origen, archivo_destino, [cffOverwriteFile]);
          archivo_destino:=UTF8Decode(archivo_destino);
          xls.Workbooks.Open(archivo_destino);

          GenerarTotalesDatosPuente(xls, Password);
          GenerarTotalesCapturas(xls, Password);
          GenerarTotalesAcomp(xls, Password);
          GenerarTotalesMuestras(xls, Password);
          GenerarTotalesSubmuestras(xls, Password);
          GenerarTotalesProduccion(xls, Password);
          GenerarTotalesFC(xls, Password);

          xls.ActiveWorkBook.Sheets('Datos de puente').Activate;
          xls.ActiveWorkBook.Save;
          resultado:=true;
        end;
      finally
        DecimalSeparator:=OLD_DS;
        xls.Quit;
        xls := Unassigned;
        //Close;
    end;
  end;
  Result:=resultado;
end;

procedure TfmMareaAExcel.GenerarDatosPuente(xls: olevariant; Password: WideString);
const
  COLOR_RESALTADO=17; //Color celeste, para la propiadad Interior.ColorIndex de las celdas
  SIN_COLOR=-4142;    //Sin color, para la propiadad Interior.ColorIndex de las celdas
  COL_COMENTARIOS=44;
  PRIM_COL_ESPECIES=45;
var
  tmp: WideString;
  fila, columna, i: integer;
  filtro: string;
begin
  xls.ActiveWorkBook.Sheets('Datos de puente').Activate;
  with zqDatosPuente do
  begin
    //Abro las tablas de especies
    zqAcomp.Close;
    zqAcomp.Open;
    zqEspecies.Close;
    zqEspecies.Open;
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbPuente.Max := RecordCount;
    // Coloco los rótulos de las especies
    Fila:= 4;
    Columna:=PRIM_COL_ESPECIES;
    zqEspecies.First;
    while not zqEspecies.EOF do
    begin
      tmp := UTF8Decode(zqEspecies.FieldByName('nombre_vulgar').AsString);
      xls.Cells[fila, columna] := tmp;
      zqEspecies.Next;
      inc(Columna);
    end;
    Fila := 5;//Arranco en la fila 5 porque antes están los títulos
    while not EOF do
    begin
      //Si es línea de investigación, resalto la línea con un color
      if FieldByName('investigacion').AsString = 'S' then
      begin
        for i := 1 to PRIM_COL_ESPECIES-1 do
            xls.Cells[fila, i].Interior.ColorIndex:=COLOR_RESALTADO;
      end;

      columna:=1;
      xls.Cells[fila, columna] := FieldByName('orden_virada').AsInteger;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('nro_boya').AsInteger;
      inc(columna);
      tmp := UTF8Decode(FieldByName('investigacion').AsString);
      xls.Cells[fila, columna] := tmp;
      inc(columna);
      if not FieldByName('rumbo').IsNull then
        xls.Cells[fila, columna] := FieldByName('rumbo').AsInteger;
      inc(columna);
      if not FieldByName('cant_trampas').IsNull then
        xls.Cells[fila, columna] := FieldByName('cant_trampas').AsInteger;
      inc(columna);
      if not FieldByName('trampas_sin_aro').IsNull then
        xls.Cells[fila, columna] := FieldByName('trampas_sin_aro').AsInteger;
      inc(columna);
      if not FieldByName('trampas_con_3_aros').IsNull then
        xls.Cells[fila, columna] := FieldByName('trampas_con_3_aros').AsInteger;
      inc(columna);
      //Calculo la cantidad de trampas de otro tipo
      xls.Cells[fila, columna] := FieldByName('cant_trampas').AsInteger-
                        FieldByName('trampas_sin_aro').AsInteger-
                        FieldByName('trampas_con_3_aros').AsInteger;
      inc(columna);
      if not FieldByName('trampas_con_fallo').IsNull then
        xls.Cells[fila, columna] := FieldByName('trampas_con_fallo').AsInteger;
      inc(columna);
      if not FieldByName('cant_trampas').IsNull then
        xls.Cells[fila, columna] := FieldByName('cant_trampas').AsInteger-FieldByName('trampas_con_fallo').AsInteger;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('distancia_entre_trampas').AsInteger;
      inc(columna);
      if not FieldByName('carnada').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('carnada').AsString);
        xls.Cells[fila, columna] := tmp;
      end;
      inc(columna);
      if not FieldByName('kg_carnada').IsNull then
        xls.Cells[fila, columna] := FieldByName('kg_carnada').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('fecha_hora_ini_calado').AsDateTime;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('fecha_hora_fin_calado').AsDateTime;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('lat_ini_calado').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('long_ini_calado').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('lat_fin_calado').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('long_fin_calado').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('lat_prom_calado_dec').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('long_prom_calado_dec').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('prof_ini_calado').AsInteger;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('prof_fin_calado').AsInteger;
      inc(columna);

      xls.Cells[fila, columna] := FieldByName('fecha_hora_ini_virada').AsDateTime;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('fecha_hora_fin_virada').AsDateTime;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('lat_ini_virada').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('long_ini_virada').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('lat_fin_virada').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('long_fin_virada').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('prof_ini_virada').AsInteger;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('prof_fin_virada').AsInteger;
      inc(columna);
      if not FieldByName('dias_pesca').IsNull then
        xls.Cells[fila, columna] := FieldByName('dias_pesca').AsFloat;
      inc(columna);
      if not FieldByName('porcent_trampas_obs').IsNull then
        xls.Cells[fila, columna] := FieldByName('porcent_trampas_obs').AsFloat;
      inc(columna);
      if not FieldByName('centolla_total').IsNull then
        xls.Cells[fila, columna] := FieldByName('centolla_total').AsInteger;
      inc(columna);
      if not FieldByName('centolla_comercial').IsNull then
        xls.Cells[fila, columna] := FieldByName('centolla_comercial').AsInteger;
      inc(columna);

      if not FieldByName('captura_por_trampa').IsNull then
        xls.Cells[fila, columna] := FieldByName('captura_por_trampa').AsFloat;
      inc(columna);
      if not FieldByName('captura_por_trampa_sin_aros').IsNull then
        xls.Cells[fila, columna] := FieldByName('captura_por_trampa_sin_aros').AsFloat;
      inc(columna);
      if not FieldByName('captura_por_trampa_3_aros').IsNull then
        xls.Cells[fila, columna] := FieldByName('captura_por_trampa_3_aros').AsFloat;
      inc(columna);

      if not FieldByName('comerciales_por_trampa').IsNull then
        xls.Cells[fila, columna] := FieldByName('comerciales_por_trampa').AsFloat;
      inc(columna);

      if not FieldByName('arania_total').IsNull then
        xls.Cells[fila, columna] := FieldByName('arania_total').AsInteger;
      inc(columna);
      if not FieldByName('canastos_procesados').IsNull then
        xls.Cells[fila, columna] := FieldByName('canastos_procesados').AsInteger;
      inc(columna);
      if (not FieldByName('cluster_por_canasto').IsNull) and (FieldByName('cluster_por_canasto').AsInteger>0) then
        xls.Cells[fila, columna] := FieldByName('cluster_por_canasto').AsInteger;
      inc(columna);
      if not FieldByName('muestra').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('muestra').AsString);
        xls.Cells[fila, columna] := tmp;
      end;
      inc(columna);
      tmp := UTF8Decode(FieldByName('comentarios').AsString);
      xls.Cells[fila, columna] := tmp;
      inc(columna);

      // Recorro las especies. Filtro por lance y agrego si es necesario.
      Columna:=PRIM_COL_ESPECIES;
      zqEspecies.First;
      while not zqEspecies.EOF do
      begin
        //Filtro las especies acompañantes por lance y especie
        zqAcomp.Filtered:=False;
        filtro:='idespecie='+zqEspecies.FieldByName('idespecie').AsString+' and nro_lance='+FieldByName('nro_lance').AsString;
        zqAcomp.Filter:=filtro;
        zqAcomp.Filtered:=True;
        if zqAcomp.RecordCount>0 then
           xls.Cells[fila, columna] := zqAcomp.FieldByName('cantidad').AsInteger;
        zqEspecies.Next;
        inc(Columna);
      end;
      pbPuente.Position := RecNo;
      Application.ProcessMessages;
      Next;
      Inc(fila);
    end;
  end;

  //Agrego comentarios finales
  if dmGeneral.zqMareaActivacomentarios.AsString<>'' then
  begin
     Inc(fila);
     tmp := UTF8Decode('Comentarios finales:');
     xls.Cells[fila, COL_COMENTARIOS] := tmp;
     Inc(fila);
     tmp := UTF8Decode(dmGeneral.zqMareaActivacomentarios.AsString);
     xls.Cells[fila, COL_COMENTARIOS] := tmp;
  end;

  imPuente.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarCapturas(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna, tmp_count: integer;
begin
  xls.ActiveWorkBook.Sheets('Capturas').Activate;
  with zqCapturas do
  begin
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbCapturas.Max := RecordCount;
    Fila := 6;//Arranco en la fila 6 porque antes están los títulos
    //Tomo del primer registro los nombres de las especies
    tmp := UTF8Decode(FieldByName('nomb_cient_especie1').AsString);
    xls.Cells[4, 6] := tmp;
    tmp := UTF8Decode(FieldByName('nomb_cient_especie2').AsString);
    xls.Cells[4, 8] := tmp;
    tmp := UTF8Decode(FieldByName('nomb_cient_especie3').AsString);
    xls.Cells[4, 10] := tmp;
    tmp_count:=0;
    while not EOF do
    begin
      xls.Cells[fila, 2] := FieldByName('orden_virada').AsInteger;
      xls.Cells[fila, 3] := FieldByName('cant_trampas').AsInteger;
      if not FieldByName('dsc_tipo_trampa').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('dsc_tipo_trampa').AsString);
        xls.Cells[fila, 4] := tmp;
      end;
      //if not FieldByName('estado_puerta').IsNull then
      //  xls.Cells[fila, 5] := FieldByName('estado_puerta').AsInteger;
      if not FieldByName('estado_trampa').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('estado_trampa').AsString);
        xls.Cells[fila, 5] := tmp;
      end;
      if not FieldByName('total_especie1').IsNull then
        xls.Cells[fila, 6] := FieldByName('total_especie1').AsInteger;
      if not FieldByName('comerciales_especie1').IsNull then
        xls.Cells[fila, 7] := FieldByName('comerciales_especie1').AsInteger;
      if not FieldByName('total_especie2').IsNull then
        xls.Cells[fila, 8] := FieldByName('total_especie2').AsInteger;
      if not FieldByName('comerciales_especie2').IsNull then
        xls.Cells[fila, 9] := FieldByName('comerciales_especie2').AsInteger;
      if not FieldByName('total_especie3').IsNull then
        xls.Cells[fila, 10] := FieldByName('total_especie3').AsInteger;
      if not FieldByName('comerciales_especie3').IsNull then
        xls.Cells[fila, 11] := FieldByName('comerciales_especie3').AsInteger;
      inc(tmp_count);
      if (tmp_count=50) then
      begin
        pbCapturas.Position := RecNo;
        Application.ProcessMessages;
        tmp_count:=0;
      end;
      Next;
      Inc(fila);
    end;
  end;
  pbCapturas.Position:=pbCapturas.Max;
  imCapturas.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarAcomp(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna: integer;
begin
  tmp := UTF8Decode('Especies acompañantes'); //Lo hago así porque la 'ñ' da problemas
  xls.ActiveWorkBook.Sheets(tmp).Activate;
  with zqAcomp do
  begin
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbAcomp.Max := RecordCount;
    Fila := 5;//Arranco en la fila 5 porque antes están los títulos
    while not EOF do
    begin
      xls.Cells[fila, 2] := FieldByName('nro_lance').AsInteger;
      tmp := UTF8Decode(FieldByName('especie').AsString);
      xls.Cells[fila, 3] := tmp;
      if not FieldByName('cantidad').IsNull then
        xls.Cells[fila, 4] := FieldByName('cantidad').AsInteger;
      if not FieldByName('peso').IsNull then
        xls.Cells[fila, 5] := FieldByName('peso').AsFloat;
      pbAcomp.Position := RecNo;
      Application.ProcessMessages;
      Next;
      Inc(fila);
    end;
  end;
  imAcomp.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarMuestras(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna, tmp_count: integer;

begin
  xls.ActiveWorkBook.Sheets('Muestras').Activate;
  with zqMuestras do
  begin
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbMuestras.Max := RecordCount;
    Fila := 5;//Arranco en la fila 5 porque antes están los títulos
    tmp_count:=0;
    while not EOF do
    begin

      xls.Cells[fila, 2] := FieldByName('orden_virada').AsInteger;
      if not FieldByName('dsc_tipo_trampa').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('dsc_tipo_trampa').AsString);
        xls.Cells[fila, 3] := tmp;
      end;
      xls.Cells[fila, 4] := FieldByName('nro_ejemplar').AsInteger;
      xls.Cells[fila, 5] := FieldByName('largo').AsInteger;
      xls.Cells[fila, 6] := FieldByName('sexo').AsInteger;
      xls.Cells[fila, 7] := FieldByName('estado_caparazon').AsInteger;
      if not FieldByName('codigo_huevos').IsNull then
        xls.Cells[fila, 8] := FieldByName('codigo_huevos').AsInteger;
      if not FieldByName('porcentaje_huevos').IsNull then
        xls.Cells[fila, 9] := FieldByName('porcentaje_huevos').AsFloat;

      inc(tmp_count);
      if (tmp_count=50) then
      begin
        pbMuestras.Position := RecNo;
        Application.ProcessMessages;
        tmp_count:=0;
      end;
      Next;
      Inc(fila);
    end;
  end;
  pbMuestras.Position := pbMuestras.Max;
  imMuestras.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarSubmuestras(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna, sexo, registros, nro_ejemp_talla, talla_ant: integer;
begin
  xls.ActiveWorkBook.Sheets('Largo-peso').Activate;
  //Primero traigo todos los registros para poder contarlos
  zqSubmuestras.Close;
  zqSubmuestras.ParamByName('sexo').AsInteger:=0;
  zqSubmuestras.Open;
  //Configuro la barra de progreso
  pbSubmuestras.Max := zqSubmuestras.RecordCount;
  registros:=0;
  for sexo:=1 to 2 do
  begin
    with zqSubmuestras do
    begin
      Close;
      ParamByName('sexo').AsInteger:=sexo;
      Open;
      First;
      Fila := 9;//Arranco en la fila 9 porque antes están los títulos
      //Comienzo en 1 en cada rango de tallas (<90, 90-109, >=110)
      talla_ant:=0;
      if sexo=1 then
         columna:=2
      else
          columna:=7;
      while not EOF do
      begin
        if (talla_ant=0) or ((talla_ant<90) and (FieldByName('largo').AsInteger>=90))
           or ((talla_ant<110) and (FieldByName('largo').AsInteger>=110))then
        begin
          nro_ejemp_talla:=0;
        end;
        talla_ant:=FieldByName('largo').AsInteger;
        inc(nro_ejemp_talla);
        inc(registros);
        xls.Cells[fila, columna] := nro_ejemp_talla;
        xls.Cells[fila, columna+1] := FieldByName('largo').AsInteger;
        if not FieldByName('peso').IsNull then
          xls.Cells[fila, columna+2] := FieldByName('peso').AsInteger;
        xls.Cells[fila, columna+3] := FieldByName('estado_caparazon').AsInteger;
        if sexo=2 then
        begin
          if not FieldByName('codigo_huevos').IsNull then
            xls.Cells[fila, columna+4] := FieldByName('codigo_huevos').AsInteger;
          if not FieldByName('porcentaje_huevos').IsNull then
            xls.Cells[fila, columna+5] := FieldByName('porcentaje_huevos').AsFloat;
        end;
        pbSubmuestras.Position := registros;
        Application.ProcessMessages;
        Next;
        Inc(fila);
      end;
    end;
  end;
  imSubmuestras.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarProduccion(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna, prod: integer;
begin
  tmp := UTF8Decode('Producción'); //Lo hago así porque el acento da problemas
  xls.ActiveWorkBook.Sheets(tmp).Activate;
  //Recorro la tabla poniendo todas las columnas en las que el producto no sea nulo
  with zqProduccion do
  begin
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbProduccion.Max := RecordCount;
    Fila := 7;//Arranco en la fila 7 porque antes están los títulos
    if not dmGeneral.zqMareaActivapeso_caja_producto.IsNull then
      xls.Cells[4, 3] := dmGeneral.zqMareaActivapeso_caja_producto.AsFloat;
    while not EOF do
    begin
      columna:=2;
      xls.Cells[fila, 1] := FieldByName('fecha').AsDateTime;
      for prod:=1 to 7 do
      begin
        if not FieldByName('p'+IntToStr(prod)).IsNull then
        begin
          tmp := UTF8Decode(FieldByName('p'+IntToStr(prod)).AsString);
          xls.Cells[5, columna] := tmp;
          if not FieldByName('cajas_p'+IntToStr(prod)).IsNull then
            xls.Cells[fila, columna] := FieldByName('cajas_p'+IntToStr(prod)).AsInteger;
          if not FieldByName('kilos_p'+IntToStr(prod)).IsNull then
            xls.Cells[fila, columna+1] := FieldByName('kilos_p'+IntToStr(prod)).AsFloat;
        end;
        columna:=columna+2;
      end;
      pbProduccion.Position := RecNo;
      Application.ProcessMessages;
      Next;
      Inc(fila);
    end;
  end;
  imProduccion.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarFC(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  filaFC, filaRM, columna: integer;
begin
  tmp := UTF8Decode('Factor de conversión'); //Lo hago así porque el acento da problemas
  xls.ActiveWorkBook.Sheets(tmp).Activate;
  with zqFC do
  begin
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbFactor.Max := RecordCount;
    FilaFC := 31;
    while not EOF do
    begin
      //Cargo primero los datos de FC, luego busco las relac. morf. del lance y las cargo
      xls.Cells[filaFC, 3] := FieldByName('peso_entero').AsFloat;
      xls.Cells[filaFC+3, 3] := FieldByName('pc_crudo').AsFloat;
      xls.Cells[filaFC+4, 3] := FieldByName('pc_cocido').AsFloat;
      xls.Cells[filaFC+5, 3] := FieldByName('pc_congelado').AsFloat;
      xls.Cells[filaFC+6, 3] := FieldByName('pc_descongelado').AsFloat;

      xls.Cells[filaFC+3, 5] := FieldByName('pg_crudo').AsFloat;
      xls.Cells[filaFC+4, 5] := FieldByName('pg_cocido').AsFloat;
      xls.Cells[filaFC+5, 5] := FieldByName('pg_congelado').AsFloat;
      xls.Cells[filaFC+6, 5] := FieldByName('pg_descongelado').AsFloat;

      //Cargo relaciones morfométricas
      with zqRelacMorf do begin
        Close;
        Open;
        First;
        FilaRM:=filaFC-23;
        //Pongo el encabezado
        if not FieldByName('orden_virada').IsNull then
           xls.Cells[filaRM-4, 4] := FieldByName('orden_virada').AsInteger
        else
           xls.Cells[filaRM-4, 4] := zqFC.FieldByName('orden_virada').AsInteger;
        //La fecha la tomo del los FC si no se indicó en RM
        if not FieldByName('fecha').IsNull then
           xls.Cells[filaRM-4, 6] := FieldByName('fecha').AsDateTime
        else
           xls.Cells[filaRM-4, 6] := zqFC.FieldByName('fecha').AsDateTime;
        tmp := UTF8Decode(FieldByName('especie').AsString);
        xls.Cells[filaRM-4, 8]:=tmp;
        while (not EOF) and (RecNo<=10) do
        begin
          xls.Cells[filaRM, 3] := FieldByName('largo').AsInteger;
          xls.Cells[filaRM, 4] := FieldByName('peso').AsFloat/1000; //Lo convierto a Kilos

          xls.Cells[filaRM, 7] := FieldByName('pata_1_d_mero').AsInteger;
          xls.Cells[filaRM, 8] := FieldByName('pata_2_d_mero').AsInteger;
          xls.Cells[filaRM, 9] := FieldByName('pata_3_d_mero').AsInteger;
          xls.Cells[filaRM, 10] := FieldByName('pata_1_i_mero').AsInteger;
          xls.Cells[filaRM, 11] := FieldByName('pata_2_i_mero').AsInteger;
          xls.Cells[filaRM, 12] := FieldByName('pata_3_i_mero').AsInteger;

          xls.Cells[filaRM+1, 7] := FieldByName('pata_1_d_entera').AsInteger;
          xls.Cells[filaRM+1, 8] := FieldByName('pata_2_d_entera').AsInteger;
          xls.Cells[filaRM+1, 9] := FieldByName('pata_3_d_entera').AsInteger;
          xls.Cells[filaRM+1, 10] := FieldByName('pata_1_i_entera').AsInteger;
          xls.Cells[filaRM+1, 11] := FieldByName('pata_2_i_entera').AsInteger;
          xls.Cells[filaRM+1, 12] := FieldByName('pata_3_i_entera').AsInteger;

          Next;
          filaRM:=filaRM+2;
        end;
      end;

      pbFactor.Position := RecNo;
      Application.ProcessMessages;
      Next;
      FilaFC := FilaFC+39;
    end;
  end;
  imFactor.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarMarcas(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna: integer;
begin
  xls.ActiveWorkBook.Sheets('Marcado y recaptura').Activate;
  with zqMarcas do
  begin
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbMarcado.Max := RecordCount;
    Fila := 4;//Arranco en la fila 4 porque antes están los títulos
    while not EOF do
    begin
      xls.Cells[fila, 2] := FieldByName('fecha_hora').AsDateTime;
      tmp := UTF8Decode(FieldByName('evento').AsString);
      xls.Cells[fila, 3] := tmp;
      xls.Cells[fila, 4] := FieldByName('latitud').AsFloat;
      xls.Cells[fila, 5] := FieldByName('longitud').AsFloat;
      xls.Cells[fila, 6] := FieldByName('profundidad').AsInteger;
      tmp := UTF8Decode(FieldByName('nombre_cientifico').AsString);
      xls.Cells[fila, 7] := tmp;
      tmp := UTF8Decode(FieldByName('cod_marca').AsString);
      xls.Cells[fila, 8] := tmp;
      if not FieldByName('cod_marca_original').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('cod_marca_original').AsString);
        xls.Cells[fila, 9] := tmp;
      end;
      if not FieldByName('largo').IsNull then
        xls.Cells[fila, 10] := FieldByName('largo').AsInteger;
      if not FieldByName('peso').IsNull then
        xls.Cells[fila, 11] := FieldByName('peso').AsFloat;
      if not FieldByName('sexo').IsNull then
        xls.Cells[fila, 12] := FieldByName('sexo').AsInteger;
      if not FieldByName('codigo_caparazon').IsNull then
        xls.Cells[fila, 13] := FieldByName('codigo_caparazon').AsInteger;
      if not FieldByName('codigo_huevos').IsNull then
        xls.Cells[fila, 14] := FieldByName('codigo_huevos').AsInteger;
      if not FieldByName('porcentaje_huevos').IsNull then
        xls.Cells[fila, 15] := FieldByName('porcentaje_huevos').AsFloat;
      if not FieldByName('vivo').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('vivo').AsString);
        xls.Cells[fila, 16] := tmp;
      end;
      if not FieldByName('remarcado').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('remarcado').AsString);
        xls.Cells[fila, 17] := tmp;
      end;
      if not FieldByName('liberado').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('liberado').AsString);
        xls.Cells[fila, 18] := tmp;
      end;
      if not FieldByName('comentarios').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('comentarios').AsString);
        xls.Cells[fila, 19] := tmp;
      end;
      pbMarcado.Position := RecNo;
      Application.ProcessMessages;
      Next;
      Inc(fila);
    end;
  end;
  imMarcado.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

// Planilla para agrupar
procedure TfmMareaAExcel.GenerarTotalesDatosPuente(xls: olevariant; Password: WideString);
const
  COLOR_RESALTADO=17; //Color celeste, para la propiadad Interior.ColorIndex de las celdas
  SIN_COLOR=-4142;    //Sin color, para la propiadad Interior.ColorIndex de las celdas
  PRIM_COL_ESPECIES=62;
var
  tmp: WideString;
  fila, columna, i: integer;
  filtro: string;
  formula:string;
  prof_prom: integer;
begin
  xls.ActiveWorkBook.Sheets('Datos de puente').Activate;
  with zqDatosPuenteTotales do
  begin
    laInfoProceso.Caption:='Recuperando información. Espere por favor...';
    Application.ProcessMessages;
    Close;
    Open;
    First;
    laInfoProceso.Caption:='';
    //Configuro la barra de progreso
    pbPuente.Max := RecordCount;

    Fila := 2;//Arranco en la fila 5 porque antes están los títulos
    while not EOF do
    begin
      //Si es línea de investigación, resalto la línea con un color
      if FieldByName('investigacion').AsString = 'S' then
      begin
        for i := 1 to PRIM_COL_ESPECIES-1 do
            xls.Cells[fila, i].Interior.ColorIndex:=COLOR_RESALTADO;
      end;

      //En cada fila van los datos de la marea
      ColocarDatosMarea(xls, fila,1);

      columna:=5;
      xls.Cells[fila, columna] := FieldByName('orden_virada').AsInteger;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('nro_boya').AsInteger;
      inc(columna);
      if FieldByName('investigacion').AsString='S' then
         xls.Cells[fila, columna] := 1
      else
         xls.Cells[fila, columna] := 0;
      inc(columna);
      if not FieldByName('rumbo').IsNull then
        xls.Cells[fila, columna] := FieldByName('rumbo').AsInteger;
      inc(columna);
      if not FieldByName('cant_trampas').IsNull then
        xls.Cells[fila, columna] := FieldByName('cant_trampas').AsInteger;
      inc(columna);
      if not FieldByName('trampas_sin_aro').IsNull then
        xls.Cells[fila, columna] := FieldByName('trampas_sin_aro').AsInteger;
      inc(columna);
      if not FieldByName('trampas_aros_130').IsNull then
        xls.Cells[fila, columna] := FieldByName('trampas_aros_130').AsInteger;
      inc(columna);
      if not FieldByName('trampas_aros_120').IsNull then
        xls.Cells[fila, columna] := FieldByName('trampas_aros_120').AsInteger;
      inc(columna);
      //Calculo la cantidad de trampas de otro tipo
      //xls.Cells[fila, columna] := FieldByName('cant_trampas').AsInteger-
      //                  FieldByName('trampas_sin_aro').AsInteger-
      //                  FieldByName('trampas_coorden_viradan_3_aros').AsInteger;
      //inc(columna);
      if not FieldByName('trampas_perdidas').IsNull then
        xls.Cells[fila, columna] := FieldByName('trampas_perdidas').AsInteger;
      inc(columna);
      if not FieldByName('trampas_con_fallo').IsNull then
        xls.Cells[fila, columna] := FieldByName('trampas_con_fallo').AsInteger;
      inc(columna);
      if not FieldByName('cant_trampas').IsNull then
        xls.Cells[fila, columna] := FieldByName('cant_trampas').AsInteger
                        -FieldByName('trampas_con_fallo').AsInteger
                        -FieldByName('trampas_perdidas').AsInteger;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('distancia_entre_trampas').AsInteger;
      inc(columna);
      if not FieldByName('carnada').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('carnada').AsString);
        xls.Cells[fila, columna] := tmp;
      end;
      inc(columna);
      if not FieldByName('kg_carnada').IsNull then
        xls.Cells[fila, columna] := FieldByName('kg_carnada').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('fecha_hora_ini_calado').AsDateTime;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('fecha_hora_fin_calado').AsDateTime;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('lat_ini_calado').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('long_ini_calado').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('lat_fin_calado').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('long_fin_calado').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('lat_prom_calado_dec').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('long_prom_calado_dec').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('prof_ini_calado').AsInteger;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('prof_fin_calado').AsInteger;
      inc(columna);

      xls.Cells[fila, columna] := FieldByName('fecha_hora_ini_virada').AsDateTime;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('fecha_hora_fin_virada').AsDateTime;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('lat_ini_virada').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('long_ini_virada').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('lat_fin_virada').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('long_fin_virada').AsFloat;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('prof_ini_virada').AsInteger;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('prof_fin_virada').AsInteger;
      inc(columna);
      if not FieldByName('dias_pesca').IsNull then
        xls.Cells[fila, columna] := FieldByName('dias_pesca').AsFloat;
      inc(columna);
      if not FieldByName('porcent_trampas_obs').IsNull then
        xls.Cells[fila, columna] := FieldByName('porcent_trampas_obs').AsFloat;
      inc(columna);
      if not FieldByName('centolla_total').IsNull then
        xls.Cells[fila, columna] := FieldByName('centolla_total').AsInteger;
      inc(columna);
      if not FieldByName('centolla_comercial').IsNull then
        xls.Cells[fila, columna] := FieldByName('centolla_comercial').AsInteger;
      inc(columna);

      if not FieldByName('captura_por_trampa').IsNull then
        xls.Cells[fila, columna] := FieldByName('captura_por_trampa').AsFloat;
      inc(columna);
      if not FieldByName('captura_por_trampa_sin_aros').IsNull then
        xls.Cells[fila, columna] := FieldByName('captura_por_trampa_sin_aros').AsFloat;
      inc(columna);
      if not FieldByName('captura_por_trampa_aros_130').IsNull then
        xls.Cells[fila, columna] := FieldByName('captura_por_trampa_aros_130').AsFloat;
      inc(columna);
      if not FieldByName('captura_por_trampa_aros_120').IsNull then
        xls.Cells[fila, columna] := FieldByName('captura_por_trampa_aros_120').AsFloat;
      inc(columna);

      if not FieldByName('comerciales_por_trampa').IsNull then
        xls.Cells[fila, columna] := FieldByName('comerciales_por_trampa').AsFloat;
      inc(columna);
      if not FieldByName('comerciales_por_trampa_sin_aros').IsNull then
        xls.Cells[fila, columna] := FieldByName('comerciales_por_trampa_sin_aros').AsFloat;
      inc(columna);
      if not FieldByName('comerciales_por_trampa_aros_130').IsNull then
        xls.Cells[fila, columna] := FieldByName('comerciales_por_trampa_aros_130').AsFloat;
      inc(columna);
      if not FieldByName('comerciales_por_trampa_aros_120').IsNull then
        xls.Cells[fila, columna] := FieldByName('comerciales_por_trampa_aros_120').AsFloat;
      inc(columna);

      //if not FieldByName('arania_total').IsNull then
      //  xls.Cells[fila, columna] := FieldByName('arania_total').AsInteger;
      //inc(columna);
      if not FieldByName('canastos_procesados').IsNull then
        xls.Cells[fila, columna] := FieldByName('canastos_procesados').AsInteger;
      inc(columna);
      if (not FieldByName('cluster_por_canasto').IsNull) and (FieldByName('cluster_por_canasto').AsInteger>0) then
        xls.Cells[fila, columna] := FieldByName('cluster_por_canasto').AsInteger;
      inc(columna);
      if not FieldByName('muestra').IsNull then
      begin
        if FieldByName('muestra').AsString='S' then
           xls.Cells[fila, columna] := 1
        else
           xls.Cells[fila, columna] := 0;
      end;
      inc(columna);
      // Ver qué es el tipo de muestra
      inc(columna);
      // Ver qué es "nmuestr"
      inc(columna);
      tmp := UTF8Decode(FieldByName('comentarios').AsString);
      xls.Cells[fila, columna] := tmp;
      inc(columna);
      //El id es la marea mas el lance
      tmp := UTF8Decode(dmGeneral.zqMareaActivamarea_buque.AsString) + '-' + UTF8Decode(FieldByName('orden_virada').AsString);
      xls.Cells[fila, columna] := tmp;
      inc(columna);

      xls.Cells[fila, columna] := FieldByName('fecha_promedio').AsDateTime;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('quincena_anio').AsInteger;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('cod_zona').AsInteger;
      inc(columna);
      tmp := UTF8Decode(FieldByName('zona').AsString);
      xls.Cells[fila, columna] := tmp;
      inc(columna);
      //La fórmula queda en el Excel, así que salteo la columna
      inc(columna);

      if not FieldByName('prof_promedio').IsNull then
        xls.Cells[fila, columna] := FieldByName('prof_promedio').AsInteger;
      inc(columna);


      //Coloco la fórmula (Capt/  STD2)
      //=+SI(AQ5="";"";((1-EXP(-0,341*2))/(1-EXP(-0,341*AJ5)))*AQ5)
      //Lo siguiente da error. Se reemplaza el Format por StringReplace
      //tmp := UTF8Decode(Format('=SI(AQ%d="";"";((1-EXP(-0,341*2))/(1-EXP(-0,341*AJ%d)))*AQ%d)',[fila,fila,fila]));

      //También da error, se coloca la fórmula directamente en el Excel
      //formula:='=SI(AQ[fila]="";"";((1-EXP(-0,341*2))/(1-EXP(-0,341*AJ[fila])))*AQ[fila])';
      //formula:=StringReplace(formula, '[fila]', IntToStr(fila),[rfReplaceAll, rfIgnoreCase]);
      //tmp := UTF8Decode(formula);
      //xls.Cells[fila, 53] := tmp;


      pbPuente.Position := RecNo;
      Application.ProcessMessages;
      Next;
      Inc(fila);
    end;
  end;

  imPuente.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarTotalesCapturas(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna, tmp_count: integer;
begin
  xls.ActiveWorkBook.Sheets('Capturas').Activate;
  with zqCapturas do
  begin
    laInfoProceso.Caption:='Recuperando información. Espere por favor...';
    Application.ProcessMessages;
    Close;
    Open;
    First;
    laInfoProceso.Caption:='';
    //Configuro la barra de progreso
    pbCapturas.Max := RecordCount;
    Fila := 2;
    tmp_count:=0;
    while not EOF do
    begin
      //En cada fila van los datos de la marea
      ColocarDatosMarea(xls, fila,1);
      columna:=5;

      xls.Cells[fila, columna] := FieldByName('orden_virada').AsInteger;
      inc(columna);
      xls.Cells[fila, columna] := FieldByName('cant_trampas').AsInteger;
      inc(columna);
      if not FieldByName('dsc_tipo_trampa').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('dsc_tipo_trampa').AsString);
        xls.Cells[fila, columna] := tmp;
      end;
      inc(columna);
      if not FieldByName('estado_trampa').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('estado_trampa').AsString);
        xls.Cells[fila, columna] := tmp;
      end;
      inc(columna);
      if not FieldByName('total_centolla').IsNull then
        xls.Cells[fila, columna] := FieldByName('total_centolla').AsInteger;
      inc(columna);
      if not FieldByName('comercial_centolla').IsNull then
        xls.Cells[fila, columna] := FieldByName('comercial_centolla').AsInteger;
      inc(columna);
      //if not FieldByName('total_arania').IsNull then
      //  xls.Cells[fila, 11] := FieldByName('total_arania').AsInteger;

      if not FieldByName('linea_investigacion').IsNull then
        xls.Cells[fila, columna] := FieldByName('linea_investigacion').AsInteger;
      inc(columna);

      //El id es la marea mas el lance
      tmp := UTF8Decode(dmGeneral.zqMareaActivamarea_buque.AsString) + '-' + UTF8Decode(FieldByName('orden_virada').AsString);
      xls.Cells[fila, columna] := tmp;
      inc(columna);

      inc(tmp_count);

      if (tmp_count=50) then
      begin
        pbCapturas.Position := RecNo;
        Application.ProcessMessages;
        tmp_count:=0;
      end;
      Next;
      Inc(fila);
    end;
  end;
  pbCapturas.Position:=pbCapturas.Max;
  imCapturas.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarTotalesAcomp(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna: integer;
begin
  //  tmp := UTF8Decode('Especies acompañantes'); //Lo hago así porque la 'ñ' da problemas
  tmp := UTF8Decode('Fauna acompañante'); //Lo hago así porque la 'ñ' da problemas
  xls.ActiveWorkBook.Sheets(tmp).Activate;
  with zqAcompTotal do
  begin
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbAcomp.Max := RecordCount;

    Fila := 2;
    while not EOF do
    begin
      //En cada fila van los datos de la marea
      ColocarDatosMarea(xls, fila,1);

      tmp := UTF8Decode(FieldByName('especie').AsString);
      xls.Cells[fila, 5] := tmp;
      if not FieldByName('total').IsNull then
        xls.Cells[fila, 6] := FieldByName('total').AsInteger;
      pbAcomp.Position := RecNo;
      Application.ProcessMessages;
      Next;
      Inc(fila);
    end;
  end;
//  imAcomp.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarTotalesMuestras(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna, tmp_count: integer;

begin
  xls.ActiveWorkBook.Sheets('Muestras').Activate;
  with zqMuestrasTotales do
  begin
    laInfoProceso.Caption:='Recuperando información. Espere por favor...';
    Application.ProcessMessages;
    Close;
    Open;
    First;
    laInfoProceso.Caption:='';
    //Configuro la barra de progreso
    pbMuestras.Max := RecordCount;
    Fila := 2;
    tmp_count:=0;
    while not EOF do
    begin
      //En cada fila van los datos de la marea
      ColocarDatosMarea(xls, fila,1);
      columna := 5;
      xls.Cells[fila, columna] := FieldByName('orden_virada').AsInteger;
      Inc(columna);
      if not FieldByName('dsc_tipo_trampa').IsNull then
      begin
        tmp := UTF8Decode(FieldByName('dsc_tipo_trampa').AsString);
        xls.Cells[fila, columna] := tmp;
      end;
      Inc(columna);
      xls.Cells[fila, columna] := FieldByName('nro_ejemplar').AsInteger;
      Inc(columna);
      xls.Cells[fila, columna] := FieldByName('largo').AsInteger;
      Inc(columna);
      xls.Cells[fila, columna] := FieldByName('sexo').AsInteger;
      Inc(columna);
      xls.Cells[fila, columna] := FieldByName('estado_caparazon').AsInteger;
      Inc(columna);
      if not FieldByName('codigo_huevos').IsNull then
        xls.Cells[fila, columna] := FieldByName('codigo_huevos').AsInteger;
      Inc(columna);
      if not FieldByName('porcentaje_huevos').IsNull then
        xls.Cells[fila, columna] := FieldByName('porcentaje_huevos').AsFloat;
      Inc(columna);

      //El id es la marea mas el lance
      tmp := UTF8Decode(dmGeneral.zqMareaActivamarea_buque.AsString) + '-' + UTF8Decode(FieldByName('orden_virada').AsString);
      xls.Cells[fila, columna] := tmp;
      inc(columna);

      // Indica si es comercial
      if (FieldByName('largo').AsInteger >= 110) and (FieldByName('sexo').AsInteger = 1) then
        xls.Cells[fila, columna] := 1
      else
         xls.Cells[fila, columna] := 0;
      inc(columna);

      // Indica si es juvenil
      if (FieldByName('largo').AsInteger < 70) then
        xls.Cells[fila, columna] := 1
      else
         xls.Cells[fila, columna] := 0;
      inc(columna);

      if not FieldByName('cod_zona').IsNull then
         xls.Cells[fila, columna] := FieldByName('cod_zona').AsInteger;
      Inc(columna);
      //tmp := UTF8Decode(FieldByName('zona').AsString);
      //xls.Cells[fila, 14] := tmp;
      //Inc(columna);

      if not FieldByName('fecha_promedio').IsNull then
         xls.Cells[fila, columna] := FieldByName('fecha_promedio').AsDateTime;
      Inc(columna);

      if not FieldByName('prof_promedio').IsNull then
         xls.Cells[fila, columna] := FieldByName('prof_promedio').AsInteger;
      Inc(columna);

      inc(tmp_count);
      if (tmp_count=50) then
      begin
        pbMuestras.Position := RecNo;
        Application.ProcessMessages;
        tmp_count:=0;
      end;
      Next;
      Inc(fila);
    end;
  end;
  pbMuestras.Position := pbMuestras.Max;
  imMuestras.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarTotalesSubmuestras(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna, sexo, registros, nro_ejemp_talla, talla_ant: integer;
begin
  xls.ActiveWorkBook.Sheets('Largo-peso').Activate;
  with zqSubmuestras do
  begin
    Close;
    ParamByName('sexo').AsInteger:=0;
    Open;
    First;
    //Configuro la barra de progreso
    pbSubmuestras.Max := RecordCount;
    Fila := 2;
    while not EOF do
    begin
      //En cada fila van los datos de la marea
      ColocarDatosMarea(xls, fila,1);

      xls.Cells[fila, 5] := FieldByName('largo').AsInteger;
      if not FieldByName('peso').IsNull then
        xls.Cells[fila, 6] := FieldByName('peso').AsFloat;
      xls.Cells[fila, 7] := FieldByName('sexo').AsInteger;
      xls.Cells[fila, 8] := FieldByName('estado_caparazon').AsInteger;
      if not FieldByName('codigo_huevos').IsNull then
        xls.Cells[fila, 9] := FieldByName('codigo_huevos').AsInteger;
      if not FieldByName('porcentaje_huevos').IsNull then
        xls.Cells[fila, 10] := FieldByName('porcentaje_huevos').AsFloat;

      pbSubmuestras.Position := RecNo;
      Application.ProcessMessages;
      Next;
      Inc(fila);
    end;
  end;
  pbSubmuestras.Position := pbMuestras.Max;
  imSubmuestras.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarTotalesProduccion(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna, prod: integer;
begin
  tmp := UTF8Decode('Producción'); //Lo hago así porque el acento da problemas
  xls.ActiveWorkBook.Sheets(tmp).Activate;
  //Recorro la tabla poniendo todas las columnas en las que el producto no sea nulo
  with zqProduccionTotales do
  begin
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbProduccion.Max := RecordCount;
    Fila := 2;
    if not dmGeneral.zqMareaActivapeso_caja_producto.IsNull then
      xls.Cells[4, 3] := dmGeneral.zqMareaActivapeso_caja_producto.AsFloat;
    while not EOF do
    begin
      //En cada fila van los datos de la marea
      ColocarDatosMarea(xls, fila,1);

      if not FieldByName('fecha').IsNull then
        xls.Cells[fila, 5] := FieldByName('fecha').AsDateTime;
      tmp := UTF8Decode(FieldByName('codigo').AsString);
      xls.Cells[fila, 6] := tmp;
      if not FieldByName('cant_cajas').IsNull then
        xls.Cells[fila, 7] := FieldByName('cant_cajas').AsInteger;
      if not FieldByName('kilos').IsNull then
        xls.Cells[fila, 8] := FieldByName('kilos').AsFloat;

      pbProduccion.Position := RecNo;
      Application.ProcessMessages;
      Next;
      Inc(fila);
    end;
  end;
  imProduccion.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.GenerarTotalesFC(xls: olevariant; Password: WideString);
var
  tmp: WideString;
  fila, columna: integer;
begin
  tmp := UTF8Decode('Factor de conversión'); //Lo hago así porque el acento da problemas
  xls.ActiveWorkBook.Sheets(tmp).Activate;
  with zqFCTotales do
  begin
    Close;
    Open;
    First;
    //Configuro la barra de progreso
    pbFactor.Max := RecordCount;
    fila := 2;
    while not EOF do
    begin
      //En cada fila van los datos de la marea
      ColocarDatosMarea(xls, fila,1);

      if not FieldByName('fecha').IsNull then
        xls.Cells[fila, 5] := FieldByName('fecha').AsDateTime;
      xls.Cells[fila, 6] := FieldByName('peso_entero').AsFloat;
      xls.Cells[fila, 7] := FieldByName('pc_crudo').AsFloat;
      xls.Cells[fila, 8] := FieldByName('pc_cocido').AsFloat;
      xls.Cells[fila, 9] := FieldByName('pc_congelado').AsFloat;
      xls.Cells[fila, 10] := FieldByName('pc_descongelado').AsFloat;

      xls.Cells[fila, 11] := FieldByName('pg_crudo').AsFloat;
      xls.Cells[fila, 12] := FieldByName('pg_cocido').AsFloat;
      xls.Cells[fila, 13] := FieldByName('pg_congelado').AsFloat;
      xls.Cells[fila, 14] := FieldByName('pg_descongelado').AsFloat;

      xls.Cells[fila, 15] := FieldByName('peso_crudo').AsFloat;
      xls.Cells[fila, 16] := FieldByName('peso_cocido').AsFloat;
      xls.Cells[fila, 17] := FieldByName('peso_congelado').AsFloat;
      xls.Cells[fila, 18] := FieldByName('peso_descongelado').AsFloat;

      xls.Cells[fila, 19] := FieldByName('factor_captura').AsFloat;
      xls.Cells[fila, 20] := FieldByName('factor_final').AsFloat;
      if not FieldByName('comentarios').IsNull then
      begin
         tmp := UTF8Decode(FieldByName('comentarios').AsString);
         xls.Cells[fila, 21] := tmp;
      end;

      pbFactor.Position := RecNo;
      Application.ProcessMessages;
      Next;
      Inc(fila);
    end;
  end;
  imFactor.Visible:=True;
  Application.ProcessMessages;

  //Protejo la hoja para que el usuario no modifique los datos
  xls.ActiveWorkBook.ActiveSheet.Protect(Password);
end;

procedure TfmMareaAExcel.ColocarDatosMarea(xls: olevariant; fila,
  columna: Integer);
var
  tmp: WideString;
  col: integer;
begin
  col:= columna;

  tmp := UTF8Decode(dmGeneral.zqMareaActivabuque.AsString);
  xls.Cells[fila, col] := tmp;
  Inc(col);

  xls.Cells[fila, col] := dmGeneral.zqMareaActivacod_buque.AsInteger;
  Inc(col);

  tmp := UTF8Decode(dmGeneral.zqMareaActivamarea_buque.AsString);
  xls.Cells[fila, col] := tmp;
  Inc(col);

  tmp := UTF8Decode(dmGeneral.zqMareaActivaobservador.AsString);
  xls.Cells[fila, col] := tmp;
  Inc(col);
end;

end.

