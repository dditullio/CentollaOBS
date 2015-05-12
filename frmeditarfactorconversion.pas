unit frmeditarfactorconversion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase, ZDataset,
  SQLQueryGroup, zcontroladoredicion, zdatasetgroup, db, datGeneral;

type

  { TfmEditarFactorConversion }

  TfmEditarFactorConversion = class(TZEdicionBase)
    dbedPcCrudos: TDBEdit;
    dbedPgCocidos: TDBEdit;
    dbedPgCongelados: TDBEdit;
    dbedFCGCrudos: TDBEdit;
    dbedFCGCocidos: TDBEdit;
    dbedFCGCongelados: TDBEdit;
    dbedPgDescongelados: TDBEdit;
    dbedFCGDescongelados: TDBEdit;
    dbedPTCrudos: TDBEdit;
    dbedPTCocidos: TDBEdit;
    dbedPTCongelados: TDBEdit;
    dbedPcCocidos: TDBEdit;
    dbedFCCrudos: TDBEdit;
    dbedFCCocidos: TDBEdit;
    dbedFCCongelados: TDBEdit;
    dbedPTDescongelados: TDBEdit;
    dbedFCDescongelados: TDBEdit;
    dbedPcCongelados: TDBEdit;
    dbedFCCCrudos: TDBEdit;
    dbedFCCCocidos: TDBEdit;
    dbedFCCCongelados: TDBEdit;
    dbedPcDescongelados: TDBEdit;
    dbedFCCDescongelados: TDBEdit;
    dbedPgCrudos: TDBEdit;
    dbedPesoEntero: TDBEdit;
    dbedFCCaptura: TDBEdit;
    dbedFCFinal: TDBEdit;
    dblkLance: TDBLookupComboBox;
    dbmComentarios: TDBMemo;
    dsLances: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    zqPrincipaldsc_virada: TStringField;
    zqLances: TZQuery;
    zqLancescalada: TLongintField;
    zqLancescanastos_procesados: TLongintField;
    zqLancescant_trampas_caladas: TLongintField;
    zqLancescant_trampas_recuperadas: TLongintField;
    zqLancescluster_por_canasto: TLongintField;
    zqLancescod_estado_mar: TLongintField;
    zqLancescomentarios_calado: TStringField;
    zqLancescomentarios_virada: TStringField;
    zqLancesdireccion_viento: TLongintField;
    zqLancesdsc_virada: TStringField;
    zqLancesenviado: TSmallintField;
    zqLancesfecha_fin_calado: TDateField;
    zqLancesfecha_fin_virada: TDateField;
    zqLancesfecha_ini_calado: TDateField;
    zqLancesfecha_ini_virada: TDateField;
    zqLanceshora_fin_calado: TTimeField;
    zqLanceshora_fin_virada: TTimeField;
    zqLanceshora_ini_calado: TTimeField;
    zqLanceshora_ini_virada: TTimeField;
    zqLancesidcarnada: TLongintField;
    zqLancesidlance: TLongintField;
    zqLancesidlinea: TLongintField;
    zqLancesidmarea: TLongintField;
    zqLancesidtipo_trampa: TLongintField;
    zqLancesinvestigacion: TSmallintField;
    zqLanceskg_carnada: TFloatField;
    zqLanceslat_fin_calado: TFloatField;
    zqLanceslat_fin_virada: TFloatField;
    zqLanceslat_ini_calado: TFloatField;
    zqLanceslat_ini_virada: TFloatField;
    zqLanceslong_fin_calado: TFloatField;
    zqLanceslong_fin_virada: TFloatField;
    zqLanceslong_ini_calado: TFloatField;
    zqLanceslong_ini_virada: TFloatField;
    zqLancesnro_boya: TLongintField;
    zqLancesnro_lance: TLongintField;
    zqLancesnro_linea: TLongintField;
    zqLancesnudos_viento: TLongintField;
    zqLancesprofundidad_fin_calado: TLongintField;
    zqLancesprofundidad_fin_virada: TLongintField;
    zqLancesprofundidad_ini_calado: TLongintField;
    zqLancesprofundidad_ini_virada: TLongintField;
    zqLancesprospeccion: TSmallintField;
    zqLancesrumbo_calado: TLongintField;
    zqLancesvirada: TLongintField;
    zqPrincipalcomentarios: TStringField;
    zqPrincipalEncabezado: TStringField;
    zqPrincipalFCCCocidos: TFloatField;
    zqPrincipalFCCCongelados: TFloatField;
    zqPrincipalFCCCrudos: TFloatField;
    zqPrincipalFCCDescongelados: TFloatField;
    zqPrincipalFCCocidos: TFloatField;
    zqPrincipalFCCongelados: TFloatField;
    zqPrincipalFCCrudos: TFloatField;
    zqPrincipalFCDescongelados: TFloatField;
    zqPrincipalFCGCocidos: TFloatField;
    zqPrincipalFCGCongelados: TFloatField;
    zqPrincipalFCGCrudos: TFloatField;
    zqPrincipalFCGDescongelados: TFloatField;
    zqPrincipalidfactor_conversion: TLongintField;
    zqPrincipalidlance: TLongintField;
    zqPrincipalidmarea: TLongintField;
    zqPrincipalpc_cocido: TFloatField;
    zqPrincipalpc_congelado: TFloatField;
    zqPrincipalpc_crudo: TFloatField;
    zqPrincipalpc_descongelado: TFloatField;
    zqPrincipalpeso_entero: TFloatField;
    zqPrincipalpg_cocido: TFloatField;
    zqPrincipalpg_congelado: TFloatField;
    zqPrincipalpg_crudo: TFloatField;
    zqPrincipalpg_descongelado: TFloatField;
    zqPrincipalPTCocidos: TFloatField;
    zqPrincipalPTCongelados: TFloatField;
    zqPrincipalPTCrudos: TFloatField;
    zqPrincipalPTDescongelados: TFloatField;
    procedure zqLancesBeforeOpen(DataSet: TDataSet);
    procedure zqPrincipalCalcFields(DataSet: TDataSet);
    procedure zqPrincipalNewRecord(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarFactorConversion: TfmEditarFactorConversion;

implementation

{$R *.lfm}

{ TfmEditarFactorConversion }

procedure TfmEditarFactorConversion.zqLancesBeforeOpen(DataSet: TDataSet);
begin
  zqLances.ParamByName('idmarea').Value:=dmGeneral.IdMareaActiva;
end;

procedure TfmEditarFactorConversion.zqPrincipalCalcFields(DataSet: TDataSet);
begin
  if not zqPrincipalidlance.IsNull then
     zqPrincipalEncabezado.Value:='Lance '+zqPrincipaldsc_virada.Value;
  if not zqPrincipalpeso_entero.IsNull then
  begin
    if zqPrincipalpc_crudo.AsFloat>0 then
      zqPrincipalFCCCrudos.Value:=zqPrincipalpeso_entero.Value/zqPrincipalpc_crudo.Value;
    if zqPrincipalpc_cocido.AsFloat>0 then
      zqPrincipalFCCCocidos.Value:=zqPrincipalpeso_entero.Value/zqPrincipalpc_cocido.Value;
    if zqPrincipalpc_congelado.AsFloat>0 then
      zqPrincipalFCCCongelados.Value:=zqPrincipalpeso_entero.Value/zqPrincipalpc_congelado.Value;
    if zqPrincipalpc_descongelado.AsFloat>0 then
      zqPrincipalFCCDescongelados.Value:=zqPrincipalpeso_entero.Value/zqPrincipalpc_descongelado.Value;

    if zqPrincipalpg_crudo.AsFloat>0 then
      zqPrincipalFCGCrudos.Value:=zqPrincipalpeso_entero.Value/zqPrincipalpg_crudo.Value;
    if zqPrincipalpg_cocido.AsFloat>0 then
      zqPrincipalFCGCocidos.Value:=zqPrincipalpeso_entero.Value/zqPrincipalpg_cocido.Value;
    if zqPrincipalpg_congelado.AsFloat>0 then
      zqPrincipalFCGCongelados.Value:=zqPrincipalpeso_entero.Value/zqPrincipalpg_congelado.Value;
    if zqPrincipalpg_descongelado.AsFloat>0 then
      zqPrincipalFCGDescongelados.Value:=zqPrincipalpeso_entero.Value/zqPrincipalpg_descongelado.Value;

    if (zqPrincipalpc_crudo.AsFloat>0) and (zqPrincipalpg_crudo.AsFloat>0) then
      zqPrincipalPTCrudos.Value:=zqPrincipalpc_crudo.Value+zqPrincipalpg_crudo.Value;
    if (zqPrincipalpc_cocido.AsFloat>0) and (zqPrincipalpg_cocido.AsFloat>0) then
      zqPrincipalPTCocidos.Value:=zqPrincipalpc_cocido.Value+zqPrincipalpg_cocido.Value;
    if (zqPrincipalpc_congelado.AsFloat>0) and (zqPrincipalpg_congelado.AsFloat>0) then
      zqPrincipalPTCongelados.Value:=zqPrincipalpc_congelado.Value+zqPrincipalpg_congelado.Value;
    if (zqPrincipalpc_descongelado.AsFloat>0) and (zqPrincipalpg_descongelado.AsFloat>0) then
      zqPrincipalPTDescongelados.Value:=zqPrincipalpc_descongelado.Value+zqPrincipalpg_descongelado.Value;

    if (zqPrincipalpc_crudo.AsFloat>0) and (zqPrincipalpg_crudo.AsFloat>0) then
      zqPrincipalFCCrudos.Value:=zqPrincipalpeso_entero.Value/(zqPrincipalpc_crudo.Value+zqPrincipalpg_crudo.Value);
    if (zqPrincipalpc_cocido.AsFloat>0) and (zqPrincipalpg_cocido.AsFloat>0) then
      zqPrincipalFCCocidos.Value:=zqPrincipalpeso_entero.Value/(zqPrincipalpc_cocido.Value+zqPrincipalpg_cocido.Value);
    if (zqPrincipalpc_congelado.AsFloat>0) and (zqPrincipalpg_congelado.AsFloat>0) then
      zqPrincipalFCCongelados.Value:=zqPrincipalpeso_entero.Value/(zqPrincipalpc_congelado.Value+zqPrincipalpg_congelado.Value);
    if (zqPrincipalpc_descongelado.AsFloat>0) and (zqPrincipalpg_descongelado.AsFloat>0) then
      zqPrincipalFCDescongelados.Value:=zqPrincipalpeso_entero.Value/(zqPrincipalpc_descongelado.Value+zqPrincipalpg_descongelado.Value);
    //Lo siguiente es para que refresque los campos en pantalla
    zqPrincipal.DisableControls;
    zqPrincipal.EnableControls;
  end;
end;

procedure TfmEditarFactorConversion.zqPrincipalNewRecord(DataSet: TDataSet);
begin
  zqPrincipalidmarea.Value:=dmGeneral.IdMareaActiva;
  zqPrincipalidfactor_conversion.Value:=zcePrincipal.NuevoID('factores_conversion');
end;

end.

