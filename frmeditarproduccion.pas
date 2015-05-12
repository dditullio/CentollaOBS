unit frmeditarproduccion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase,
  ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup, DtDBEdit,
  DtDBLookupComboBox, db, datGeneral, DateTimePicker, ValidateEdit;

type

  { TfmEditarProduccion }

  TfmEditarProduccion = class(TZEdicionBase)
    dbdtFecha: TDBDateTimePicker;
    dbedCajas: TDBEdit;
    dbedKg: TDBEdit;
    dblkProducto: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    StringField1: TStringField;
    zqPrincipalcant_cajas: TLongintField;
    zqPrincipalfecha: TDateField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidproduccion: TLongintField;
    zqPrincipalidproducto: TLongintField;
    zqPrincipalkilos: TFloatField;
    zqProductos: TZQuery;
    zqProductoscodigo: TStringField;
    zqProductoscod_manchas: TLongintField;
    zqProductosdescripcion: TStringField;
    zqProductosidmarea: TLongintField;
    zqProductosidproducto: TLongintField;
    zqProductosorden: TLongintField;
    zqProductospeso_max: TFloatField;
    zqProductospeso_min: TFloatField;
    zqProductosporcent_carne_max: TLongintField;
    zqProductosporcent_carne_min: TLongintField;
    zqProductosrotos: TSmallintField;
    zqProductostalla_max: TLongintField;
    zqProductostalla_min: TLongintField;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure dbdtFechaExit(Sender: TObject);
    procedure dblkProductoExit(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject;
      var ValidacionOK: boolean);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqProductosBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarProduccion: TfmEditarProduccion;
  ult_fecha:TDateTime=NullDate;

implementation

{$R *.lfm}

{ TfmEditarProduccion }

procedure TfmEditarProduccion.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidproduccion.Value:=zcePrincipal.NuevoID('produccion');
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  if (ult_fecha=NullDate) then
     zqPrincipalfecha.AsDateTime:=Date
  else
    zqPrincipalfecha.AsDateTime:=ult_fecha;
end;

procedure TfmEditarProduccion.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarProduccion.dbdtFechaExit(Sender: TObject);
begin
  if zqPrincipal.State in[dsInsert, dsEdit] then
  begin
    zqPrincipal.Post;
    ult_fecha:=dbdtFecha.Field.AsDateTime;
  end;
end;

procedure TfmEditarProduccion.dblkProductoExit(Sender: TObject);
begin
  if dblkProducto.Text='' then
  begin
    MessageDlg('Debe seleccionar el producto', mtError, [mbOK], 0);
    if dblkProducto.CanFocus then
       dblkProducto.SetFocus;
  end;
end;

procedure TfmEditarProduccion.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
  if zqPrincipalidproducto.IsNull then
  begin
    MessageDlg('Debe seleccionar el producto', mtError, [mbOK], 0);
    if dblkProducto.CanFocus then
       dblkProducto.SetFocus;
  end else
  if (zqPrincipalcant_cajas.AsInteger=0) and (zqPrincipalkilos.AsFloat=0) then
  begin
    MessageDlg('Debe indicar la cantidad de cajas o el peso de la producción', mtError, [mbOK], 0);
    if dbedCajas.CanFocus then
       dbedCajas.SetFocus;
  end;
end;

procedure TfmEditarProduccion.zqProductosBeforeOpen(DataSet: TDataSet);
begin
  zqProductos.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

end.

