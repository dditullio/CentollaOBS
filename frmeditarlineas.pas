unit frmeditarlineas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase, datGeneral, ZDataset,
  SQLQueryGroup, zcontroladoredicion, zdatasetgroup, db;

type

  { TfmEditarLineas }

  TfmEditarLineas = class(TZEdicionBase)
    dbedBoya: TDBEdit;
    dbedDistTrampas: TDBEdit;
    dbedLinea: TDBEdit;
    dbedCantTrampas: TDBEdit;
    dblkTipoTrampa: TDBLookupComboBox;
    dbrgTipoLinea: TDBRadioGroup;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    StringField1: TStringField;
    zqPrincipalcant_trampas: TLongintField;
    zqPrincipaldistancia_entre_trampas: TLongintField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalidlinea: TLongintField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalidtipo_linea: TLongintField;
    zqPrincipalidtipo_trampa: TLongintField;
    zqPrincipalnro_boya: TLongintField;
    zqPrincipalnro_linea: TLongintField;
    zqTiposLinea: TZQuery;
    zqTiposTrampa: TZQuery;
    zqTiposTrampadsc_tipo: TStringField;
    zqTiposTrampaidtipo_trampa: TLongintField;
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarLineas: TfmEditarLineas;

implementation

{$R *.lfm}

{ TfmEditarLineas }

procedure TfmEditarLineas.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalidlinea.Value:=zcePrincipal.NuevoID('lineas');
  zqPrincipalidtipo_linea.Value:=1;
end;

procedure TfmEditarLineas.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  zqPrincipalEncabezado.Value:='Boya '+zqPrincipalnro_boya.AsString;
end;

end.

