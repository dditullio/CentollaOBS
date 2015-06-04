unit frmbackup;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, UTF8Process, AbZipper, AbBrowse, Forms, Controls,
  Graphics, Dialogs, StdCtrls, EditBtn, Buttons, ActnList, ComCtrls, LSConfig,
  datGeneral, db, sqldb, sqldblib, mysql55conn, ZSqlMetadata, ZDataset,
  ExSystemUtils, process, LCLIntf, ExtCtrls, AbArcTyp, AbUnzper, math;

type

  { TfmBackup }

  TfmBackup = class(TForm)
    auzBackup: TAbUnZipper;
    acRestaurar: TAction;
    azBackup: TAbZipper;
    acBackup: TAction;
    alBackup: TActionList;
    bbGuardar: TBitBtn;
    bbGuardar1: TBitBtn;
    cbCopiaTXT: TCheckBox;
    dedCarpetaArchivo: TDirectoryEdit;
    edArchivoSQL: TEdit;
    gbDestino: TGroupBox;
    gbDestino1: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    conRestaurar: TMySQL55Connection;
    meSQL: TMemo;
    odRestaurar: TOpenDialog;
    paEncabezado: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    pcBackup: TPageControl;
    paProceso: TPanel;
    prBackup: TProcessUTF8;
    pbProceso: TProgressBar;
    sbRestaurar: TSpeedButton;
    scRestaurar: TSQLScript;
    trRestaurar: TSQLTransaction;
    tsRestaurar: TTabSheet;
    tsBackup: TTabSheet;
    zqGetCreate: TZQuery;
    zqRutinasroutine_definition: TMemoField;
    zqRutinasroutine_name: TStringField;
    zqRutinasroutine_type: TStringField;
    zqTablasYVistas: TZQuery;
    zqCampos: TZQuery;
    zqTablasYVistasTables_in_centolla: TStringField;
    zqTablasYVistasTable_type: TStringField;
    zqDatosTabla: TZQuery;
    zqRutinas: TZQuery;
    zqDefRutina: TZQuery;
    procedure acBackupExecute(Sender: TObject);
    procedure acRestaurarExecute(Sender: TObject);
    procedure dedCarpetaArchivo1AcceptFileName(Sender: TObject;
      var Value: String);
    procedure dedCarpetaArchivoAcceptDirectory(Sender: TObject;
      var Value: String);
    procedure dedCarpetaArchivoChange(Sender: TObject);
    procedure dedCarpetaArchivoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbRestaurarClick(Sender: TObject);
    function EjecutarRestauracion: boolean;
  private
    { private declarations }
    Procedure HabilitarAcciones;
    procedure ExportarDB_SQL(archivo_tablas, archivo_rutinas: string);
    procedure ExportarDB_TXT(carpeta: string);
    function SentenciaCreateTable(tabla:string):string;
    function SentenciaCreateView(vista:string):string;
    function SentenciaInsert(tabla:string):string;
    function FormatField(f: TField):string;
    function CrearEstructuraVista(vista:string):string;
    procedure CrearTablasYDatos(var str_sql: TStringList);
    procedure CrearEncabezadoTablas(var str_sql: TStringList);
    procedure CrearPieTablas(var str_sql: TStringList);
    procedure GenerarEstructuraVistas(var str_sql: TStringList);
    procedure CrearRutinas(var str_sql: TStringList);
    procedure CrearVistasReales(var str_sql: TStringList);
    procedure CrearEncabezadoRutinas(var str_sql: TStringList);
    procedure CrearPieRutinas(var str_sql: TStringList);
  public
    { public declarations }
  end;

const
    NEWLINE=#13#10;
    PREFIJO_BKP='BKP_DB_CENTOLLA_';
    CADENA_TABLAS='TABLAS';
    CADENA_RUTINAS='RUTINAS';
    EXTENSION_ARCH_BACKUP='.obk';

    OLD_SET_VAR_ENCABEZADO=
               '-- -----------------------------------------------------'+NEWLINE+
               '-- Esquema centolla'+NEWLINE+
               '-- -----------------------------------------------------'+NEWLINE+
               ''+NEWLINE+
               'CREATE SCHEMA IF NOT EXISTS `centolla` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;'+NEWLINE+
               ''+NEWLINE+
               'USE `centolla` ;'+NEWLINE+
               ''+NEWLINE+
               ''+NEWLINE+
               '/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;'+NEWLINE+
                '/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;'+NEWLINE+
                '/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;'+NEWLINE+
                '/*!40101 SET NAMES utf8 */;'+NEWLINE+
                '/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;'+NEWLINE+
                '/*!40103 SET TIME_ZONE=''+00:00'' */;'+NEWLINE+
                '/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;'+NEWLINE+
                '/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;'+NEWLINE+
                '/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' */;'+NEWLINE+
                '/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;'+NEWLINE;

     OLD_SET_VAR_PIE=
                '/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;'+NEWLINE+
                '/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;'+NEWLINE+
                '/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;'+NEWLINE+
                '/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;'+NEWLINE+
                '/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;'+NEWLINE+
                '/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;'+NEWLINE+
                '/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;'+NEWLINE+
                '/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;'+NEWLINE;

     OLD_CREATE_TABLE_TEMPLATE=
                '--'+NEWLINE+
                '-- Estructura de la tabla `<TABLA>`'+NEWLINE+
                '--'+NEWLINE+
                ''+NEWLINE+
                'DROP TABLE IF EXISTS `<TABLA>`;'+NEWLINE+
                '/*!40101 SET @saved_cs_client     = @@character_set_client */;'+NEWLINE+
                '/*!40101 SET character_set_client = utf8 */;'+NEWLINE+
                '<SENTENCIA_CREATE_TABLE>;'+NEWLINE+
                '/*!40101 SET character_set_client = @saved_cs_client */;'+NEWLINE;

     OLD_INSERT_TEMPLATE=
                '--'+NEWLINE+
                '-- Volcado de datos de la tabla `<TABLA>`'+NEWLINE+
                '--'+NEWLINE+
                'LOCK TABLES `<TABLA>` WRITE;'+NEWLINE+
                '/*!40000 ALTER TABLE `<TABLA>` DISABLE KEYS */;'+NEWLINE+
                'INSERT INTO `<TABLA>` (<CAMPOS>) VALUES <INSERT_VALUES>;'+NEWLINE+
                '/*!40000 ALTER TABLE `<TABLA>` ENABLE KEYS */;'+NEWLINE+
                'UNLOCK TABLES;'+NEWLINE;

     OLD_CREATE_VIEW_STRUCTURE_TEMPLATE=
                '--'+NEWLINE+
                '-- Estructura temporaria para vista `<VISTA>`'+NEWLINE+
                '--'+NEWLINE+
                ''+NEWLINE+
                'DROP TABLE IF EXISTS `<VISTA>`;'+NEWLINE+
                '/*!50001 DROP VIEW IF EXISTS `<VISTA>`*/;'+NEWLINE+
                'SET @saved_cs_client     = @@character_set_client;'+NEWLINE+
                'SET character_set_client = utf8;'+NEWLINE+
                '/*!50001 CREATE VIEW `<VISTA>` AS SELECT <VIEW_FIELDS>*/;'+NEWLINE+
                'SET character_set_client = @saved_cs_client;'+NEWLINE;

     OLD_CREATE_VIEW_TEMPLATE=
                '--'+NEWLINE+
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

     SET_VAR_ENCABEZADO=
                '-- -----------------------------------------------------'+NEWLINE+
                '-- Esquema centolla'+NEWLINE+
                '-- -----------------------------------------------------'+NEWLINE+
                ''+NEWLINE+
                'CREATE SCHEMA IF NOT EXISTS `centolla` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;'+NEWLINE+
                ''+NEWLINE+
                'USE `centolla` ;'+NEWLINE+
                ''+NEWLINE+
                ''+NEWLINE+
                'SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT ;'+NEWLINE+
                 'SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS ;'+NEWLINE+
                 'SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION ;'+NEWLINE+
                 'SET NAMES utf8 ;'+NEWLINE+
                 'SET @OLD_TIME_ZONE=@@TIME_ZONE ;'+NEWLINE+
                 'SET TIME_ZONE=''+00:00'' ;'+NEWLINE+
                 'SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 ;'+NEWLINE+
                 'SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 ;'+NEWLINE+
                 'SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' ;'+NEWLINE+
                 'SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 ;'+NEWLINE;

      SET_VAR_PIE=
                 'SET TIME_ZONE=@OLD_TIME_ZONE ;'+NEWLINE+
                 'SET SQL_MODE=@OLD_SQL_MODE ;'+NEWLINE+
                 'SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS ;'+NEWLINE+
                 'SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS ;'+NEWLINE+
                 'SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT ;'+NEWLINE+
                 'SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS ;'+NEWLINE+
                 'SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION ;'+NEWLINE+
                 'SET SQL_NOTES=@OLD_SQL_NOTES ;'+NEWLINE;

      CREATE_TABLE_TEMPLATE=
                 '--'+NEWLINE+
                 '-- Estructura de la tabla `<TABLA>`'+NEWLINE+
                 '--'+NEWLINE+
                 ''+NEWLINE+
                 'DROP TABLE IF EXISTS `<TABLA>`;'+NEWLINE+
                 'SET @saved_cs_client     = @@character_set_client ;'+NEWLINE+
                 'SET character_set_client = utf8 ;'+NEWLINE+
                 '<SENTENCIA_CREATE_TABLE>;'+NEWLINE+
                 'SET character_set_client = @saved_cs_client ;'+NEWLINE;

      INSERT_TEMPLATE=
                 '--'+NEWLINE+
                 '-- Volcado de datos de la tabla `<TABLA>`'+NEWLINE+
                 '--'+NEWLINE+
                 ''+NEWLINE+
                 'LOCK TABLES `<TABLA>` WRITE;'+NEWLINE+
                 'ALTER TABLE `<TABLA>` DISABLE KEYS ;'+NEWLINE+
                 'INSERT INTO `<TABLA>` (<CAMPOS>) VALUES <INSERT_VALUES>;'+NEWLINE+
                 'ALTER TABLE `<TABLA>` ENABLE KEYS ;'+NEWLINE+
                 'UNLOCK TABLES;'+NEWLINE;

      //Por compatibilidad con la ejecución del script en Lazarus, se utiliza el
      //mismo delimitador que en las funciones y stored procedures
      CREATE_VIEW_STRUCTURE_TEMPLATE=
                 '--'+NEWLINE+
                 '-- Estructura temporaria para vista `<VISTA>`'+NEWLINE+
                 '--'+NEWLINE+
                 ''+NEWLINE+
                 'DELIMITER $$'+NEWLINE+
                 'DROP TABLE IF EXISTS `<VISTA>` $$'+NEWLINE+
                 'DROP VIEW IF EXISTS `<VISTA>` $$'+NEWLINE+
                 'SET @saved_cs_client     = @@character_set_client $$'+NEWLINE+
                 'SET character_set_client = utf8 $$'+NEWLINE+
                 'CREATE VIEW `<VISTA>` AS SELECT <VIEW_FIELDS> $$'+NEWLINE+
                 'SET character_set_client = @saved_cs_client $$'+NEWLINE+
                 'DELIMITER ;'+NEWLINE;

      CREATE_VIEW_TEMPLATE=
                 '--'+NEWLINE+
                 '-- Estructura final para la vista `<VISTA>`'+NEWLINE+
                 '--'+NEWLINE+
                 ''+NEWLINE+
                 'DELIMITER $$'+NEWLINE+
                 'DROP VIEW IF EXISTS `<VISTA>` $$'+NEWLINE+
                 'SET @saved_cs_client          = @@character_set_client $$'+NEWLINE+
                 'SET @saved_cs_results         = @@character_set_results $$'+NEWLINE+
                 'SET @saved_col_connection     = @@collation_connection $$'+NEWLINE+
                 'SET character_set_client      = utf8 $$'+NEWLINE+
                 'SET character_set_results     = utf8 $$'+NEWLINE+
                 'SET collation_connection      = utf8_general_ci $$'+NEWLINE+
                 '<SENTENCIA_CREATE_VIEW> $$'+NEWLINE+
                 'SET character_set_client      = @saved_cs_client $$'+NEWLINE+
                 'SET character_set_results     = @saved_cs_results $$'+NEWLINE+
                 'SET collation_connection      = @saved_col_connection $$'+NEWLINE+
                 'DELIMITER ;'+NEWLINE;

var
  fmBackup: TfmBackup;
  sl_tablas, sl_rutinas: TStringList;

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
var
  temp_dir: string;
  str_fecha: string;
  nombre_base, archivo_backup_tablas, archivo_backup_rutinas, archivo_zip, archivo_txt, tabla: string;
begin

    temp_dir:=GetTempDir;
    if not DirectoryExistsUTF8(temp_dir+DirectorySeparator+'CentollaOBS') then
       CreateDirUTF8(temp_dir+DirectorySeparator+'CentollaOBS');
    temp_dir:=temp_dir+DirectorySeparator+'CentollaOBS';

    str_fecha:=FormatDateTime('yyyy-mm-dd-hhmm', Now);
    nombre_base:=temp_dir+DirectorySeparator+PREFIJO_BKP;
    archivo_backup_tablas:=nombre_base+CADENA_TABLAS+EXTENSION_ARCH_BACKUP;
    archivo_backup_rutinas:=nombre_base+CADENA_RUTINAS+EXTENSION_ARCH_BACKUP;

    paProceso.Visible:=True;
    ExportarDB_SQL(archivo_backup_tablas, archivo_backup_rutinas);

    if cbCopiaTXT.Checked then
    begin
      ExportarDB_TXT(temp_dir);
    end;
    paProceso.Visible:=False;

    //Comprimir en ZIP
    if FileExistsUTF8(archivo_backup_tablas) then
    begin
      archivo_zip:=dedCarpetaArchivo.Directory+DirectorySeparator+PREFIJO_BKP+str_fecha+'.zip';
      if FileExistsUTF8(archivo_zip) then
         DeleteFileUTF8(archivo_zip);
      azBackup.BaseDirectory:=dedCarpetaArchivo.Directory;
      azBackup.FileName:=archivo_zip;

      //Agego los archivos de script
      azBackup.AddFiles(archivo_backup_tablas,0);
      azBackup.AddFiles(archivo_backup_rutinas,0);

      //Borro los archivos porque ya no se necesitan
      DeleteFileUTF8(archivo_backup_tablas);
      DeleteFileUTF8(archivo_backup_rutinas);

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
              //A medida que se van agregando al zip, se borran los originales
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

procedure TfmBackup.acRestaurarExecute(Sender: TObject);
var
  str_confirm: string;
begin
    if MessageDlg('ATENCIÓN!!!','La restauración de una copia de seguridad es una operación que destruye toda la información actual registrada en la aplicación, y la reemplaza por los datos contenidos en la copia de seguridad. ¿Está seguro de que desea perder los datos actuales?', mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
    begin
         //
      if InputQuery('Confirmación de proceso', 'Escriba la siguiente frase: "Voy a perder mis datos actuales"', str_confirm) = True then
      begin
        if LowerCase(str_confirm)=LowerCase('Voy a perder mis datos actuales') then
        begin
          //Se inicia la restauración
          if EjecutarRestauracion then
          begin
             MessageDlg('El proceso de restauración ha finalizado.', mtInformation, [mbOK],0);
             Close;
          end;
        end else
        begin
          MessageDlg('La frase de confirmación es incorrecta. La restauración se ha cancelado.', mtError, [mbOK],0);
        end;
      end else
      begin
        MessageDlg('Usted ha decidido no continuar. La restauración se ha cancelado.', mtConfirmation, [mbOK],0);
      end;

    end;
end;

procedure TfmBackup.dedCarpetaArchivo1AcceptFileName(Sender: TObject;
  var Value: String);
begin
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

procedure TfmBackup.FormCreate(Sender: TObject);
begin
  inherited;
  sl_rutinas:=TStringList.Create;
  sl_rutinas:=TStringList.Create;
end;

procedure TfmBackup.FormDestroy(Sender: TObject);
begin
   sl_tablas.Free;
   sl_rutinas.Free;
end;

procedure TfmBackup.FormShow(Sender: TObject);
var
  destino:String;
begin
    if not Assigned(sl_tablas) then
       sl_tablas:=TStringList.Create;
    if not Assigned(sl_rutinas) then
       sl_rutinas:=TStringList.Create;

    LSLoadConfig(['destino_backup'],[destino],[@destino]);
  if destino='' then
  begin
     destino:=ExtractFilePath(Application.ExeName) + 'backup';
     if not DirectoryExistsUTF8(destino) then
        CreateDirUTF8(destino);
  end;
  dedCarpetaArchivo.Directory := destino;
  pcBackup.ActivePage:=tsBackup;
  HabilitarAcciones;
end;

procedure TfmBackup.sbRestaurarClick(Sender: TObject);
var
  i:Integer;
  temp_dir: string;
  script_tablas, script_rutinas:string;
begin
  odRestaurar.InitialDir:=dedCarpetaArchivo.Directory;
  if odRestaurar.Execute then
  begin
    edArchivoSQL.Text:=odRestaurar.FileName;
    HabilitarAcciones;

    //Para verificar que sea un archivo de copia de seguridad aceptable,
    //Extraigo los archivos, verifico que existan los 2 SQLS (.obk), y que la
    //cabecera sea correcta
    temp_dir:=GetTempDir;
     if not DirectoryExistsUTF8(temp_dir+DirectorySeparator+'CentollaOBS') then
        CreateDirUTF8(temp_dir+DirectorySeparator+'CentollaOBS');
     temp_dir:=temp_dir+DirectorySeparator+'CentollaOBS';

     auzBackup.BaseDirectory:=temp_dir;
    auzBackup.FileName:=odRestaurar.FileName;
    auzBackup.ExtractFiles('*'+EXTENSION_ARCH_BACKUP);

    script_tablas:=temp_dir+DirectorySeparator+PREFIJO_BKP+CADENA_TABLAS+EXTENSION_ARCH_BACKUP;
    script_rutinas:=temp_dir+DirectorySeparator+PREFIJO_BKP+CADENA_RUTINAS+EXTENSION_ARCH_BACKUP;

    if FileExistsUTF8(script_tablas) and FileExistsUTF8(script_rutinas) then
    begin
      sl_tablas.LoadFromFile(script_tablas);
      sl_rutinas.LoadFromFile(script_rutinas);
      //Se oculta el memo para acelerar la carga del texto
      meSQL.Visible:=False;
      meSQL.Text:=sl_tablas.Text;
      meSQL.SelStart:=0;
      meSQL.Visible:=True;

      //Leo sólo uno de los archivos para verificar
      if (sl_tablas[0] <> '-- ---------------------------------------------')
         or (sl_tablas[1] <> '-- Tablas y datos de la base de datos "Centolla"')
         or (sl_tablas[2] <> '-- Generado desde la aplicación "CentollaOBS"')
         or (sl_tablas[4] <> '-- ---------------------------------------------') then
      begin
        if MessageDlg('Advertencia','El archivo seleccionado no parece ser una copia de seguridad generada por esta aplicación. Pueden generarse daños en los datos, perderse toda la información registrada, o inutilizar totalmente esta aplicación. ¿Está seguro de que desea utilizar este archivo?', mtWarning, [mbYes, mbNo],0, mbNo) = mrNo then
        begin
          meSQL.Clear;
          edArchivoSQL.Text:='';
          HabilitarAcciones;
        end;
      end;
       DeleteFileUTF8(script_tablas);
       DeleteFileUTF8(script_rutinas);
    end else
    begin
      MessageDlg('El archivo seleccionado no parece ser una copia de seguridad realizada por esta aplicación. No se puede procesar el archivo', mtError, [mbOK],0);
      meSQL.Clear;
      edArchivoSQL.Text:='';
      HabilitarAcciones;
    end;
  end;

end;

function TfmBackup.EjecutarRestauracion: boolean;
var
  restOK: boolean;
  linea: string;
  i:Integer;
  oldCursor: TCursor;
begin
   acRestaurar.Enabled:=False;
   meSQL.Visible:=False;
   oldCursor:=Cursor;
   Cursor:=crHourGlass;
   Application.ProcessMessages;
   restOK:=False;
   //Se utilizan los componentes de SQLdb ya que los de ZeosDB no permiten la ejecución de un script
   //Se copian los datos de conección desde la base de datos general
   conRestaurar.HostName:=dmGeneral.zcDB.HostName;
   conRestaurar.Port:=dmGeneral.zcDB.Port;
   conRestaurar.UserName:=dmGeneral.zcDB.User;
   conRestaurar.Password:=dmGeneral.zcDB.Password;
   conRestaurar.DatabaseName:=dmGeneral.zcDB.Database;
   try
     //Desconecto la base de datos principal para realizar el proceso
     dmGeneral.zcDB.Connected:=False;

     conRestaurar.Connected:= True;

     trRestaurar.StartTransaction;

     scRestaurar.Terminator:=';';
     scRestaurar.Script.Text:=sl_tablas.Text;
     scRestaurar.ExecuteScript;

     //Por un problema de compatibilidad con el componente de script,
     //debe eliminarse el "DELIMITER" y configurarlo directamente
     //en el componente

     for i:=0 to sl_rutinas.Count-1 do
     begin
       sl_rutinas[i]:=StringReplace(sl_rutinas[i], 'DELIMITER $$', '', [rfReplaceAll, rfIgnoreCase]);
       sl_rutinas[i]:=StringReplace(sl_rutinas[i], 'DELIMITER ;', '', [rfReplaceAll, rfIgnoreCase]);
     end;
     scRestaurar.Terminator:='$$';
     scRestaurar.Script.Text:=sl_rutinas.Text;
     scRestaurar.ExecuteScript;
     trRestaurar.Commit;

     restOK:=True;
   except
     trRestaurar.Rollback;
     MessageDlg('Ocurrió un error al realizar la restauración de la copia de seguridad.', mtError, [mbOK],0);
   end;
   conRestaurar.Connected:=False;

   //Reconecto la base de datos principal
   dmGeneral.zcDB.Connect;

   meSQL.Visible:=True;
   Cursor:=oldCursor;
   Result:=restOK;
end;

procedure TfmBackup.HabilitarAcciones;
begin
   acBackup.Enabled:=((dedCarpetaArchivo.Directory<>'') and DirectoryExistsUTF8(dedCarpetaArchivo.Directory));
   acRestaurar.Enabled:=((edArchivoSQL.Text<>'') and FileExistsUTF8(edArchivoSQL.Text));
end;

procedure TfmBackup.ExportarDB_SQL(archivo_tablas, archivo_rutinas: string);
var
   str_sql_tablas: TStringList;
   str_sql_rutinas: TStringList;
begin

  //Genera un archivo str_sql_tablas con la estructura de tablas y vistas, y los datos correspondientes

   //Se utiliza un StringList para almacenar el código del script
   str_sql_tablas:=TStringList.Create;

   //Se arma un encabezado con las variables de inicio del script
   CrearEncabezadoTablas(str_sql_tablas);

   CrearTablasYDatos(str_sql_tablas);

   //Se agrega el seteo de variables al final
   CrearPieTablas(str_sql_tablas);

  if archivo_tablas <> '' then
   begin
     str_sql_tablas.SaveToFile(archivo_tablas);
   end;

   str_sql_tablas.Free;

   //Generación del script de rutinas (vistas, stored procedures, funciones y triggers
   str_sql_rutinas:=TStringList.Create;

   CrearEncabezadoRutinas(str_sql_rutinas);

   //Las vistas las creo en dos pasadas. Primero creo una estructura falsa
   //para que las vistas que usan otras vistas no den error.
   //Luego creo las funciones y procedimientos
   //En la segunda pasada, borro la estructura falsa y creo la vista
   GenerarEstructuraVistas(str_sql_rutinas);

   //Antes de crear la vista final, creo las funciones. Primero creo una "fachada"
   //para que la función exista si es requerida por otra cuando se cree la versión
   //final en la segunda pasada

   CrearRutinas(str_sql_rutinas);

   //Segunda pasada de vistas: Para cada vista, creo la estructura final
   CrearVistasReales(str_sql_rutinas);

   //Finalizo con las variables de cierre
   CrearPieRutinas(str_sql_rutinas);

  if archivo_rutinas <> '' then
   begin
     str_sql_rutinas.SaveToFile(archivo_rutinas);
   end;

   str_sql_rutinas.Free;

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

function TfmBackup.CrearEstructuraVista(vista: string): string;
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

procedure TfmBackup.CrearTablasYDatos(var str_sql: TStringList);
var
   tabla: string;
begin
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
       Application.ProcessMessages;
       Next;
     end;
   end;
   str_sql.Add(NEWLINE);
end;

procedure TfmBackup.CrearEncabezadoTablas(var str_sql: TStringList);
begin
    str_sql.Add('-- ---------------------------------------------');
    str_sql.Add('-- Tablas y datos de la base de datos "Centolla"');
    str_sql.Add('-- Generado desde la aplicación "CentollaOBS"');
    str_sql.Add('-- Fecha y hora de resguardo: '+FormatDateTime('dd/mm/yyyy hh:mm', Now));
    str_sql.Add('-- ---------------------------------------------');
    str_sql.Add('');
    //Seteo las variables globales del script
    str_sql.Add(SET_VAR_ENCABEZADO);
    str_sql.Add(NEWLINE);
    str_sql.Add('-- ------------------ --');
    str_sql.Add('-- Tablas del sistema --');
    str_sql.Add('-- ------------------ --');
    str_sql.Add('');
end;

procedure TfmBackup.CrearPieTablas(var str_sql: TStringList);
begin
   str_sql.Add(NEWLINE);
   str_sql.Add(SET_VAR_PIE);
   str_sql.Add(NEWLINE);
   str_sql.Add('-- ----------------------------------------------------');
   str_sql.Add('-- Fin de la copia de seguridad: '+FormatDateTime('dd/mm/yyyy hh:mm', Now));
   str_sql.Add('-- ----------------------------------------------------');
   str_sql.Add(NEWLINE);
end;

procedure TfmBackup.GenerarEstructuraVistas(var str_sql: TStringList);
var
   vista: string;
begin
   str_sql.Add('-- -------------------------------- --');
   str_sql.Add('-- Estructura de vistas del sistema --');
   str_sql.Add('-- -------------------------------- --');
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
       //Las funciones GIS no son del todo compatibles, así que las salteo
       if LowerCase(LeftStr(vista, 5))<>'v_gis' then
       begin
         str_sql.Add(CrearEstructuraVista(vista));
         Application.ProcessMessages;
       end;
       Next;
     end;
   end;
end;

procedure TfmBackup.CrearRutinas(var str_sql: TStringList);
var
   def_rutina:string;
   drop_rutina: string;
begin
   zqRutinas.Close;
   zqRutinas.Open;

   str_sql.Add('');
   str_sql.Add('-- ------------------------------------------------------- --');
   str_sql.Add('-- Definición de Funciones y Stored Procedures del sistema --');
   str_sql.Add('-- ------------------------------------------------------- --');
   str_sql.Add('');
   str_sql.Add('-- --------------------- --');
   str_sql.Add('-- Creación de cabeceras --');
   str_sql.Add('-- --------------------- --');

   while not zqRutinas.EOF do
   begin
     //Busco la sentencia de creación
     zqDefRutina.Close;
     if zqRutinasroutine_type.AsString='PROCEDURE' then
        zqDefRutina.SQL.Text:='SHOW CREATE PROCEDURE '+zqRutinasroutine_name.AsString
     else
        zqDefRutina.SQL.Text:='SHOW CREATE FUNCTION '+zqRutinasroutine_name.AsString;
     zqDefRutina.Open;

     //Extraigo sólo la linea de definición (quito el código)
     if zqRutinasroutine_type.AsString='PROCEDURE' then
     begin
       drop_rutina:='DELIMITER $$'+NEWLINE+'DROP PROCEDURE IF EXISTS '+zqRutinasroutine_name.AsString+'$$'+NEWLINE+'DELIMITER ;';
          def_rutina:=zqDefRutina.FieldByName('Create Procedure').AsString;
          def_rutina:=StringReplace(def_rutina, zqRutinasroutine_definition.AsString, 'BEGIN'+NEWLINE+'END$$', [rfReplaceAll, rfIgnoreCase]);;
     end
     else
     begin
       drop_rutina:='DELIMITER $$'+NEWLINE+'DROP FUNCTION IF EXISTS '+zqRutinasroutine_name.AsString+'$$'+NEWLINE+'DELIMITER ;';
          def_rutina:=zqDefRutina.FieldByName('Create Function').AsString;
          def_rutina:=StringReplace(def_rutina, zqRutinasroutine_definition.AsString, 'BEGIN'+NEWLINE+'RETURN NULL;'+NEWLINE+'END$$', [rfReplaceAll, rfIgnoreCase]);;
     end;

     //por una cuestión estética, fuerzo el nombre de la rutina a minúsculas
     def_rutina:=StringReplace(def_rutina, zqRutinasroutine_name.AsString, LowerCase(zqRutinasroutine_name.AsString), [rfReplaceAll, rfIgnoreCase]);;


     str_sql.Add('');
     str_sql.Add('--');
     str_sql.Add('-- Estructura base de Rutina '+zqRutinasroutine_name.AsString);
     str_sql.Add('--');
     str_sql.Add('');
     str_sql.Add(drop_rutina);
     str_sql.Add('DELIMITER $$'+NEWLINE+def_rutina+NEWLINE+'DELIMITER ;');
     zqRutinas.Next;
   end;

   //Segunda pasada: creo las rutinas con su código real
   str_sql.Add(NEWLINE);
   str_sql.Add('-- ---------------------------------------------------- --');
   str_sql.Add('-- Definición completa de Funciones y Stored Procedures --');
   str_sql.Add('-- ---------------------------------------------------- --');
   zqRutinas.First;
   while not zqRutinas.EOF do
   begin
     //Busco la sentencia de creación
     zqDefRutina.Close;
     if zqRutinasroutine_type.AsString='PROCEDURE' then
     begin
        drop_rutina:='DELIMITER $$'+NEWLINE+'DROP PROCEDURE IF EXISTS '+zqRutinasroutine_name.AsString+'$$'+NEWLINE+'DELIMITER ;';
        zqDefRutina.SQL.Text:='SHOW CREATE PROCEDURE '+zqRutinasroutine_name.AsString
     end
     else
     begin
        drop_rutina:='DELIMITER $$'+NEWLINE+'DROP FUNCTION IF EXISTS '+zqRutinasroutine_name.AsString+'$$'+NEWLINE+'DELIMITER ;';
        zqDefRutina.SQL.Text:='SHOW CREATE FUNCTION '+zqRutinasroutine_name.AsString;
     end;
     zqDefRutina.Open;

     if zqRutinasroutine_type.AsString='PROCEDURE' then
          def_rutina:=zqDefRutina.FieldByName('Create Procedure').AsString+'$$'
     else
          def_rutina:=zqDefRutina.FieldByName('Create Function').AsString+'$$';

     //por una cuestión estética, fuerzo el nombre de la rutina a minúsculas
     def_rutina:=StringReplace(def_rutina, zqRutinasroutine_name.AsString, LowerCase(zqRutinasroutine_name.AsString), [rfReplaceAll, rfIgnoreCase]);;

     str_sql.Add(NEWLINE);
     str_sql.Add('--');
     str_sql.Add('-- Definición completa de Rutina '+zqRutinasroutine_name.AsString);
     str_sql.Add('--');
     str_sql.Add('');
     str_sql.Add(drop_rutina);
     str_sql.Add('DELIMITER $$'+NEWLINE+def_rutina+NEWLINE+'DELIMITER ;');
     zqRutinas.Next;
   end;
end;

procedure TfmBackup.CrearVistasReales(var str_sql: TStringList);
var
   vista: string;
begin
   with zqTablasYVistas do
   begin
     First;
     while not EOF do
     begin
       vista:=zqTablasYVistasTables_in_centolla.AsString;
       //Las funciones GIS no son del todo compatibles, así que las salteo
       if LowerCase(LeftStr(vista, 5))<>'v_gis' then
       begin
         str_sql.Add(SentenciaCreateView(vista));
         str_sql.Add('');
         Application.ProcessMessages;
       end;
       Next;
     end;
   end;
end;

procedure TfmBackup.CrearEncabezadoRutinas(var str_sql: TStringList);
var
   variables: string;
begin
   str_sql.Add('DELIMITER $$');
   str_sql.Add('-- ---------------------------------------------');
   str_sql.Add('-- Rutinas de la base de datos "Centolla"');
   str_sql.Add('-- realizada desde la aplicación "CentollaOBS"');
   str_sql.Add('-- Fecha y hora de resguardo: '+FormatDateTime('dd/mm/yyyy hh:mm', Now));
   str_sql.Add('-- ---------------------------------------------');
   str_sql.Add('');

   //Seteo las variables globales del script
   //Por compatibilidad con la ejecución del script en Lazarus, se utiliza el
   //mismo delimitador que en las funciones y stored procedures
   variables:=StringReplace(SET_VAR_ENCABEZADO,';','$$',[rfReplaceAll, rfIgnoreCase]);
   str_sql.Add(variables);
   str_sql.Add('DELIMITER ;');
   str_sql.Add(NEWLINE);
end;

procedure TfmBackup.CrearPieRutinas(var str_sql: TStringList);
var
   variables: string;
begin
   str_sql.Add(NEWLINE);
   //Seteo las variables globales del script
   //Por compatibilidad con la ejecución del script en Lazarus, se utiliza el
   //mismo delimitador que en las funciones y stored procedures
   str_sql.Add('DELIMITER $$');
   variables:=StringReplace(SET_VAR_PIE,';','$$',[rfReplaceAll, rfIgnoreCase]);
   str_sql.Add(variables);
   str_sql.Add('DELIMITER ;');
   str_sql.Add(NEWLINE);
   str_sql.Add('-- ----------------------------------------------------');
   str_sql.Add('-- Fin de la copia de seguridad: '+FormatDateTime('dd/mm/yyyy hh:mm', Now));
   str_sql.Add('-- ----------------------------------------------------');
   str_sql.Add(NEWLINE);
end;

end.

