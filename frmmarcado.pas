unit frmmarcado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, frmlistabase, db, ZDataset,
  zcontroladorgrilla, datGeneral;

type

  { TfmMarcado }

  TfmMarcado = class(TfmListaBase)
    dsMarcas: TDataSource;
    zqMarcas: TZQuery;
    zqMarcascod_marca: TStringField;
    zqMarcascod_marca_original: TStringField;
    zqMarcascomentarios: TStringField;
    zqMarcasevento: TStringField;
    zqMarcasfecha: TDateField;
    zqMarcashora: TTimeField;
    zqMarcasidcodigo_caparazon: TLongintField;
    zqMarcasidcodigo_huevos: TLongintField;
    zqMarcasidespecie: TLongintField;
    zqMarcasidevento_marca: TLongintField;
    zqMarcasidmarca: TLongintField;
    zqMarcasidmarea: TLongintField;
    zqMarcaslargo: TLongintField;
    zqMarcaslatitud: TFloatField;
    zqMarcasliberado: TSmallintField;
    zqMarcaslongitud: TFloatField;
    zqMarcasnombre_cientifico: TStringField;
    zqMarcasnombre_vulgar: TStringField;
    zqMarcaspeso: TFloatField;
    zqMarcasporcentaje_huevos: TLongintField;
    zqMarcasprofundidad: TLongintField;
    zqMarcasremarcado: TSmallintField;
    zqMarcassexo: TLongintField;
    zqMarcasvivo: TSmallintField;
    procedure zqMarcasBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmMarcado: TfmMarcado;

implementation

{$R *.lfm}

{ TfmMarcado }

procedure TfmMarcado.zqMarcasBeforeOpen(DataSet: TDataSet);
begin
  zqMarcas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

end.

