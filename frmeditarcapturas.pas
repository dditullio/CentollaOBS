unit frmeditarcapturas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, rxdbgrid, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, DbCtrls, Buttons, frmzedicionbase,
  datcaptura, ZDataset, ZSequence, SQLQueryGroup, zcontroladoredicion,
  zdatasetgroup, zcontroladorgrilla, db, datGeneral;

type

  { TfmEditarCaptura }

  TfmEditarCaptura = class(TZEdicionBase)
    bbAgregar: TBitBtn;
    bbAgregar1: TBitBtn;
    bbEditar: TBitBtn;
    bbEditar1: TBitBtn;
    bbEliminar: TBitBtn;
    bbEliminar1: TBitBtn;
    dbgLista: TRxDBGrid;
    dbgLista1: TRxDBGrid;
    dblkLance: TDBLookupComboBox;
    dblkEspecie1Cient: TDBLookupComboBox;
    dblkEspecie1Vulgar: TDBLookupComboBox;
    dblkEspecie2Cient: TDBLookupComboBox;
    dblkEspecie2Vulgar: TDBLookupComboBox;
    dblkEspecie3Cient: TDBLookupComboBox;
    dblkEspecie3Vulgar: TDBLookupComboBox;
    dbmComentarios: TDBMemo;
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
    paEspVulgar: TPanel;
    paGrilla: TPanel;
    paEspCient: TPanel;
    paGrilla1: TPanel;
    rgOrden: TRadioGroup;
    zcgLista: TZControladorGrilla;
    zcgLista1: TZControladorGrilla;
    zqAntCapturacomentarios: TStringField;
    zqAntCapturafecha: TDateField;
    zqAntCapturahora: TTimeField;
    zqAntCapturaidcaptura: TLongintField;
    zqAntCapturaidespecie1: TLongintField;
    zqAntCapturaidespecie2: TLongintField;
    zqAntCapturaidespecie3: TLongintField;
    zqAntCapturaidlance: TLongintField;
    zqAntCapturaidmarea: TLongintField;
    zqAntCapturanro_boya: TLongintField;
    zqAntCapturanro_lance: TLongintField;
    zqAntCapturanro_linea: TLongintField;
    procedure dblkEspecie1CientExit(Sender: TObject);
    procedure dblkEspecie1VulgarExit(Sender: TObject);
    procedure dblkEspecie2CientExit(Sender: TObject);
    procedure dblkEspecie2VulgarExit(Sender: TObject);
    procedure dblkEspecie3CientExit(Sender: TObject);
    procedure dblkEspecie3VulgarExit(Sender: TObject);
    procedure dblkLanceExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgOrdenClick(Sender: TObject);
    procedure zcgListaAntesAgregar(Sender: TObject);
    procedure zcgListaAntesEditar(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmEditarCaptura: TfmEditarCaptura;

implementation

{$R *.lfm}

{ TfmEditarCaptura }

procedure TfmEditarCaptura.rgOrdenClick(Sender: TObject);
begin
  paEspVulgar.Visible:=(rgOrden.ItemIndex=0);
  paEspCient.Visible:=(rgOrden.ItemIndex=1);
  dmCapturas.OrdenEspecies:=rgOrden.ItemIndex;
  if rgOrden.ItemIndex=0 then
     dbgLista1.Columns[0].FieldName:='nombre_vulgar'
  else
    dbgLista1.Columns[0].FieldName:='nombre_cientifico';
end;

procedure TfmEditarCaptura.zcgListaAntesAgregar(Sender: TObject);
begin
  dmCapturas.HayEspecie1:=(not dmCapturas.zqCapturaidespecie1.IsNull);
  dmCapturas.HayEspecie2:=(not dmCapturas.zqCapturaidespecie2.IsNull);
  dmCapturas.HayEspecie3:=(not dmCapturas.zqCapturaidespecie3.IsNull);
end;

procedure TfmEditarCaptura.zcgListaAntesEditar(Sender: TObject);
begin
  dmCapturas.HayEspecie1:=(not dmCapturas.zqCapturaidespecie1.IsNull);
  dmCapturas.HayEspecie2:=(not dmCapturas.zqCapturaidespecie2.IsNull);
  dmCapturas.HayEspecie3:=(not dmCapturas.zqCapturaidespecie3.IsNull);
end;

procedure TfmEditarCaptura.FormShow(Sender: TObject);
begin
  paEspVulgar.Visible:=(rgOrden.ItemIndex=0);
  paEspCient.Visible:=(rgOrden.ItemIndex=1);
  if rgOrden.ItemIndex=0 then
     dbgLista1.Columns[0].FieldName:='nombre_vulgar'
  else
    dbgLista1.Columns[0].FieldName:='nombre_cientifico';
  dmCapturas.OrdenEspecies:=rgOrden.ItemIndex;
  zcgLista.HabilitarAcciones;
  zcgLista1.HabilitarAcciones;
end;

procedure TfmEditarCaptura.dblkLanceExit(Sender: TObject);
begin
  dmCapturas.zqCaptura.DisableControls;
  dmCapturas.zqCaptura.EnableControls;
end;

procedure TfmEditarCaptura.dblkEspecie2VulgarExit(Sender: TObject);
begin
  if (dblkEspecie2Vulgar.Text='') and ((zcePrincipal.Accion=ED_AGREGAR) or (zcePrincipal.Accion=ED_MODIFICAR)) then
  begin
     if not (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
          dmCapturas.dsCaptura.Edit;
     if (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
        dmCapturas.zqCapturaidespecie2.Clear;
  end;
end;

procedure TfmEditarCaptura.dblkEspecie2CientExit(Sender: TObject);
begin
  if (dblkEspecie2Cient.Text='') and ((zcePrincipal.Accion=ED_AGREGAR) or (zcePrincipal.Accion=ED_MODIFICAR)) then
  begin
     if not (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
          dmCapturas.dsCaptura.Edit;
     if (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
        dmCapturas.zqCapturaidespecie2.Clear;
  end;
end;

procedure TfmEditarCaptura.dblkEspecie1VulgarExit(Sender: TObject);
begin
  if (dblkEspecie1Vulgar.Text='') and ((zcePrincipal.Accion=ED_AGREGAR) or (zcePrincipal.Accion=ED_MODIFICAR)) then
  begin
     if not (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
          dmCapturas.dsCaptura.Edit;
     if (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
        dmCapturas.zqCapturaidespecie1.Clear;
  end;
end;

procedure TfmEditarCaptura.dblkEspecie1CientExit(Sender: TObject);
begin
  if (dblkEspecie1Cient.Text='') and ((zcePrincipal.Accion=ED_AGREGAR) or (zcePrincipal.Accion=ED_MODIFICAR)) then
  begin
     if not (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
          dmCapturas.dsCaptura.Edit;
     if (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
        dmCapturas.zqCapturaidespecie1.Clear;
  end;
end;

procedure TfmEditarCaptura.dblkEspecie3CientExit(Sender: TObject);
begin
  if (dblkEspecie3Cient.Text='') and ((zcePrincipal.Accion=ED_AGREGAR) or (zcePrincipal.Accion=ED_MODIFICAR)) then
  begin
     if not (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
          dmCapturas.dsCaptura.Edit;
     if (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
        dmCapturas.zqCapturaidespecie3.Clear;
  end;
end;

procedure TfmEditarCaptura.dblkEspecie3VulgarExit(Sender: TObject);
begin
  if (dblkEspecie3Vulgar.Text='') and ((zcePrincipal.Accion=ED_AGREGAR) or (zcePrincipal.Accion=ED_MODIFICAR)) then
  begin
     if not (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
          dmCapturas.dsCaptura.Edit;
     if (dmCapturas.dsCaptura.State in [dsInsert, dsEdit]) then
        dmCapturas.zqCapturaidespecie3.Clear;
  end;
end;

procedure TfmEditarCaptura.FormCreate(Sender: TObject);
begin
  zcgLista.AntesAgregar:=@zcgListaAntesAgregar;
  zcgLista.AntesEditar:=@zcgListaAntesEditar;
end;

end.

