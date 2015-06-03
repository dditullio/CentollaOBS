unit frmbackup;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, UTF8Process, AbZipper, AbBrowse, Forms, Controls,
  Graphics, Dialogs, StdCtrls, EditBtn, Buttons, ActnList, ComCtrls, LSConfig,
  datGeneral, db, ZSqlMetadata, ZDataset, ExSystemUtils, process, LCLIntf,
  ExtCtrls, AbArcTyp;

type

  { TfmBackup }

  TfmBackup = class(TForm)
    azBackup: TAbZipper;
    acBackup: TAction;
    alBackup: TActionList;
    bbGuardar: TBitBtn;
    cbCopiaTXT: TCheckBox;
    dedCarpetaArchivo: TDirectoryEdit;
    gbDestino: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    paProceso: TPanel;
    prBackup: TProcessUTF8;
    pbProceso: TProgressBar;
    zqGetCreate: TZQuery;
    zqTablasYVistas: TZQuery;
    zqCampos: TZQuery;
    zqTablasYVistasTables_in_centolla: TStringField;
    zqTablasYVistasTable_type: TStringField;
    zqDatosTabla: TZQuery;
    procedure acBackupExecute(Sender: TObject);
    procedure dedCarpetaArchivoAcceptDirectory(Sender: TObject;
      var Value: String);
    procedure dedCarpetaArchivoChange(Sender: TObject);
    procedure dedCarpetaArchivoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    Procedure HabilitarAcciones;
    procedure ExportarDB_SQL(archivo: string);
    procedure ExportarDB_TXT(carpeta: string);
    function SentenciaCreateTable(tabla:string):string;
    function SentenciaCreateView(vista:string):string;
    function SentenciaInsert(tabla:string):string;
    function FormatField(f: TField):string;
    function CrearEstructura(vista:string):string;
  public
    { public declarations }
  end;

const
    NEWLINE=#13#10;

    SET_VAR_ENCABEZADO='/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;'+NEWLINE+
                '/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;'+NEWLINE+
                '/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;'+NEWLINE+
                '/*!40101 SET NAMES utf8 */;'+NEWLINE+
                '/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;'+NEWLINE+
                '/*!40103 SET TIME_ZONE=''+00:00'' */;'+NEWLINE+
                '/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;'+NEWLINE+
                '/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;'+NEWLINE+
                '/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' */;'+NEWLINE+
                '/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;'+NEWLINE;

     SET_VAR_PIE='/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;'+NEWLINE+
                '/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;'+NEWLINE+
                '/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;'+NEWLINE+
                '/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;'+NEWLINE+
                '/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;'+NEWLINE+
                '/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;'+NEWLINE+
                '/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;'+NEWLINE+
                '/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;'+NEWLINE;

     CREATE_TABLE_TEMPLATE='--'+NEWLINE+
                '-- Estructura de la tabla `<TABLA>`'+NEWLINE+
                '--'+NEWLINE+
                ''+NEWLINE+
                'DROP TABLE IF EXISTS `<TABLA>`;'+NEWLINE+
                '/*!40101 SET @saved_cs_client     = @@character_set_client */;'+NEWLINE+
                '/*!40101 SET character_set_client = utf8 */;'+NEWLINE+
                '<SENTENCIA_CREATE_TABLE>;'+NEWLINE+
                '/*!40101 SET character_set_client = @saved_cs_client */;'+NEWLINE;

     INSERT_TEMPLATE='--'+NEWLINE+
                '-- Volcado de datos de la tabla `<TABLA>`'+NEWLINE+
                '--'+NEWLINE+
                ''+NEWLINE+
                'LOCK TABLES `<TABLA>` WRITE;'+NEWLINE+
                '/*!40000 ALTER TABLE `<TABLA>` DISABLE KEYS */;'+NEWLINE+
                'INSERT INTO `<TABLA>` (<CAMPOS>) VALUES <INSERT_VALUES>;'+NEWLINE+
                '/*!40000 ALTER TABLE `<TABLA>` ENABLE KEYS */;'+NEWLINE+
                'UNLOCK TABLES;'+NEWLINE;

     CREATE_VIEW_STRUCTURE_TEMPLATE='--'+NEWLINE+
                '-- Estructura temporaria para vista `<VISTA>`'+NEWLINE+
                '--'+NEWLINE+
                ''+NEWLINE+
                'DROP TABLE IF EXISTS `<VISTA>`;'+NEWLINE+
                '/*!50001 DROP VIEW IF EXISTS `<VISTA>`*/;'+NEWLINE+
                'SET @saved_cs_client     = @@character_set_client;'+NEWLINE+
                'SET character_set_client = utf8;'+NEWLINE+
                '/*!50001 CREATE VIEW `<VISTA>` AS SELECT <VIEW_FIELDS>*/;'+NEWLINE+
                'SET character_set_client = @saved_cs_client;'+NEWLINE;

     CREATE_VIEW_TEMPLATE='--'+NEWLINE+
                '-- Estructura final para la vista `<VISTA>`'+NEWLINE+
                '--'+NEWLINE+
                ''+NEWLINE+
                '/*!50001 DROP VIEW IF EXISTS `<VISTA>`*/;'+NEWLINE+
                '/*!50001 SET @saved_cs_client          = @@character_set_client */;'+NEWLINE+
                '/*!50001 SET @saved_cs_results         = @@character_set_results */;'+NEWLINE+
                '/*!50001 SET @saved_col_connection     = @@collation_connection */;'+NEWLINE+
                '/*!50001 SET character_set_client      = utf8 */;'+NEWLINE+
                '/*!50001 SET character_set_results     = utf8 */;'+NEWLINE+
                '/*!50001 SET collation_connection      = utf8_general_ci */;'+NEWLINE+
                '/*!50001 <SENTENCIA_CREATE_VIEW> */;'+NEWLINE+
                '/*!50001 SET character_set_client      = @saved_cs_client */;'+NEWLINE+
                '/*!50001 SET character_set_results     = @saved_cs_results */;'+NEWLINE+
                '/*!50001 SET collation_connection      = @saved_col_connection */;'+NEWLINE;



var
  fmBackup: TfmBackup;

implementation

{$R *.lfm}

{ TfmBackup }

procedure TfmBackup.dedCarpetaArchivoAcceptDirectory(Sender: TObject;
  var Value: String);
begin
  LSSaveConfig(['destino_backup'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TfmBackup.acBackupExecute(Sender: TObject);
const
  PREFIJO_BKP='BKP_DB_CENTOLLA_';
var
  temp_dir: string;
  str_fecha: string;
  archivo_backup, archivo_zip, archivo_txt, tabla: string;
begin

    temp_dir:=GetTempDir;
    if not DirectoryExistsUTF8(temp_dir+DirectorySeparator+'CentollaOBS') then
       CreateDirUTF8(temp_dir+DirectorySeparator+'CentollaOBS');
    temp_dir:=temp_dir+DirectorySeparator+'CentollaOBS';

    str_fecha:=FormatDateTime('yyyy-mm-dd-hhmm', Now);
    archivo_backup:=temp_dir+DirectorySeparator+PREFIJO_BKP+str_fecha+'.sql';

    paProceso.Visible:=True;
    ExportarDB_SQL(archivo_backup);

    if cbCopiaTXT.Checked then
    begin
      ExportarDB_TXT(temp_dir);
    end;
    paProceso.Visible:=False;

    //Comprimir en ZIP
    if FileExistsUTF8(archivo_backup) then
    begin
      archivo_zip:=dedCarpetaArchivo.Directory+DirectorySeparator+PREFIJO_BKP+str_fecha+'.zip';
      if FileExistsUTF8(archivo_zip) then
         DeleteFileUTF8(archivo_zip);
      azBackup.BaseDirectory:=dedCarpetaArchivo.Directory;
      azBackup.FileName:=archivo_zip;
      azBackup.AddFiles(archivo_backup,0);
      DeleteFileUTF8(archivo_backup);

      if cbCopiaTXT.Checked then
      begin
        //Agrego los TXT. Busco cada una de las tablas del sistema
        zqTablasYVistas.Close;
        zqTablasYVistas.ParamByName('tipo').Value:='BASE TABLE';
        zqTablasYVistas.Open;

        with zqTablasYVistas do
        begin
          First;
          while not EOF do
          begin
            tabla:=zqTablasYVistasTables_in_centolla.AsString;
            archivo_txt:=temp_dir+DirectorySeparator+tabla+'.txt';
            if FileExistsUTF8(archivo_txt) then
            begin
               azBackup.AddFiles(archivo_txt,0);
               DeleteFileUTF8(archivo_txt);
            end;
            Next;
          end;
        end;
      end;

      azBackup.CloseArchive;

      if MessageDlg('La copia de seguridad ha sido guardada en la carpeta indicada. ¿Desea abrir esta carpeta?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      begin
           OpenDocument(dedCarpetaArchivo.Directory);
      end;
      Close;
    end else
    begin
      MessageDlg('Ocurrió un error al realizar la copia de seguridad', mtError, [mbOK],0);
    end;

end;

procedure TfmBackup.dedCarpetaArchivoChange(Sender: TObject);
begin
  LSSaveConfig(['destino_backup'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TfmBackup.dedCarpetaArchivoExit(Sender: TObject);
begin
  LSSaveConfig(['destino_backup'],[dedCarpetaArchivo.Directory]);
  HabilitarAcciones;
end;

procedure TfmBackup.FormShow(Sender: TObject);
var
  destino:String;
begin
  LSLoadConfig(['destino_backup'],[destino],[@destino]);
  if destino='' then
  begin
     destino:=ExtractFilePath(Application.ExeName) + 'backup';
     if not DirectoryExistsUTF8(destino) then
        CreateDirUTF8(destino);
  end;
  dedCarpetaArchivo.Directory := destino;
  HabilitarAcciones;
end;

procedure TfmBackup.HabilitarAcciones;
begin
  acBackup.Enabled:=((dedCarpetaArchivo.Directory<>'') and DirectoryExistsUTF8(dedCarpetaArchivo.Directory));
end;

procedure TfmBackup.ExportarDB_SQL(archivo: string);
var
  str_sql: TStringList;
  tabla, vista: string;
begin

  //Genera un archivo str_sql con la estructura de tablas y vistas, y los datos correspondientes

   //Podría agregarse algún encabezado, como la versión de la aplicación,
   // nombre del observador, etc.

   str_sql:=TStringList.Create;

   //Seteo las variables globales del script
   str_sql.Add(SET_VAR_ENCABEZADO);
   str_sql.Add(NEWLINE);
   str_sql.Add('--');
   str_sql.Add('-- Tablas del sistema');
   str_sql.Add('--');
   str_sql.Add(NEWLINE);

   //Obtengo las tablas de la base de datos
   zqTablasYVistas.Close;
   zqTablasYVistas.ParamByName('tipo').Value:='BASE TABLE';
   zqTablasYVistas.Open;


   //Para cada tabla, creo la estructura y armo el insert con los datos
   with zqTablasYVistas do
   begin
     First;
     while not EOF do
     begin
       tabla:=zqTablasYVistasTables_in_centolla.AsString;
       str_sql.Add(SentenciaCreateTable(tabla));
       str_sql.Add(SentenciaInsert(tabla));
       str_sql.Add(NEWLINE);
       Application.ProcessMessages;
       Next;
     end;
   end;
   str_sql.Add(NEWLINE);

   //Las vistas las creo en dos pasadas. Primero creo una estructura falsa
   //para que las vistas que usan otras vistas no den error.
   //Luego creo las funciones y procedimientos
   //En la segunda pasada, borro la estructura falsa y creo la vista



   str_sql.Add(NEWLINE);
   str_sql.Add(NEWLINE);
   str_sql.Add('--');
   str_sql.Add('-- Estructura de vistas del sistema');
   str_sql.Add('--');
   str_sql.Add(NEWLINE);
   //Obtengo las vistas de la base de datos
   zqTablasYVistas.Close;
   zqTablasYVistas.ParamByName('tipo').Value:='VIEW';
   zqTablasYVistas.Open;

   //Para cada vista, creo la estructura vacía
   with zqTablasYVistas do
   begin
     First;
     while not EOF do
     begin
       vista:=zqTablasYVistasTables_in_centolla.AsString;
       str_sql.Add(CrearEstructura(vista));
       str_sql.Add(NEWLINE);
       Application.ProcessMessages;
       Next;
     end;
   end;

   //Para cada vista, creo la estructura final
   with zqTablasYVistas do
   begin
     First;
     while not EOF do
     begin
       vista:=zqTablasYVistasTables_in_centolla.AsString;
       str_sql.Add(SentenciaCreateView(vista));
       str_sql.Add(NEWLINE);
       Application.ProcessMessages;
       Next;
     end;
   end;

   //Se agrega el seteo de variables al final
   str_sql.Add(NEWLINE);
   str_sql.Add(SET_VAR_PIE);
   str_sql.Add(NEWLINE);

  if archivo <> '' then
   begin
     str_sql.SaveToFile(archivo);
   end;

   str_sql.Free;
end;

procedure TfmBackup.ExportarDB_TXT(carpeta: string);
var
  tabla: string;
  str_datos: TStringList;
  linea: string;
  i: Integer;
  primero: Boolean;
begin
   str_datos:=TStringList.Create;

   //Obtengo las tablas de la base de datos
   zqTablasYVistas.Close;
   zqTablasYVistas.ParamByName('tipo').Value:='BASE TABLE';
   zqTablasYVistas.Open;

   //Para cada tabla, creo la estructura y armo el insert con los datos
   with zqTablasYVistas do
   begin
     First;
     while not EOF do
     begin
       tabla:=zqTablasYVistasTables_in_centolla.AsString;
       zqDatosTabla.Close;
       zqDatosTabla.SQL.Text:='SELECT * FROM '+tabla;
       zqDatosTabla.Open;

       str_datos.Clear;
       //Genero la cabecera con los nombre de campo
       linea:='';
       primero:=True;
       for i:=0 to  zqDatosTabla.FieldCount-1 do
       begin
         if primero then
         begin
           primero:=False;
           linea:='"'+zqDatosTabla.Fields[i].DisplayLabel+'"';
         end else
         begin
              linea:=linea+';'+'"'+zqDatosTabla.Fields[i].DisplayLabel+'"';
         end;
       end;
       str_datos.Add(linea);

       //Si no hay datos, no hago nada mas
       if zqDatosTabla.RecordCount>0 then
       begin
          with zqDatosTabla do
          begin
            First;
            while not EOF do
            begin
              linea:='';
              primero:=True;
              for i := 0 to FieldCount-1 do
              begin
                if primero then
                begin
                  primero:=False;
                  linea:='"'+Fields[i].AsString+'"';
                end else
                begin
                  linea:=linea+';'+'"'+Fields[i].AsString+'"';
                end;
              end;
              str_datos.Add(linea);
              Next;
            end;
          end;
       end;
       str_datos.SaveToFile(carpeta+DirectorySeparator+tabla+'.txt');
       Next;
     end;
   end;
end;

function TfmBackup.SentenciaCreateTable(tabla: string): string;
var
  sentencia:String;
begin
  zqGetCreate.Close;
  zqGetCreate.SQL.Text:='SHOW CREATE TABLE '+tabla;
  zqGetCreate.Open;
  sentencia:=StringReplace(CREATE_TABLE_TEMPLATE, '<TABLA>', tabla, [rfReplaceAll, rfIgnoreCase]);
  sentencia:=StringReplace(sentencia, '<SENTENCIA_CREATE_TABLE>', zqGetCreate.FieldByName('Create Table').AsString, [rfReplaceAll, rfIgnoreCase]);
  result := sentencia;
end;

function TfmBackup.SentenciaCreateView(vista: string): string;
var
  sentencia:String;
begin
  zqGetCreate.Close;
  zqGetCreate.SQL.Text:='SHOW CREATE VIEW '+vista;
  zqGetCreate.Open;
  sentencia:=StringReplace(CREATE_VIEW_TEMPLATE, '<VISTA>', vista, [rfReplaceAll, rfIgnoreCase]);
  sentencia:=StringReplace(sentencia, '<SENTENCIA_CREATE_VIEW>', zqGetCreate.FieldByName('Create View').AsString, [rfReplaceAll, rfIgnoreCase]);
  result := sentencia;
end;

function TfmBackup.SentenciaInsert(tabla: string): string;
var
   sentencia: string;
   insert_values_reg:string;
   insert_values_gral:string;
   campos:string;
   i: integer;
   first_record:boolean;
   first_field:boolean;
   primero:boolean;
begin
     sentencia:='';

     zqDatosTabla.Close;
     zqDatosTabla.SQL.Text:='SELECT * FROM '+tabla;
     zqDatosTabla.Open;

     //Si no hay datos, no se genera la sentencia INSERT, se devuelve una cadena vacía
     if zqDatosTabla.RecordCount>0 then
     begin

       //Genero la lista de los nombres de campo
       campos:='';
       primero:=True;
       for i:=0 to  zqDatosTabla.FieldCount-1 do
       begin
         if primero then
         begin
           primero:=False;
           campos:=zqDatosTabla.Fields[i].DisplayLabel;
         end else
         begin
              campos:=campos+','+zqDatosTabla.Fields[i].DisplayLabel;
         end;
       end;
        with zqDatosTabla do
        begin
          First;
          insert_values_gral:='';
          first_record:=True;
          while not EOF do
          begin
            first_field:=True;
            insert_values_reg:='(';
            for i := 0 to FieldCount-1 do
            begin
              if first_field then
              begin
                first_field:=False;
                insert_values_reg:=insert_values_reg+FormatField(Fields[i]);
              end else
              begin
                //Si no es el primer campo, agrego una coma antes para separar
                insert_values_reg:=insert_values_reg+','+FormatField(Fields[i]);
              end;
            end;
            insert_values_reg:=insert_values_reg+')';
            if first_record then
            begin
              first_record:=False;
              insert_values_gral:=insert_values_reg;
            end else
              insert_values_gral:=insert_values_gral+','+insert_values_reg;
            Next;
          end;
          sentencia:=StringReplace(INSERT_TEMPLATE, '<TABLA>', tabla, [rfReplaceAll, rfIgnoreCase]);
          sentencia:=StringReplace(sentencia, '<CAMPOS>', campos, [rfReplaceAll, rfIgnoreCase]);
          sentencia:=StringReplace(sentencia, '<INSERT_VALUES>', insert_values_gral, [rfReplaceAll, rfIgnoreCase]);
        end;
     end;
     result := sentencia;
end;

function TfmBackup.FormatField(f: TField): string;
var
   valor: string;
begin
  //Según el tipo de campo, lo formateo como corresponde
     if f.IsNull then
     begin
       valor:='NULL';
     end else
     if (f is TIntegerField) or(f is TLongintField) or (f is TLargeintField) then
     begin
       valor:=IntToStr(f.Value);
     end else
     if f is TFloatField then
     begin
       valor:=FloatToStr(f.Value);
     end else
     if f is TDateField then
     begin
       //Las fechas son una cadena entre comillas
       valor:=''''+FormatDateTime('yyyy-mm-dd', f.AsDateTime)+'''';
     end else
     if f is TDateTimeField then
     begin
       //Las fechas son una cadena entre comillas
       valor:=''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', f.AsDateTime)+'''';
     end else
     if f is TTimeField then
     begin
       //Las horas son una cadena entre comillas
       valor:=''''+FormatDateTime('hh:mm:ss', f.AsDateTime)+'''';
     end else
     if f is TBooleanField then
     begin
       valor:=IntToStr(f.AsInteger);
     end else
     if f is TStringField then
     begin
       //Las cadenas deben ir encerradas entre comillas
       valor:=''''+f.AsString+'''';
     end else  //Cualquier otro tipo no contemplado se formatea como cadena
     if f is TBlobField then
     begin
       //Por ahora no sé como convertir los campos binarios a texto
       valor:='NULL';
     end else
     begin
       valor:=''''+f.AsString+'''';
     end;

     result := valor;
end;

function TfmBackup.CrearEstructura(vista: string): string;
var
   sentencia: string;
   str_todos: string;
   str_campo:string;
   first_record:boolean;
begin
     str_todos:='';

     zqDatosTabla.Close;
     zqDatosTabla.SQL.Text:='SHOW COLUMNS FROM '+vista;
     zqDatosTabla.Open;

     with zqDatosTabla do
     begin
       First;
       first_record:=True;
       while not EOF do
       begin
         str_campo:='1 AS `'+zqDatosTabla.FieldByName('Field').AsString+'`';
         if first_record then
         begin
           first_record:=False;
           str_todos:=str_campo;
         end else
         begin
           str_todos:=str_todos+','+NEWLINE+str_campo;
         end;
         Next;
       end;
     end;
     sentencia:=StringReplace(CREATE_VIEW_STRUCTURE_TEMPLATE, '<VISTA>', vista, [rfReplaceAll, rfIgnoreCase]);
     sentencia:=StringReplace(sentencia, '<VIEW_FIELDS>', str_todos, [rfReplaceAll, rfIgnoreCase]);
     result:=sentencia;
end;

end.

