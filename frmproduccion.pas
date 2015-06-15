unit frmProduccion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, DividerBevel, rxdbgrid, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, Buttons, ActnList, StdCtrls, DBGrids,
  frmlistabase, db, ZDataset, zcontroladorgrilla, datGeneral;

type

  { TfmProduccion }

  TfmProduccion = class(TfmListaBase)
    bbExportar1: TBitBtn;
    dbgListaProd: TRxDBGrid;
    dsProdFecha: TDataSource;
    dsProduccion: TDataSource;
    dtFecha_ini: TDateTimePicker;
    dtFecha_fin: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Splitter1: TSplitter;
    zcgResumen: TZControladorGrilla;
    zqFechasfecha_fin: TDateField;
    zqFechasfecha_ini: TDateField;
    zqProdFecha: TZQuery;
    zqProdFechacajas_p1: TLargeintField;
    zqProdFechacajas_p10: TLargeintField;
    zqProdFechacajas_p2: TLargeintField;
    zqProdFechacajas_p3: TLargeintField;
    zqProdFechacajas_p4: TLargeintField;
    zqProdFechacajas_p5: TLargeintField;
    zqProdFechacajas_p6: TLargeintField;
    zqProdFechacajas_p7: TLargeintField;
    zqProdFechacajas_p8: TLargeintField;
    zqProdFechacajas_p9: TLargeintField;
    zqProdFechafecha: TDateField;
    zqProdFechaidmarea: TLongintField;
    zqProdFechakilos_p1: TFloatField;
    zqProdFechakilos_p10: TFloatField;
    zqProdFechakilos_p2: TFloatField;
    zqProdFechakilos_p3: TFloatField;
    zqProdFechakilos_p4: TFloatField;
    zqProdFechakilos_p5: TFloatField;
    zqProdFechakilos_p6: TFloatField;
    zqProdFechakilos_p7: TFloatField;
    zqProdFechakilos_p8: TFloatField;
    zqProdFechakilos_p9: TFloatField;
    zqProdFechatot_cajas: TLargeintField;
    zqProdFechatot_kilos: TFloatField;
    zqProduccion: TZQuery;
    zqProduccioncant_cajas: TLongintField;
    zqProduccioncodigo: TStringField;
    zqProducciondetalle: TStringField;
    zqProduccionfecha: TDateField;
    zqProduccionidmarea: TLongintField;
    zqProduccionidproduccion: TLongintField;
    zqProduccionidproducto: TLongintField;
    zqProduccionkilos: TFloatField;
    zqProduccionorden: TLongintField;
    zqProductos: TZQuery;
    zqProductoscodigo: TStringField;
    zqFechas: TZQuery;
    ZQuery1cant_cajas: TLongintField;
    ZQuery1codigo: TStringField;
    ZQuery1detalle: TStringField;
    ZQuery1fecha: TDateField;
    ZQuery1idmarea: TLongintField;
    ZQuery1idproduccion: TLongintField;
    ZQuery1idproducto: TLongintField;
    ZQuery1kilos: TFloatField;
    procedure dtFecha_iniChange(Sender: TObject);
    procedure dtFecha_iniCheckBoxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqFechasBeforeOpen(DataSet: TDataSet);
    procedure zqProdFechaAfterOpen(DataSet: TDataSet);
    procedure zqProdFechaBeforeOpen(DataSet: TDataSet);
    procedure zqProduccionAfterOpen(DataSet: TDataSet);
    procedure zqProduccionBeforeOpen(DataSet: TDataSet);
    procedure zqProductosAfterOpen(DataSet: TDataSet);
    procedure zqProductosBeforeOpen(DataSet: TDataSet);
  private
    procedure EstablecerRangoFechas;
    { private declarations }
  public
    { public declarations }
  end;

var
  fmProduccion: TfmProduccion;

implementation

{$R *.lfm}

{ TfmProduccion }

procedure TfmProduccion.dtFecha_iniChange(Sender: TObject);
begin
  zcgLista.Buscar;
  zqProdFecha.Close;
  zqProdFecha.Open;
end;

procedure TfmProduccion.dtFecha_iniCheckBoxChange(Sender: TObject);
begin
  if dtFecha_ini.Checked then
     dtFecha_ini.Date:=Date
  else
    dtFecha_ini.Date:=NullDate;
  zcgLista.Buscar;
end;

procedure TfmProduccion.FormShow(Sender: TObject);
begin
  EstablecerRangoFechas;
  inherited;
end;

procedure TfmProduccion.zqFechasBeforeOpen(DataSet: TDataSet);
begin
  zqFechas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmProduccion.zqProdFechaAfterOpen(DataSet: TDataSet);
begin
  zcgResumen.HabilitarAcciones;
end;

procedure TfmProduccion.zqProdFechaBeforeOpen(DataSet: TDataSet);
begin
  EstablecerRangoFechas;
  zqProdFecha.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if dtFecha_ini.Date<>NullDate then
    zqProdFecha.ParamByName('fecha_ini').AsDateTime:=dtFecha_ini.Date;
  if dtFecha_fin.Date<>NullDate then
    zqProdFecha.ParamByName('fecha_fin').AsDateTime:=dtFecha_fin.Date;
end;

procedure TfmProduccion.zqProduccionAfterOpen(DataSet: TDataSet);
begin
  zqProductos.Close;
  zqProductos.Open;
  zqProdFecha.Close;
  zqProdFecha.Open;
end;

procedure TfmProduccion.zqProduccionBeforeOpen(DataSet: TDataSet);
begin
  EstablecerRangoFechas;
  zqProduccion.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if dtFecha_ini.Date<>NullDate then
     zqProduccion.ParamByName('fecha_ini').AsDateTime:=dtFecha_ini.Date;
  if dtFecha_fin.Date<>NullDate then
     zqProduccion.ParamByName('fecha_fin').AsDateTime:=dtFecha_fin.Date;
end;

procedure TfmProduccion.zqProductosAfterOpen(DataSet: TDataSet);
var
  column: integer;
begin
  with zqProductos do
  begin
    First;
    column:=1;
    while not EOF do
    begin
      dbgListaProd.Columns[column].Title.Caption:=zqProductoscodigo.AsString+'|Cajas';
      dbgListaProd.Columns[column].Visible:=True;
      Inc(column);
      dbgListaProd.Columns[column].Title.Caption:=zqProductoscodigo.AsString+'|Kilos';
      dbgListaProd.Columns[column].Visible:=True;
      Inc(column);
      Next;
    end;
  end;
end;

procedure TfmProduccion.zqProductosBeforeOpen(DataSet: TDataSet);
begin
  zqProductos.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmProduccion.EstablecerRangoFechas;
begin
  zqFechas.Close;
  zqFechas.Open;
  if zqFechasfecha_ini.IsNull then
  begin
     if dmGeneral.zqMareaActivafecha_zarpada.IsNull then
        dtFecha_ini.Date:=NullDate
     else
       dtFecha_ini.Date:=dmGeneral.zqMareaActivafecha_zarpada.AsDateTime;
  end
  else
    dtFecha_ini.Date:=zqFechasfecha_ini.AsDateTime;

  if zqFechasfecha_fin.IsNull then
     dtFecha_fin.Date:=Date
  else
    dtFecha_fin.Date:=zqFechasfecha_fin.AsDateTime;
end;

end.

