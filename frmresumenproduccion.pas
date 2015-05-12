unit frmresumenproduccion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, frmbase, db, ZDataset, datGeneral;

type

  { TfmResumenProduccion }

  TfmResumenProduccion = class(TfmBase)
    dsProdFecha: TDataSource;
    dbgLista: TRxDBGrid;
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
    zqProductos: TZQuery;
    zqProductoscodigo: TStringField;
    procedure FormShow(Sender: TObject);
    procedure zqProdFechaBeforeOpen(DataSet: TDataSet);
    procedure zqProductosAfterOpen(DataSet: TDataSet);
    procedure zqProductosBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmResumenProduccion: TfmResumenProduccion;

implementation

{$R *.lfm}

{ TfmResumenProduccion }

procedure TfmResumenProduccion.zqProdFechaBeforeOpen(DataSet: TDataSet);
begin
  zqProdFecha.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmResumenProduccion.FormShow(Sender: TObject);
begin
  zqProductos.Close;
  zqProductos.Open;
  zqProdFecha.Close;
  zqProdFecha.Open;
end;

procedure TfmResumenProduccion.zqProductosAfterOpen(DataSet: TDataSet);
var
  column: integer;
begin
  with zqProductos do
  begin
    First;
    column:=1;
    while not EOF do
    begin
      dbgLista.Columns[column].Title.Caption:=zqProductoscodigo.AsString+'|Cajas';
      dbgLista.Columns[column].Visible:=True;
      Inc(column);
      dbgLista.Columns[column].Title.Caption:=zqProductoscodigo.AsString+'|Kilos';
      dbgLista.Columns[column].Visible:=True;
      Inc(column);
      Next;
    end;
  end;

end;

procedure TfmResumenProduccion.zqProductosBeforeOpen(DataSet: TDataSet);
begin
  zqProductos.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

end.

