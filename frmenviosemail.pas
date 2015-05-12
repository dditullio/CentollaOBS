unit frmenviosemail;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, frmlistabase, db, ZDataset,
  zcontroladorgrilla, datGeneral;

type

  { TFmEnviosEmail }

  TFmEnviosEmail = class(TfmListaBase)
    dsEnviosEmail: TDataSource;
    zqEnviosEmail: TZQuery;
    zqEnviosEmaildetalle: TBytesField;
    zqEnviosEmailfecha: TDateField;
    zqEnviosEmailfecha_fin_produccion: TDateField;
    zqEnviosEmailfecha_ini_produccion: TDateField;
    zqEnviosEmailidenvio_email: TLongintField;
    zqEnviosEmailidmarea: TLongintField;
    zqEnviosEmailnotas: TStringField;
    zqEnviosEmailnro_envio: TLongintField;
    procedure zqEnviosEmailBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FmEnviosEmail: TFmEnviosEmail;

implementation

{$R *.lfm}

{ TFmEnviosEmail }

procedure TFmEnviosEmail.zqEnviosEmailBeforeOpen(DataSet: TDataSet);
begin
  zqEnviosEmail.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

end.

