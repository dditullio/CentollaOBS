unit frmcapturas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, rxdbgrid, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, ActnList, StdCtrls, DbCtrls,
  frmlistabase, db, ZDataset, zcontroladorgrilla, datGeneral;

type

  { TfmCapturas }

  TfmCapturas = class(TfmListaBase)
    DBText107: TDBText;
    dsResumen: TDataSource;
    DBText10: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    dsCapturas: TDataSource;
    dtFecha: TDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    Label114: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    paDatos: TPanel;
    Panel1: TPanel;
    zqCapturas: TZQuery;
    zqCapturascomentarios: TStringField;
    zqCapturasfecha: TDateField;
    zqCapturashora: TTimeField;
    zqCapturasidcaptura: TLongintField;
    zqCapturasidlance: TLongintField;
    zqCapturasidmarea: TLongintField;
    zqCapturasnro_boya: TLongintField;
    zqCapturasnro_lance: TLongintField;
    zqCapturasnro_linea: TLongintField;
    zqCapturasorden_virada: TLargeintField;
    zqResumen: TZQuery;
    zqResumenarania_total: TLargeintField;
    zqResumencanastos_procesados: TLongintField;
    zqResumencant_con_aro: TLargeintField;
    zqResumencant_sin_aro: TLargeintField;
    zqResumencentolla_comercial: TLargeintField;
    zqResumencentolla_total: TLargeintField;
    zqResumencluster_canasto_calc: TLargeintField;
    zqResumencluster_por_canasto: TLongintField;
    zqResumencomentarios: TStringField;
    zqResumenidcaptura: TLongintField;
    zqResumenidespecie1: TLongintField;
    zqResumenidespecie2: TLongintField;
    zqResumenidespecie3: TLongintField;
    zqResumenidlance: TLongintField;
    zqResumenporcent_trampas_obs: TFloatField;
    zqResumentrampas_con_fallo: TLargeintField;
    zqResumentrampas_recup: TLargeintField;
    zqResumentrampas_sin_puerta: TLargeintField;
    procedure dtFechaChange(Sender: TObject);
    procedure dtFechaCheckBoxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqCapturasAfterOpen(DataSet: TDataSet);
    procedure zqCapturasAfterScroll(DataSet: TDataSet);
    procedure zqCapturasBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmCapturas: TfmCapturas;

implementation

{$R *.lfm}

{ TfmCapturas }

procedure TfmCapturas.dtFechaCheckBoxChange(Sender: TObject);
begin
  if dtFecha.Checked then
     dtFecha.Date:=Date
  else
    dtFecha.Date:=NullDate;
  zcgLista.Buscar;
end;

procedure TfmCapturas.FormShow(Sender: TObject);
begin
  dtFecha.Date:=Date;
  inherited;
end;

procedure TfmCapturas.zqCapturasAfterOpen(DataSet: TDataSet);
begin
  zqResumen.Close;
  if (zqCapturas.RecordCount>0) and (not zcgLista.Exporting) then
  begin
//    zqResumen.ParamByName('idcaptura').Value:=zqCapturasidcaptura.Value;
    zqResumen.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
    zqResumen.Open;
  end;
end;

procedure TfmCapturas.zqCapturasAfterScroll(DataSet: TDataSet);
begin
//  zqResumen.Close;
  if (zqCapturas.RecordCount>0) and (not zcgLista.Exporting) then
  begin
    //zqResumen.ParamByName('idcaptura').Value:=zqCapturasidcaptura.Value;
    zqResumen.Filtered:=False;
    zqResumen.Filter:='idcaptura='+zqCapturasidcaptura.AsString;
    zqResumen.Filtered:=True;
//    zqResumen.Open;
  end;
end;

procedure TfmCapturas.zqCapturasBeforeOpen(DataSet: TDataSet);
begin
  zqCapturas.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
  if dtFecha.Checked then
     zqCapturas.ParamByName('fecha').AsDateTime:=dtFecha.Date
  else
    zqCapturas.ParamByName('fecha').AsString:='';
end;

procedure TfmCapturas.dtFechaChange(Sender: TObject);
begin
  zcgLista.Buscar;
end;

end.

