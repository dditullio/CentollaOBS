program CentollaOBS;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  sysutils, Forms, lazcontrols, datetimectrls, pl_zeosdbo, pl_rx,
  tachartlazaruspkg, pl_fortesreport, memdslaz, pl_luicontrols, frmPrincipal,
  datGeneral, frmbase, frmlistabase, frmmareas, frmzedicionbase,
  DefaultTranslator, frmEditarMarea, datBase, frmlances, funciones,
  lr_pdfexport, frmSplashScreenForm, frmeditarlances, frmlineas, frmdatosbase,
  frmeditarlineas, frmeditarproductos, frmeditarcarnada, frmcapturas,
  datcaptura, frmeditarmuestras, frmeditarcapturas, frmeditardetallecaptura,
  frmeditarbycatch, frmmuestras, datmuestras, frmeditardetallemuestra,
  frmProduccion, frmeditarproduccion, frmexportarlances, frmfactoresconversion,
  frmeditarfactorconversion, frmresumenproduccion, frmmarcado, frmeditarmarcado,
  frmmareaaexcel, frmenviosemail, frmEditarEnviosEmail, frmeditartipostrampa;

{$R *.res}

begin
  Application.Title:='Centolla OBS';
  RequireDerivedFormResource := True;
  DecimalSeparator:='.';
  ThousandSeparator:=',';
  Application.Initialize;
  ShowSplashScreen;
  SetSplashScreenStatus( 'Iniciando...' );
  Application.CreateForm(TdmGeneral, dmGeneral);
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.CreateForm(TfmEditarMarea, fmEditarMarea);
  Application.CreateForm(TfmEditarLances, fmEditarLances);
  Application.CreateForm(TfmEditarLineas, fmEditarLineas);
  Application.CreateForm(TfmEditarProductos, fmEditarProductos);
  Application.CreateForm(TfmEditarCarnada, fmEditarCarnada);
  Application.CreateForm(TdmCapturas, dmCapturas);
  Application.CreateForm(TfmDetalleCaptura, fmDetalleCaptura);
  Application.CreateForm(TfmEditarByCatch, fmEditarByCatch);
  Application.CreateForm(TfmEditarCaptura, fmEditarCaptura);
  Application.CreateForm(TdmMuestras, dmMuestras);
  Application.CreateForm(TfmEditarMuestras, fmEditarMuestras);
  Application.CreateForm(TfmEditarDetalleMuestra, fmEditarDetalleMuestra);
  Application.CreateForm(TfmEditarProduccion, fmEditarProduccion);
  Application.CreateForm(TfmEditarFactorConversion, fmEditarFactorConversion);
  Application.CreateForm(TfmEditarMarcado, fmEditarMarcado);
  Application.CreateForm(TFmEnviosEmail, FmEnviosEmail);
  Application.CreateForm(TFmEditarEnviosEmail, FmEditarEnviosEmail);
  Application.CreateForm(TfmEditarTiposTrampa, fmEditarTiposTrampa);
  Application.Run;
end.

