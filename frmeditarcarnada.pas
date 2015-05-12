unit frmeditarcarnada;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase, ZDataset,
  SQLQueryGroup, zcontroladoredicion, zdatasetgroup, db, datGeneral;

type

  { TfmEditarCarnada }

  TfmEditarCarnada = class(TZEdicionBase)
    dbedDescripcion: TDBEdit;
    Label1: TLabel;
    zqPrincipaldescripcion: TStringField;
    zqPrincipalidcarnada: TLongintField;
    zqPrincipalidmarea: TLongintField;
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarCarnada: TfmEditarCarnada;

implementation

{$R *.lfm}

{ TfmEditarCarnada }

procedure TfmEditarCarnada.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalidcarnada.Value:=zcePrincipal.NuevoID('carnadas');
end;

end.

