unit frmeditarmuestras;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, rxdbgrid, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase,
  ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup,
  zcontroladorgrilla, db, datmuestras, frmeditardetallemuestra;

type

  { TfmEditarMuestras }

  TfmEditarMuestras = class(TZEdicionBase)
    bbAgregar: TBitBtn;
    bbEditar: TBitBtn;
    bbEliminar: TBitBtn;
    dbgLista: TRxDBGrid;
    dblkEspecieVulgar: TDBLookupComboBox;
    dblkLance: TDBLookupComboBox;
    dblkEspecieCient: TDBLookupComboBox;
    dblkTipoMuestra: TDBLookupComboBox;
    dblkTipoTrampa: TDBLookupComboBox;
    dbmComentarios: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    paGrilla: TPanel;
    rgOrden: TRadioGroup;
    zcgLista: TZControladorGrilla;
    procedure dblkLanceExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgOrdenClick(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject;
      var ValidacionOK: boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarMuestras: TfmEditarMuestras;

implementation

{$R *.lfm}

{ TfmEditarMuestras }

procedure TfmEditarMuestras.rgOrdenClick(Sender: TObject);
begin
  dblkEspecieVulgar.Visible:=(rgOrden.ItemIndex=0);
  dblkEspecieCient.Visible:=(rgOrden.ItemIndex=1);
  dmMuestras.OrdenEspecies:=rgOrden.ItemIndex;
end;

procedure TfmEditarMuestras.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
  if (dmMuestras.zqMuestrasidlance.IsNull) and (dmMuestras.zqMuestrases_submuestra.AsBoolean=False) then
  begin
    MessageDlg('Debe seleccionar el lance correspondiente a la muestra', mtError, [mbOK], 0);
    if dblkLance.CanFocus then
       dblkLance.SetFocus;
    ValidacionOK:=False;
  end
  else if (dmMuestras.zqMuestrasidtipo_muestra.IsNull) then
  begin
    MessageDlg('Debe seleccionar el tipo de muestra', mtError, [mbOK], 0);
    if dblkTipoMuestra.CanFocus then
       dblkTipoMuestra.SetFocus;
    ValidacionOK:=False;
  end
  else if (dmMuestras.zqMuestrasidtipo_trampa.IsNull) and (dmMuestras.zqMuestrases_submuestra.AsBoolean=False) and (dmMuestras.zqMuestrases_relac_morf.AsBoolean=False) then
  begin
    MessageDlg('Debe seleccionar el tipo de trampa', mtError, [mbOK], 0);
    if dblkTipoTrampa.CanFocus then
       dblkTipoTrampa.SetFocus;
    ValidacionOK:=False;
  end
  else if (dmMuestras.zqMuestrasidespecie.IsNull) then
  begin
    MessageDlg('Debe seleccionar la especie a la cual corresponde la muestra', mtError, [mbOK], 0);
    if rgOrden.ItemIndex=1 then
    begin
      if dblkEspecieCient.CanFocus then
         dblkEspecieCient.SetFocus;
    end else
    begin
      if dblkEspecieVulgar.CanFocus then
         dblkEspecieVulgar.SetFocus;
    end;
    ValidacionOK:=False;
  end;
end;

procedure TfmEditarMuestras.FormShow(Sender: TObject);
begin
  dblkEspecieVulgar.Visible:=(rgOrden.ItemIndex=0);
  dblkEspecieCient.Visible:=(rgOrden.ItemIndex=1);
  dmMuestras.OrdenEspecies:=rgOrden.ItemIndex;
  zcgLista.HabilitarAcciones;
end;

procedure TfmEditarMuestras.dblkLanceExit(Sender: TObject);
begin
  if (dblkLance.Text='') and (dmMuestras.zqMuestrases_submuestra.AsBoolean=False) then
  begin
    MessageDlg('Debe seleccionar el lance correspondiente a la muestra', mtError, [mbOK], 0);
    if dblkLance.CanFocus then
       dblkLance.SetFocus;
  end;
end;

end.

