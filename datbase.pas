unit datBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil,datGeneral, ZDataset, ZStoredProcedure, ZAbstractConnection;

type

  { TDmBase }

  TDmBase = class(TDataModule)
  private
    { private declarations }
  public
    { public declarations }
    function NuevoID(Connection: TZAbstractConnection;tabla: string): longint;
  end;

var
  DmBase: TDmBase;

implementation

{$R *.lfm}

{ TDmBase }

function TDmBase.NuevoID(Connection: TZAbstractConnection; tabla: string): longint;
var
  ID: integer;
  zsp: TZStoredProc;
begin
  ID := -1;
  if tabla <> '' then
  begin
    //Creo un SQLQuery para obtener el dato desde la base de datos
    zsp:=TZStoredProc.Create(Self);
    try
      zsp.Connection:=Connection;
      zsp.StoredProcName:='sp_nuevo_id';
      zsp.Params.Add;
      zsp.Params.Add;
      zsp.Params[0].Name:='p_nombre_tabla';
      zsp.Params[0].DataType:=ftString;
      zsp.Params[0].ParamType:=ptInput;
      zsp.Params[1].Name:='p_id';
      zsp.Params[1].DataType:=ftInteger;
      zsp.Params[1].ParamType:=ptOutput;
      zsp.Params[0].AsString:=tabla;
      zsp.Prepare;
      zsp.ExecProc;
      ID := zsp.Params[1].AsInteger;
      if ID < 1 then
        ID := -1;
    finally
      zsp.Free;
    end;
  end;
  Result := ID;
end;

end.

