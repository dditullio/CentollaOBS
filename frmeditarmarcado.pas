unit frmeditarmarcado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase,
  datGeneral, ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup,
  DtDBTimeEdit, dtdbcoordedit, db;

type

  { TfmEditarMarcado }

  TfmEditarMarcado = class(TZEdicionBase)
    BytesField1: TBytesField;
    BytesField2: TBytesField;
    dbcbProcesado: TDBCheckBox;
    dbcbVivo: TDBCheckBox;
    dbcbRemarcado: TDBCheckBox;
    dbcbLiberado: TDBCheckBox;
    dbdtFecha: TDBDateTimePicker;
    dbedCodMarca: TDBEdit;
    dbedCodMarcaOrig: TDBEdit;
    dbedHora: TDtDBTimeEdit;
    dbedLargoCap: TDBEdit;
    dbedLatitud: TDtDBCoordEdit;
    dbedLongitud: TDtDBCoordEdit;
    dbedPeso: TDBEdit;
    dbedPorcentHuevos: TDBEdit;
    dbedProfundidad: TDBEdit;
    dbedSexo: TDBEdit;
    dblkEspecieVulgar: TDBLookupComboBox;
    dblkEspecieCientifico: TDBLookupComboBox;
    dblkEstadoCap: TDBLookupComboBox;
    dblkEvento: TDBLookupComboBox;
    dblkHuevos: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    dbEjemplar: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label25: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    paFechaHora: TPanel;
    rgOrden: TRadioGroup;
    zqPrincipales_recaptura: TSmallintField;
    zqPrincipales_marcado: TSmallintField;
    zqPrincipalevento: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    zqCodigosCaparazon: TZQuery;
    zqEventos: TZQuery;
    zqCodigosCaparazoncodigo: TLongintField;
    zqCodigosCaparazoncod_desc: TBytesField;
    zqCodigosCaparazondescripcion: TStringField;
    zqCodigosCaparazonidcodigo_caparazon: TLongintField;
    zqCodigosHuevos: TZQuery;
    zqCodigosHuevoscodigo: TLongintField;
    zqCodigosHuevoscod_desc: TBytesField;
    zqCodigosHuevosdescripcion: TStringField;
    zqCodigosHuevosidcodigo_huevos: TLongintField;
    zqEspeciesCient: TZQuery;
    zqEspeciesVulg: TZQuery;
    zqEspeciesVulgcomercial: TSmallintField;
    zqEspeciesVulgfrecuente: TLongintField;
    zqEspeciesCientcodigo_inidep: TStringField;
    zqEspeciescodigo_inidep1: TStringField;
    zqEspeciesCientcodigo_rapido: TStringField;
    zqEspeciescodigo_rapido1: TStringField;
    zqEspeciesCientcomercial: TSmallintField;
    zqEspeciesCientfrecuente: TLongintField;
    zqEspeciesCientidespecie: TLongintField;
    zqEspeciesidespecie1: TLongintField;
    zqEspeciesCientnombre_cientifico: TStringField;
    zqEspeciesnombre_cientifico1: TStringField;
    zqEspeciesCientnombre_vulgar: TStringField;
    zqEspeciesnombre_vulgar1: TStringField;
    zqEventoses_marcado: TSmallintField;
    zqEventoses_recaptura: TSmallintField;
    zqEventosidevento_marca: TLongintField;
    zqEventosnombre: TStringField;
    zqPrincipalcod_marca: TStringField;
    zqPrincipalcod_marca_original: TStringField;
    zqPrincipalcomentarios: TStringField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalfecha: TDateField;
    zqPrincipalhora: TTimeField;
    zqPrincipalidcodigo_caparazon: TLongintField;
    zqPrincipalidcodigo_huevos: TLongintField;
    zqPrincipalidespecie: TLongintField;
    zqPrincipalidevento_marca: TLongintField;
    zqPrincipalidmarca: TLongintField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipallargo: TLongintField;
    zqPrincipallatitud: TFloatField;
    zqPrincipalliberado: TSmallintField;
    zqPrincipallongitud: TFloatField;
    zqPrincipalpeso: TFloatField;
    zqPrincipalporcentaje_huevos: TFloatField;
    zqPrincipalprocesado: TSmallintField;
    zqPrincipalprofundidad: TLongintField;
    zqPrincipalremarcado: TSmallintField;
    zqPrincipalsexo: TLongintField;
    zqPrincipalvivo: TSmallintField;
    procedure dbdtFechaEnter(Sender: TObject);
    procedure dbedSexoChange(Sender: TObject);
    procedure dblkEventoChange(Sender: TObject);
    procedure dblkEventoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgOrdenClick(Sender: TObject);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalidevento_marcaChange(Sender: TField);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
  private
    { private declarations }
    procedure HabilitarCampos;
  public
    { public declarations }
  end;

var
  fmEditarMarcado: TfmEditarMarcado;

implementation

{$R *.lfm}

{ TfmEditarMarcado }

procedure TfmEditarMarcado.dbdtFechaEnter(Sender: TObject);
begin
  //Hago esto para que se seleccione el día. Si no, el cursor queda
  // en la última posición
  (Sender as TDBDateTimePicker).SelectTime;
  (Sender as TDBDateTimePicker).SelectDate;
end;

procedure TfmEditarMarcado.dbedSexoChange(Sender: TObject);
begin
  HabilitarCampos;
end;

procedure TfmEditarMarcado.dblkEventoChange(Sender: TObject);
begin
  HabilitarCampos;
end;

procedure TfmEditarMarcado.dblkEventoExit(Sender: TObject);
begin
  HabilitarCampos;
end;

procedure TfmEditarMarcado.FormShow(Sender: TObject);
begin
  dblkEspecieVulgar.Visible:=(rgOrden.ItemIndex=0);
  dblkEspecieCientifico.Visible:=(rgOrden.ItemIndex=1);
  HabilitarCampos;
end;

procedure TfmEditarMarcado.rgOrdenClick(Sender: TObject);
begin
  dblkEspecieVulgar.Visible:=(rgOrden.ItemIndex=0);
  dblkEspecieCientifico.Visible:=(rgOrden.ItemIndex=1);
end;

procedure TfmEditarMarcado.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  zqPrincipalEncabezado.Value:=zqPrincipalevento.AsString+' '+zqPrincipalcod_marca.AsString;
  zqPrincipal.DisableControls;
  zqPrincipal.EnableControls;
end;

procedure TfmEditarMarcado.zqPrincipalidevento_marcaChange(Sender: TField);
begin
  HabilitarCampos;
end;

procedure TfmEditarMarcado.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarca.Value:=zcePrincipal.NuevoID('marcas');
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalfecha.Value:=Date;
  zqPrincipalremarcado.Value:=0;
  zqPrincipalvivo.Value:=1;
  zqPrincipalliberado.Value:=1;
  zqPrincipalprocesado.Value:=0;
end;

procedure TfmEditarMarcado.HabilitarCampos;
begin
  dbedCodMarcaOrig.Enabled:=(zqPrincipales_marcado.AsBoolean);
  dbcbRemarcado.Enabled:=(zqPrincipales_recaptura.AsBoolean);
  dblkHuevos.Enabled:=dbedSexo.Text='2';
  dbedPorcentHuevos.Enabled:=dbedSexo.Text='2';
  if (dbedSexo.Text<>'2')
     and (not zqPrincipalidcodigo_huevos.IsNull)
     and (zqPrincipal.State in [dsInsert, dsEdit]) then
  begin
    zqPrincipalidcodigo_huevos.AsVariant:=Null;
  end;
  if (dbedSexo.Text<>'2')
     and (not zqPrincipalporcentaje_huevos.IsNull)
     and (zqPrincipal.State in [dsInsert, dsEdit]) then
  begin
    zqPrincipalporcentaje_huevos.AsVariant:=Null;
  end;
end;

end.

