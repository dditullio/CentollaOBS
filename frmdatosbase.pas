unit frmdatosbase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, frmbase, zcontroladorgrilla,
  frmeditarlineas, db, ZDataset, datGeneral, frmeditarproductos, frmeditarcarnada,
  frmeditartipostrampa;

type

  { TfmDatosBase }

  TfmDatosBase = class(TfmBase)
    bbAgregar: TBitBtn;
    bbAgregar1: TBitBtn;
    bbAgregar2: TBitBtn;
    bbAgregar3: TBitBtn;
    bbEditar: TBitBtn;
    bbEditar1: TBitBtn;
    bbEditar2: TBitBtn;
    bbEditar3: TBitBtn;
    bbEliminar: TBitBtn;
    bbEliminar1: TBitBtn;
    bbEliminar2: TBitBtn;
    bbEliminar3: TBitBtn;
    bbExportarLineas: TBitBtn;
    bbExportarProductos: TBitBtn;
    bbExportarCarnadas: TBitBtn;
    bbExportarTiposTrampa: TBitBtn;
    dsTiposTrampa: TDataSource;
    dsLineas: TDataSource;
    dbgLineas: TRxDBGrid;
    dbgProductos: TRxDBGrid;
    dbgCarnadas: TRxDBGrid;
    dbgTiposTrampa: TRxDBGrid;
    dsProductos: TDataSource;
    dsCarnada: TDataSource;
    gbLineas: TGroupBox;
    gbProductos: TGroupBox;
    gbCarnadas: TGroupBox;
    gbTiposTrampa: TGroupBox;
    paGrilla: TPanel;
    paGrilla1: TPanel;
    paGrilla2: TPanel;
    paGrilla3: TPanel;
    zcgTiposTrampa: TZControladorGrilla;
    zcgLineas: TZControladorGrilla;
    zcgProductos: TZControladorGrilla;
    zcgCarnada: TZControladorGrilla;
    zqLineascalada: TLongintField;
    zqLineascant_trampas: TLargeintField;
    zqLineasdistancia_entre_trampas: TLargeintField;
    zqLineasidmarea: TLongintField;
    zqLineasinvestigacion: TSmallintField;
    zqLineasnro_boya: TLongintField;
    zqLineasnro_linea: TLongintField;
    zqTiposTrampa: TZQuery;
    zqCarnadadescripcion: TStringField;
    zqCarnadaidcarnada: TLongintField;
    zqCarnadaidmarea: TLongintField;
    zqLineas: TZQuery;
    zqProductos: TZQuery;
    zqCarnada: TZQuery;
    zqProductoscodigo: TStringField;
    zqProductosdescripcion: TStringField;
    zqProductosdetalle: TStringField;
    zqProductosidmarea: TLongintField;
    zqProductosidproducto: TLongintField;
    zqProductosorden: TLongintField;
    zqTiposTrampacant_aros: TLongintField;
    zqTiposTrampacodigo: TStringField;
    zqTiposTrampadescripcion: TStringField;
    zqTiposTrampaidtipo_trampa: TLongintField;
    procedure FormShow(Sender: TObject);
    procedure zcgLineasAntesAgregar(Sender: TObject);
    procedure zqCarnadaBeforeOpen(DataSet: TDataSet);
    procedure zqLineasBeforeOpen(DataSet: TDataSet);
    procedure zqLineasCalcFields(DataSet: TDataSet);
    procedure zqProductosBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmDatosBase: TfmDatosBase;

implementation

{$R *.lfm}

{ TfmDatosBase }

procedure TfmDatosBase.FormShow(Sender: TObject);
begin
  zcgLineas.Buscar;
  zcgLineas.HabilitarAcciones;
  zcgProductos.Buscar;
  zcgProductos.HabilitarAcciones;
  zcgCarnada.Buscar;
  zcgCarnada.HabilitarAcciones;
  zcgTiposTrampa.Buscar;
  zcgTiposTrampa.HabilitarAcciones;
end;

procedure TfmDatosBase.zcgLineasAntesAgregar(Sender: TObject);
begin

end;

procedure TfmDatosBase.zqCarnadaBeforeOpen(DataSet: TDataSet);
begin
  zqCarnada.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmDatosBase.zqLineasBeforeOpen(DataSet: TDataSet);
begin
  zqLineas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmDatosBase.zqLineasCalcFields(DataSet: TDataSet);
begin
end;

procedure TfmDatosBase.zqProductosBeforeOpen(DataSet: TDataSet);
begin
  zqProductos.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

end.

