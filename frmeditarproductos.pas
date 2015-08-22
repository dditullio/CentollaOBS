unit frmeditarproductos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase, ZDataset,
  SQLQueryGroup, zcontroladoredicion, zdatasetgroup, db, datGeneral;

type

  { TfmEditarProductos }

  TfmEditarProductos = class(TZEdicionBase)
    dbcbRotos: TDBCheckBox;
    dbedCodigo: TDBEdit;
    dbedOrden: TDBEdit;
    dbedDescripcion: TDBEdit;
    dbedTallaMin: TDBEdit;
    dbedTallaMax: TDBEdit;
    dbedPesoMin: TDBEdit;
    dbedPesoMax: TDBEdit;
    dbedCarneMin: TDBEdit;
    dbedCarneMax: TDBEdit;
    dbrgAspecto: TDBRadioGroup;
    gbTalla: TGroupBox;
    gbPeso: TGroupBox;
    gbPorcentCarne: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    zqPrincipalcodigo: TStringField;
    zqPrincipalcod_manchas: TLongintField;
    zqPrincipaldescripcion: TStringField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidproducto: TLongintField;
    zqPrincipalorden: TLongintField;
    zqPrincipalpeso_max: TFloatField;
    zqPrincipalpeso_min: TFloatField;
    zqPrincipalporcent_carne_max: TLongintField;
    zqPrincipalporcent_carne_min: TLongintField;
    zqPrincipalrotos: TSmallintField;
    zqPrincipaltalla_max: TLongintField;
    zqPrincipaltalla_min: TLongintField;
    procedure dbedCodigoExit(Sender: TObject);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
    procedure zqPrincipalporcent_carne_maxValidate(Sender: TField);
    procedure zqPrincipalporcent_carne_minValidate(Sender: TField);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarProductos: TfmEditarProductos;

implementation

{$R *.lfm}

{ TfmEditarProductos }

procedure TfmEditarProductos.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalidproducto.Value:=zcePrincipal.NuevoID('productos');
  zqPrincipalrotos.Value:=0;
  zqPrincipalcod_manchas.Value:=0;
end;

procedure TfmEditarProductos.zqPrincipalporcent_carne_maxValidate(Sender: TField
  );
begin
  if (zqPrincipalporcent_carne_max.Value<0) or (zqPrincipalporcent_carne_max.Value>100) then
  begin
    MessageDlg('El porcentaje debe estar comprendido entre 0 y 100', mtError, [mbOK], 0);
    if dbedCarneMax.CanFocus then
       dbedCarneMax.SetFocus;
  end;
end;

procedure TfmEditarProductos.zqPrincipalporcent_carne_minValidate(Sender: TField
  );
begin
  if (zqPrincipalporcent_carne_min.Value<0) or (zqPrincipalporcent_carne_min.Value>100) then
  begin
    MessageDlg('El porcentaje debe estar comprendido entre 0 y 100', mtError, [mbOK], 0);
    if dbedCarneMin.CanFocus then
       dbedCarneMin.SetFocus;
  end;
end;

procedure TfmEditarProductos.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  zqPrincipalEncabezado.Value:='Categoría '+zqPrincipalcodigo.AsString;
end;

procedure TfmEditarProductos.dbedCodigoExit(Sender: TObject);
begin
  if Trim(dbedCodigo.Text)='' then
  begin
     MessageDlg('Debe ingresar el código que identifica al producto', mtError, [mbOK], 0);
     if dbedCodigo.CanFocus then
        dbedCodigo.SetFocus;
  end;
end;

end.

