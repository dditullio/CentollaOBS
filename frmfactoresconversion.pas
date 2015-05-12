unit frmfactoresconversion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, rxdbgrid, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ActnList, StdCtrls, frmlistabase, db, ZDataset,
  zcontroladorgrilla, datGeneral, frmeditarfactorconversion;

type

  { TfmFactoresConversion }

  TfmFactoresConversion = class(TfmListaBase)
    dsFactConv: TDataSource;
    zqFactConv: TZQuery;
    zqFactConvcomentarios: TStringField;
    zqFactConvfactor_captura: TFloatField;
    zqFactConvfactor_final: TFloatField;
    zqFactConvfecha: TDateField;
    zqFactConvhora: TTimeField;
    zqFactConvidfactor_conversion: TLongintField;
    zqFactConvidlance: TLongintField;
    zqFactConvidmarea: TLongintField;
    zqFactConvnro_lance: TLongintField;
    zqFactConvpc_cocido: TFloatField;
    zqFactConvpc_congelado: TFloatField;
    zqFactConvpc_crudo: TFloatField;
    zqFactConvpc_descongelado: TFloatField;
    zqFactConvpeso_cocido: TFloatField;
    zqFactConvpeso_congelado: TFloatField;
    zqFactConvpeso_crudo: TFloatField;
    zqFactConvpeso_descongelado: TFloatField;
    zqFactConvpeso_entero: TFloatField;
    zqFactConvpg_cocido: TFloatField;
    zqFactConvpg_congelado: TFloatField;
    zqFactConvpg_crudo: TFloatField;
    zqFactConvpg_descongelado: TFloatField;
    procedure zqFactConvBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmFactoresConversion: TfmFactoresConversion;

implementation

{$R *.lfm}

{ TfmFactoresConversion }

procedure TfmFactoresConversion.zqFactConvBeforeOpen(DataSet: TDataSet);
begin
  zqFactConv.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

end.

