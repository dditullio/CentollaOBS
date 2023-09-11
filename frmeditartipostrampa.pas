unit frmeditartipostrampa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase, ZDataset,
  SQLQueryGroup, zcontroladoredicion, zdatasetgroup, db, datGeneral;

type

  { TfmEditarTiposTrampa }

  TfmEditarTiposTrampa = class(TZEdicionBase)
    dbedCantAros1: TDBEdit;
    dbedCodigo: TDBEdit;
    dbedCantAros: TDBEdit;
    dblkFormato: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StringField1: TStringField;
    zqFormatosTrampacodigo: TStringField;
    zqFormatosTrampadescripcion: TStringField;
    zqFormatosTrampaidformato_trampa: TLongintField;
    zqPrincipalcant_aros: TLongintField;
    zqPrincipalcodigo: TStringField;
    zqPrincipaldiametro_aros: TLongintField;
    zqPrincipalidformato_trampa: TLongintField;
    zqPrincipalidtipo_trampa: TLongintField;
    zqFormatosTrampa: TZQuery;
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarTiposTrampa: TfmEditarTiposTrampa;

implementation

{$R *.lfm}

{ TfmEditarTiposTrampa }

procedure TfmEditarTiposTrampa.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidtipo_trampa.Value:=zcePrincipal.NuevoID('tipos_trampa');
end;

end.

