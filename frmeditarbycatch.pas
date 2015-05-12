unit frmeditarbycatch;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase, ZDataset,
  SQLQueryGroup, zcontroladoredicion, zdatasetgroup, db, datcaptura;

type

  { TfmEditarByCatch }

  TfmEditarByCatch = class(TZEdicionBase)
    dbedPeso: TDBEdit;
    dbedNumero: TDBEdit;
    dblkEspecieVulgar: TDBLookupComboBox;
    dblkEspecieCient: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    rgOrden: TRadioGroup;
    procedure rgOrdenClick(Sender: TObject);
    procedure zcePrincipalInitRecord(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarByCatch: TfmEditarByCatch;

implementation

{$R *.lfm}

{ TfmEditarByCatch }

procedure TfmEditarByCatch.zcePrincipalInitRecord(Sender: TObject);
begin
  dblkEspecieVulgar.Visible:=(rgOrden.ItemIndex=0);
  dblkEspecieCient.Visible:=(rgOrden.ItemIndex=1);
  if rgOrden.ItemIndex=0 then
     zcePrincipal.ControlInicial:=dblkEspecieVulgar
  else
    zcePrincipal.ControlInicial:=dblkEspecieCient;
end;

procedure TfmEditarByCatch.rgOrdenClick(Sender: TObject);
begin
  dblkEspecieVulgar.Visible:=(rgOrden.ItemIndex=0);
  dblkEspecieCient.Visible:=(rgOrden.ItemIndex=1);
  if rgOrden.ItemIndex=0 then
     zcePrincipal.ControlInicial:=dblkEspecieVulgar
  else
    zcePrincipal.ControlInicial:=dblkEspecieCient;
end;

end.

