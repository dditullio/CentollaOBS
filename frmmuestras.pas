unit frmmuestras;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TADbSource, TASeries, TAStyles,
  TAMultiSeries, LSControls, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, DbCtrls, frmlistabase, db, ZDataset,
  zcontroladorgrilla, datGeneral;

type

  { TfmMuestras }

  TfmMuestras = class(TfmListaBase)
    Chart1: TChart;
    Chart1BarSeries1: TBarSeries;
    Chart1BarSeries2: TBarSeries;
    Chart1BarSeries3: TBarSeries;
    Chart2: TChart;
    Chart2BubbleSeries1: TBubbleSeries;
    Chart2LineSeries1: TLineSeries;
    chsTallasMarcas: TDbChartSource;
    chsTallasMachos: TDbChartSource;
    chsTallasHembras: TDbChartSource;
    dbcsLargoPeso: TDbChartSource;
    dsLargoPeso: TDataSource;
    dbtm_men_90: TDBText;
    dbth_men_90: TDBText;
    dbtm_90_110: TDBText;
    dbth_90_110: TDBText;
    dbtm_may_110: TDBText;
    dbth_may_110: TDBText;
    dsMarcasTallas: TDataSource;
    dsTallas: TDataSource;
    dsTallasMachos: TDataSource;
    dsMuestras: TDataSource;
    dsTallasHembras: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lsepEjempTalla: TLSExpandPanel;
    lsepEjempTallaButton: TImage;
    lsepEjempTallaPanel: TLSTopPanel;
    Panel1: TPanel;
    paEjempTalla: TPanel;
    paTitLP: TPanel;
    zqMarcasTallas: TZQuery;
    zqMuestras: TZQuery;
    zqMuestrascod_tipo_muestra: TStringField;
    zqMuestrascomentarios: TStringField;
    zqMuestrasfecha: TDateField;
    zqMuestrashembras_90_109: TLargeintField;
    zqMuestrashembras_mayor_109: TLargeintField;
    zqMuestrashembras_menor_90: TLargeintField;
    zqMuestrashora: TTimeField;
    zqMuestrasidespecie: TLongintField;
    zqMuestrasidlance: TLongintField;
    zqMuestrasidmarea: TLongintField;
    zqMuestrasidmuestra: TLongintField;
    zqMuestrasinvestigacion: TSmallintField;
    zqMuestrasmachos_90_109: TLargeintField;
    zqMuestrasmachos_mayor_109: TLargeintField;
    zqMuestrasmachos_menor_90: TLargeintField;
    zqMuestrasnombre_cientifico: TStringField;
    zqMuestrasnombre_vulgar: TStringField;
    zqMuestrasnro_lance: TLongintField;
    zqMuestrasorden_virada: TLargeintField;
    zqMuestrastipo_muestra: TStringField;
    zqTallas: TZQuery;
    zqTallasMachos: TZQuery;
    zqTallasHembras: TZQuery;
    zqLargoPeso: TZQuery;
    procedure lsepEjempTallaButtonClick(Sender: TObject);
    procedure zqMuestrasAfterOpen(DataSet: TDataSet);
    procedure zqMuestrasAfterScroll(DataSet: TDataSet);
    procedure zqMuestrasBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmMuestras: TfmMuestras;

implementation

{$R *.lfm}

{ TfmMuestras }

procedure TfmMuestras.zqMuestrasBeforeOpen(DataSet: TDataSet);
begin
  zqMuestras.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmMuestras.zqMuestrasAfterScroll(DataSet: TDataSet);
begin
  if not zcgLista.Exporting then
  begin
    zqTallas.Close;
    zqTallas.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
    zqTallas.Open;

    Chart2.Visible:=zqMuestrascod_tipo_muestra.AsString='S';
    paTitLP.Visible:=zqMuestrascod_tipo_muestra.AsString='S';

    zqLargoPeso.Close;
    zqLargoPeso.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
    zqLargoPeso.Open;
    Chart2.Refresh;

    //zqTallasMachos.Close;
    //zqTallasMachos.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
    //zqTallasMachos.Open;
    //
    //zqTallasHembras.Close;
    //zqTallasHembras.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
    //zqTallasHembras.Open;

    zqMarcasTallas.Close;
    zqMarcasTallas.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
    zqMarcasTallas.Open;

    Chart1.Refresh;
  end;
end;

procedure TfmMuestras.zqMuestrasAfterOpen(DataSet: TDataSet);
begin
  if not zcgLista.Exporting then
  begin
    //zqTallasMachos.Close;
    //zqTallasMachos.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
    //zqTallasMachos.Open;
    //zqTallasHembras.Close;
    //zqTallasHembras.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
    //zqTallasHembras.Open;

    zqTallas.Close;
    zqTallas.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
    zqTallas.Open;


    zqMarcasTallas.Close;
    zqMarcasTallas.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
    zqMarcasTallas.Open;
    Chart1.Refresh;

    zqTallas.Close;
    zqTallas.ParamByName('idmuestra').Value:=zqMuestrasidmuestra.Value;
    zqTallas.Open;
    Chart2.Refresh;
  end;
end;

procedure TfmMuestras.lsepEjempTallaButtonClick(Sender: TObject);
begin
  paEjempTalla.Visible:=lsepEjempTalla.Expand;
end;

end.

