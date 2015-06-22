unit frmeditardetallemuestra;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DbCtrls, Buttons, ComCtrls, Arrow, frmzedicionbase,
  ZDataset, SQLQueryGroup, zcontroladoredicion, zdatasetgroup, db, datmuestras,
  LSConfig;

type

  { TfmEditarDetalleMuestra }

  TfmEditarDetalleMuestra = class(TZEdicionBase)
      Arrow1: TArrow;
      Arrow2: TArrow;
    dbedNroEjemplar: TDBEdit;
    dbedLargoCap: TDBEdit;
    dbedSexo: TDBEdit;
    dbedPorcentHuevos: TDBEdit;
    dbedPeso: TDBEdit;
    dbed_p1de: TDBEdit;
    dbed_p1ie: TDBEdit;
    dbed_p1im: TDBEdit;
    dbed_p2de: TDBEdit;
    dbed_p2ie: TDBEdit;
    dbed_p2im: TDBEdit;
    dbed_p3de: TDBEdit;
    dbed_p1dm: TDBEdit;
    dbed_p2dm: TDBEdit;
    dbed_p3dm: TDBEdit;
    dbed_p3ie: TDBEdit;
    dbed_p3im: TDBEdit;
    dblkEstadoCap: TDBLookupComboBox;
    dblkHuevos: TDBLookupComboBox;
    gbDerecha: TGroupBox;
    gbDerecha1: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    laLargoCap: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    laSexo: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pcPrincipal: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    tsRelacMorf: TTabSheet;
    tsGeneral: TTabSheet;
    procedure ArrowSexoCapClick(Sender: TObject);
    procedure dbedLargoCapExit(Sender: TObject);
    procedure dbedPorcentHuevosExit(Sender: TObject);
    procedure dbedSexoChange(Sender: TObject);
    procedure dbedSexoExit(Sender: TObject);
    procedure dblkHuevosChange(Sender: TObject);
    procedure dblkHuevosExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure pcPrincipalChanging(Sender: TObject; var AllowChange: Boolean);
    procedure zcePrincipalInitRecord(Sender: TObject);
    procedure zcePrincipalValidateForm(Sender: TObject;
      var ValidacionOK: boolean);
  private
    { private declarations }
    procedure HabilitarCampos;
  public
    { public declarations }
  end;

var
  fmEditarDetalleMuestra: TfmEditarDetalleMuestra;

implementation

{$R *.lfm}

{ TfmEditarDetalleMuestra }

procedure TfmEditarDetalleMuestra.zcePrincipalInitRecord(Sender: TObject);
begin
  HabilitarCampos;
end;

procedure TfmEditarDetalleMuestra.zcePrincipalValidateForm(Sender: TObject;
  var ValidacionOK: boolean);
begin
  if dmMuestras.zqDetalleMuestraslargo.IsNull then
  begin
    ValidacionOK:=False;
    MessageDlg('Debe indicar el largo de caparazón', mtError, [mbOK], 0);
    if dbedLargoCap.CanFocus then
       dbedLargoCap.SetFocus;
  end
  else if dmMuestras.zqDetalleMuestrassexo.IsNull then
  begin
    ValidacionOK:=False;
    MessageDlg('Debe indicar el sexo del ejemplar', mtError, [mbOK], 0);
    if dbedSexo.CanFocus then
       dbedSexo.SetFocus;
  end
  else if dmMuestras.zqDetalleMuestrasidcodigo_caparazon.IsNull then
  begin
    ValidacionOK:=False;
    MessageDlg('Debe indicar el estado del caparazón', mtError, [mbOK], 0);
    if dblkEstadoCap.CanFocus then
       dblkEstadoCap.SetFocus;
  end
  else if dmMuestras.zqDetalleMuestrassexo.AsInteger=1 then
  begin
    if not dmMuestras.zqDetalleMuestrasidcodigo_huevos.IsNull then
    begin
      ValidacionOK:=False;
      MessageDlg('No puede indicar estado de huevos en un ejemplar macho', mtError, [mbOK], 0);
      if dblkHuevos.CanFocus then
         dblkHuevos.SetFocus;
    end
    else if not dmMuestras.zqDetalleMuestrasporcentaje_huevos.IsNull then
    begin
      ValidacionOK:=False;
      MessageDlg('No puede indicar porcentaje de huevos en un ejemplar macho', mtError, [mbOK], 0);
      if dbedPorcentHuevos.CanFocus then
         dbedPorcentHuevos.SetFocus;
    end;
  end else if dmMuestras.zqDetalleMuestrassexo.AsInteger=2 then
  begin
    if dmMuestras.zqDetalleMuestrasidcodigo_huevos.IsNull then
    begin
      ValidacionOK:=False;
      MessageDlg('Para todos los ejemplares hembra debe indicar estado de huevos', mtError, [mbOK], 0);
      if dblkHuevos.CanFocus then
         dblkHuevos.SetFocus;
    end
    else if (dmMuestras.zqDetalleMuestrastiene_huevos.AsInteger=1) and (dmMuestras.zqDetalleMuestrasporcentaje_huevos.IsNull) then
    begin
      ValidacionOK:=False;
      MessageDlg('Debe indicar porcentaje de huevos', mtError, [mbOK], 0);
      if dbedPorcentHuevos.CanFocus then
         dbedPorcentHuevos.SetFocus;
    end;
  end
  else if (dbedSexo.Text<>'1') and (dbedSexo.Text<>'2') then
  begin
    ValidacionOK:=False;
    MessageDlg('Debe indicar el sexo del ejemplar (1=Macho, 2=Hembra)', mtError, [mbOK], 0);
    if dbedSexo.CanFocus then
       dbedSexo.SetFocus;
  end;
  pcPrincipal.ActivePage:=tsGeneral;
end;

procedure TfmEditarDetalleMuestra.dbedSexoChange(Sender: TObject);
begin
  HabilitarCampos;
end;

procedure TfmEditarDetalleMuestra.dbedLargoCapExit(Sender: TObject);
begin
  if (dbedLargoCap.Text='') then
  begin
    MessageDlg('Debe indicar el largo de caparazón', mtError, [mbOK], 0);
    if dbedLargoCap.CanFocus then
       dbedLargoCap.SetFocus;
  end
  else if (StrToInt(dbedLargoCap.Text)<25) or (StrToInt(dbedLargoCap.Text)>180) then
  begin
     if MessageDlg('Error','El valor "'+dbedLargoCap.Text+'" no parece correcto para el largo de caparazón. ¿Está seguro de que desea ingresar este valor?', mtError, [mbYes, mbNo], 0, mbNo) = mrNo then
     begin
       if dbedLargoCap.CanFocus then
          dbedLargoCap.SetFocus;
     end;
  end;
end;

procedure TfmEditarDetalleMuestra.ArrowSexoCapClick(Sender: TObject);
var
  left_sexo, left_largo_cap: integer;
  tab_order_sexo, tab_order_largo_cap: integer;
  invertir_pos: Boolean;
begin
    left_sexo:=laSexo.Left;
    left_largo_cap:=laLargoCap.Left;
    tab_order_sexo:=dbedSexo.TabOrder;
    tab_order_largo_cap:=dbedLargoCap.TabOrder;

    //Intercambio las posiciones
    laSexo.Left:=left_largo_cap;
    dbedSexo.Left:=left_largo_cap;
    laLargoCap.Left:=left_sexo;
    dbedLargoCap.Left:=left_sexo;

    //Intercambio también el TabOrder
    dbedSexo.TabOrder:=tab_order_largo_cap;
    dbedLargoCap.TabOrder:=tab_order_sexo;

    //Veo si las posiciones están invertidas y lo guardo en la configuración para
    //poder usar la misma configutación la próxima vez
    invertir_pos:=(laSexo.Left>laLargoCap.Left);
    LSSaveConfig(['invertir_campos_sexo_largo'],[invertir_pos]);

    //Pongo el control inicial en el primerosegún el TabOrder
    if dbedSexo.TabOrder<dbedLargoCap.TabOrder then
       zcePrincipal.ControlInicial:=dbedSexo
    else
      zcePrincipal.ControlInicial:=dbedLargoCap;
end;

procedure TfmEditarDetalleMuestra.dbedPorcentHuevosExit(Sender: TObject);
begin
  if (not dmMuestras.zqDetalleMuestrasporcentaje_huevos.IsNull) and ((dmMuestras.zqDetalleMuestrasporcentaje_huevos.AsFloat<0) or (dmMuestras.zqDetalleMuestrasporcentaje_huevos.AsFloat>100)) then
  begin
    MessageDlg('EL porcentaje de huevos debe estar comprendido entre 0 y 100', mtError, [mbOK], 0);
    if dbedPorcentHuevos.CanFocus then
       dbedPorcentHuevos.SetFocus;
  end;
  if dmMuestras.zqDetalleMuestras.State in [dsInsert, dsEdit] then
  begin
    if (dmMuestras.zqDetalleMuestrasporcentaje_huevos.AsString<>'') and (round(dmMuestras.zqDetalleMuestrasporcentaje_huevos.Value/5)*5<>dmMuestras.zqDetalleMuestrasporcentaje_huevos.Value) then
    begin
      dmMuestras.zqDetalleMuestrasporcentaje_huevos.Value:=round(dmMuestras.zqDetalleMuestrasporcentaje_huevos.Value/5)*5;
    end;
  end;
end;

procedure TfmEditarDetalleMuestra.dbedSexoExit(Sender: TObject);
begin
  if (dbedSexo.Text<>'1') and (dbedSexo.Text<>'2') then
  begin
    MessageDlg('Debe indicar el sexo del ejemplar (1=Macho, 2=Hembra)', mtError, [mbOK], 0);
    if dbedSexo.CanFocus then
       dbedSexo.SetFocus;
  end;
end;

procedure TfmEditarDetalleMuestra.dblkHuevosChange(Sender: TObject);
begin
  HabilitarCampos;
end;

procedure TfmEditarDetalleMuestra.dblkHuevosExit(Sender: TObject);
begin
  HabilitarCampos;
end;

procedure TfmEditarDetalleMuestra.FormShow(Sender: TObject);
var
  left_sexo, left_largo_cap: integer;
  tab_order_sexo, tab_order_largo_cap: integer;
  invertir_pos: string;
begin
  pcPrincipal.ActivePage:=tsGeneral;

  LSLoadConfig(['invertir_campos_sexo_largo'],[invertir_pos],[@invertir_pos]);

  //Tomo las posiciones actuales
  left_sexo:=laSexo.Left;
  left_largo_cap:=laLargoCap.Left;
  tab_order_sexo:=dbedSexo.TabOrder;
  tab_order_largo_cap:=dbedLargoCap.TabOrder;

  //Si está configurado invertir, y aún no están invertidos, lo hago
  if (invertir_pos='True') and (left_largo_cap>left_sexo) then
  begin

    //Intercambio las posiciones
    laSexo.Left:=left_largo_cap;
    dbedSexo.Left:=left_largo_cap;
    laLargoCap.Left:=left_sexo;
    dbedLargoCap.Left:=left_sexo;

    //Intercambio también el TabOrder
    dbedSexo.TabOrder:=tab_order_largo_cap;
    dbedLargoCap.TabOrder:=tab_order_sexo;

  end;
  //Pongo el control inicial en el primerosegún el TabOrder
  if dbedSexo.TabOrder<dbedLargoCap.TabOrder then
     zcePrincipal.ControlInicial:=dbedSexo
  else
    zcePrincipal.ControlInicial:=dbedLargoCap;
end;

procedure TfmEditarDetalleMuestra.pcPrincipalChange(Sender: TObject);
begin
  if pcPrincipal.ActivePage=tsRelacMorf then
  begin
    if dbed_p1dm.CanFocus then
       dbed_p1dm.SetFocus;
  end;
end;

procedure TfmEditarDetalleMuestra.pcPrincipalChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange:=((pcPrincipal.ActivePage=tsRelacMorf) or (dmMuestras.zqMuestrascod_tipo_muestra.Value='R'));
end;

procedure TfmEditarDetalleMuestra.HabilitarCampos;
var
  tiene_huevos: boolean;
begin
  //busco a mano porque automáticamente lo hace con retrado y no sirve
  tiene_huevos:=False;
  if dbedSexo.Text='2' then
  begin
    if dmMuestras.zqCodigosHuevos1.Locate('codigo', LeftStr(dblkHuevos.Text,1), [])then
    begin
      tiene_huevos:=dmMuestras.zqCodigosHuevos1tiene_huevos.AsBoolean;
    end;
  end;
  dblkHuevos.Enabled:=dbedSexo.Text='2';
  dbedPorcentHuevos.Enabled:=((dbedSexo.Text='2') and tiene_huevos);
  tsRelacMorf.Enabled:=dmMuestras.zqMuestrascod_tipo_muestra.Value='R';
  dbedPeso.Enabled:=dmMuestras.zqMuestrascod_tipo_muestra.Value<>'M';
  if (dbedSexo.Text<>'2')
     and (not dmMuestras.zqDetalleMuestrasidcodigo_huevos.IsNull)
     and (dmMuestras.zqDetalleMuestras.State in [dsInsert, dsEdit]) then
  begin
    dmMuestras.zqDetalleMuestrasidcodigo_huevos.AsVariant:=Null;
  end;
  if ((dbedSexo.Text<>'2') or (not tiene_huevos))
     and (not dmMuestras.zqDetalleMuestrasporcentaje_huevos.IsNull)
     and (dmMuestras.zqDetalleMuestras.State in [dsInsert, dsEdit]) then
  begin
    dmMuestras.zqDetalleMuestrasporcentaje_huevos.AsVariant:=Null;
  end;
end;

end.

