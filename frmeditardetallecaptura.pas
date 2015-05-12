unit frmeditardetallecaptura;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, ActnList, frmzedicionbase, datGeneral,
  ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup, DtDBEdit, db,
  datcaptura, LCLType;

type

  { TfmDetalleCaptura }

  TfmDetalleCaptura = class(TZEdicionBase)
    acA: TAction;
    alTrampaS: TAction;
    alTrampaR: TAction;
    alTrampaP: TAction;
    alTrampaN: TAction;
    alTrampaM: TAction;
    alTrampaA: TAction;
    alAtajos: TActionList;
    dbedComercial1: TDtDBEdit;
    dbedComercial2: TDtDBEdit;
    dbedComercial3: TDtDBEdit;
    dbedCantTrampas: TDBEdit;
    dbedNroTrampa: TDBEdit;
    dbedTotal1: TDtDBEdit;
    dbedTotal2: TDtDBEdit;
    dbedTotal3: TDtDBEdit;
    dblkEstadoTrampa: TDBLookupComboBox;
    dblkTipoTrampa: TDBLookupComboBox;
    dbtEspCient2: TDBText;
    dbtEspCient3: TDBText;
    dbtEspVulgar1: TDBText;
    dbtEspCient1: TDBText;
    dbtEspVulgar2: TDBText;
    dbtEspVulgar3: TDBText;
    DividerBevel2: TDividerBevel;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    paEspecie1: TPanel;
    paEspecie2: TPanel;
    paEspecie3: TPanel;
    procedure alTrampaAExecute(Sender: TObject);
    procedure alTrampaMExecute(Sender: TObject);
    procedure alTrampaNExecute(Sender: TObject);
    procedure alTrampaPExecute(Sender: TObject);
    procedure alTrampaRExecute(Sender: TObject);
    procedure alTrampaSExecute(Sender: TObject);
    procedure dblkTipoTrampaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zcePrincipalInitRecord(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject;
      var ValidacionOK: boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmDetalleCaptura: TfmDetalleCaptura;

implementation

{$R *.lfm}

{ TfmDetalleCaptura }

procedure TfmDetalleCaptura.FormShow(Sender: TObject);
begin
  dbtEspVulgar1.Visible:=(dmCapturas.OrdenEspecies=0);
  dbtEspCient1.Visible:=(dmCapturas.OrdenEspecies=1);
  dbtEspVulgar2.Visible:=(dmCapturas.OrdenEspecies=0);
  dbtEspCient2.Visible:=(dmCapturas.OrdenEspecies=1);
  dbtEspVulgar3.Visible:=(dmCapturas.OrdenEspecies=0);
  dbtEspCient3.Visible:=(dmCapturas.OrdenEspecies=1);
  paEspecie1.Enabled:=(dmCapturas.HayEspecie1);
  paEspecie2.Enabled:=(dmCapturas.HayEspecie2);
  paEspecie3.Enabled:=(dmCapturas.HayEspecie3);
  if dmCapturas.zqCapturaidtipo_trampa.IsNull then
  begin
    dblkTipoTrampa.TabStop:=True;
    if dblkTipoTrampa.CanFocus then
    begin
      ActiveControl:=dblkTipoTrampa;
      zcePrincipal.ControlInicial:=dblkTipoTrampa;
    end
  end else
  begin
    dblkTipoTrampa.TabStop:=False;
    //if paEspecie1.Enabled and dbedTotal1.CanFocus then
    //begin
    //  ActiveControl:=dbedTotal1;
    //  zcePrincipal.ControlInicial:=dbedTotal1;
    //end;
    if dbedCantTrampas.CanFocus then
    begin
      ActiveControl:=dbedCantTrampas;
      zcePrincipal.ControlInicial:=dbedCantTrampas;
    end;
  end;
end;

procedure TfmDetalleCaptura.zcePrincipalInitRecord(Sender: TObject);
begin
  paEspecie1.Enabled:=(dmCapturas.HayEspecie1);
  paEspecie2.Enabled:=(dmCapturas.HayEspecie2);
  paEspecie3.Enabled:=(dmCapturas.HayEspecie3);
  dbedComercial1.Enabled:=(dmCapturas.zqCapturaComercEsp1.AsBoolean);
  dbedComercial2.Enabled:=(dmCapturas.zqCapturaComercEsp2.AsBoolean);
  dbedComercial3.Enabled:=(dmCapturas.zqCapturaComercEsp3.AsBoolean);
end;

procedure TfmDetalleCaptura.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
var
  dsc_especie: array[0..1] of string;
begin
  if (dmCapturas.zqCapturaComercEsp1.AsBoolean) and (dmCapturas.zqDetCapturacomerciales_especie1.IsNull)
       and ((dmCapturas.zqDetCapturaidestado_trampa.IsNull) or ((not dmCapturas.zqDetCapturaidestado_trampa.IsNull) and (dmCapturas.zqDetCapturarequiere_nro_ejemplares.AsBoolean))) then
  begin
    ValidacionOK:=False;
    dsc_especie[0]:=dmCapturas.zqCapturaespecie_vulg1.AsString;
    dsc_especie[1]:=dmCapturas.zqCapturaespecie1.AsString;
    MessageDlg('Debe indicar el número de ejemplares comerciales de la especie '+dsc_especie[dmCapturas.OrdenEspecies], mtError, [mbOK], 0);
    if dbedComercial1.CanFocus then
       dbedComercial1.SetFocus;
  end
  else if not dmCapturas.zqDetCapturacomerciales_especie1.IsNull
       and (dmCapturas.zqDetCapturatotal_especie1.AsInteger < dmCapturas.zqDetCapturacomerciales_especie1.AsInteger) then
  begin
    ValidacionOK:=False;
    MessageDlg('El número de ejemplares totales debe ser mayor o igual al de ejemplares comerciales', mtError, [mbOK], 0);
    if dbedTotal1.CanFocus then
       dbedTotal1.SetFocus;
  end
  else if (dmCapturas.zqCapturaComercEsp2.AsBoolean) and (dmCapturas.zqDetCapturacomerciales_especie2.IsNull)
       and ((dmCapturas.zqDetCapturaidestado_trampa.IsNull) or ((not dmCapturas.zqDetCapturaidestado_trampa.IsNull) and (dmCapturas.zqDetCapturarequiere_nro_ejemplares.AsBoolean))) then
  begin
    ValidacionOK:=False;
    dsc_especie[0]:=dmCapturas.zqCapturaespecie_vulg2.AsString;
    dsc_especie[1]:=dmCapturas.zqCapturaespecie2.AsString;
    MessageDlg('Debe indicar el número de ejemplares comerciales de la especie '+dsc_especie[dmCapturas.OrdenEspecies], mtError, [mbOK], 0);
    if dbedComercial2.CanFocus then
       dbedComercial2.SetFocus;
  end
  else if not dmCapturas.zqDetCapturacomerciales_especie2.IsNull
       and (dmCapturas.zqDetCapturatotal_especie2.AsInteger < dmCapturas.zqDetCapturacomerciales_especie2.AsInteger) then
  begin
    ValidacionOK:=False;
    MessageDlg('El número de ejemplares totales debe ser mayor o igual al de ejemplares comerciales', mtError, [mbOK], 0);
    if dbedTotal2.CanFocus then
       dbedTotal2.SetFocus;
  end
  else if (dmCapturas.zqCapturaComercEsp3.AsBoolean) and (dmCapturas.zqDetCapturacomerciales_especie3.IsNull)
       and ((dmCapturas.zqDetCapturaidestado_trampa.IsNull) or ((not dmCapturas.zqDetCapturaidestado_trampa.IsNull) and (dmCapturas.zqDetCapturarequiere_nro_ejemplares.AsBoolean))) then
  begin
    ValidacionOK:=False;
    dsc_especie[0]:=dmCapturas.zqCapturaespecie_vulg3.AsString;
    dsc_especie[1]:=dmCapturas.zqCapturaespecie3.AsString;
    MessageDlg('Debe indicar el número de ejemplares comerciales de la especie '+dsc_especie[dmCapturas.OrdenEspecies], mtError, [mbOK], 0);
    if dbedComercial3.CanFocus then
       dbedComercial3.SetFocus;
  end
  else if not dmCapturas.zqDetCapturacomerciales_especie3.IsNull
       and (dmCapturas.zqDetCapturatotal_especie3.AsInteger < dmCapturas.zqDetCapturacomerciales_especie3.AsInteger) then
  begin
    ValidacionOK:=False;
    MessageDlg('El número de ejemplares totales debe ser mayor o igual al de ejemplares comerciales', mtError, [mbOK], 0);
    if dbedTotal3.CanFocus then
       dbedTotal3.SetFocus;
  end
end;

procedure TfmDetalleCaptura.dblkTipoTrampaExit(Sender: TObject);
begin
  if dblkTipoTrampa.Text='' then
  begin
    MessageDlg('Debe indicar el tipo de trampa', mtError, [mbOK], 0);
    if dblkTipoTrampa.CanFocus then
       dblkTipoTrampa.SetFocus;
  end;
end;

procedure TfmDetalleCaptura.alTrampaAExecute(Sender: TObject);
begin
  if not (dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit]) then
    dmCapturas.zqDetCaptura.Edit;
  if dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit] then
  begin
    dmCapturas.zqDetCapturaidestado_trampa.Value:=dmCapturas.zqEstadosTrampa.Lookup('codigo','A','idestado_trampa');
  end;
end;

procedure TfmDetalleCaptura.alTrampaMExecute(Sender: TObject);
begin
  if not (dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit]) then
    dmCapturas.zqDetCaptura.Edit;
  if dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit] then
  begin
    dmCapturas.zqDetCapturaidestado_trampa.Value:=dmCapturas.zqEstadosTrampa.Lookup('codigo','M','idestado_trampa');
//    zcePrincipal.Guardar;
  end;
end;

procedure TfmDetalleCaptura.alTrampaNExecute(Sender: TObject);
begin
  if not (dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit]) then
    dmCapturas.zqDetCaptura.Edit;
  if dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit] then
  begin
    dmCapturas.zqDetCapturaidestado_trampa.Value:=dmCapturas.zqEstadosTrampa.Lookup('codigo','N','idestado_trampa');
  end;
end;

procedure TfmDetalleCaptura.alTrampaPExecute(Sender: TObject);
begin
  if not (dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit]) then
    dmCapturas.zqDetCaptura.Edit;
  if dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit] then
  begin
    dmCapturas.zqDetCapturaidestado_trampa.Value:=dmCapturas.zqEstadosTrampa.Lookup('codigo','P','idestado_trampa');
  end;
end;

procedure TfmDetalleCaptura.alTrampaRExecute(Sender: TObject);
begin
  if not (dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit]) then
    dmCapturas.zqDetCaptura.Edit;
  if dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit] then
  begin
    dmCapturas.zqDetCapturaidestado_trampa.Value:=dmCapturas.zqEstadosTrampa.Lookup('codigo','R','idestado_trampa');
  end;
end;

procedure TfmDetalleCaptura.alTrampaSExecute(Sender: TObject);
begin
  if not (dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit]) then
    dmCapturas.zqDetCaptura.Edit;
  if dmCapturas.zqDetCaptura.State in [dsInsert, dsEdit] then
  begin
    dmCapturas.zqDetCapturaidestado_trampa.Value:=dmCapturas.zqEstadosTrampa.Lookup('codigo','S','idestado_trampa');
  end;
end;

end.

