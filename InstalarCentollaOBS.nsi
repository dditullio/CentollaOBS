;NSIS Modern User Interface
;Start Menu Folder Selection Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "Centolla OBS"
  OutFile "InstalarCentollaOBS.exe"

  ;Default installation folder
  InstallDir "$DOCUMENTS\INIDEP\Centolla OBS"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\INIDEP\Centolla OBS" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel highest

;--------------------------------
;Variables

  Var StartMenuFolder

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME

;Para insertar un aviso de licencia descomentar la siguiente l�nea y configurar la ruta del txt
;  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
;  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY

  ;Start Menu Folder Page Configuration
  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU"
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\INIDEP"
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"

  !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder

  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES


Function .onInit
  MessageBox MB_YESNO|MB_ICONEXCLAMATION "ATENCI�N$\nSi usted est� actualizando la aplicaci�n a una nueva versi�n, recuerde haber realizado previamente una copia de seguridad.$\nLa instalaci�n eliminar� todo el contenido de la base de datos. Al finalizar la instalaci�n usted podr� restaurar la copia de seguridad.$\n$\n�Desea continuar con la instalaci�n en este momento?" IDYES true IDNO false
true:
	Goto next
false:
  Quit
next:
FunctionEnd
;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "Spanish"
;  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "Aplicaci�n" SecApp

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  File "CentollaOBS.exe"
  File "libmysql.dll"
  File "libmysqld.dll"
  File "libmysqlclient.so.18.0.0"
  File "Manual\Centolla OBS V1.0 - Manual de usuario.pdf"
  File /r "es"
  File /r "PlanillasExcel"

  ;Store installation folder
  WriteRegStr HKCU "Software\INIDEP\Centolla OBS" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application

  !ifndef NO_STARTMENUSHORTCUTS
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Centolla OBS.lnk" "$INSTDIR\CentollaOBS.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Desinstalar Centolla OBS.lnk" "$INSTDIR\Uninstall.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Centolla OBS.lnk" "$INSTDIR\CentollaOBS.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Centolla OBS - Manual.lnk" "$INSTDIR\Centolla OBS V1.0 - Manual de usuario.pdf"
  !endif
    CreateShortCut "$DESKTOP\Centolla OBS - Manual.lnk" "$INSTDIR\Centolla OBS V1.0 - Manual de usuario.pdf"
    CreateShortCut "$DESKTOP\Centolla OBS.lnk" "$INSTDIR\CentollaOBS.exe"

  !insertmacro MUI_STARTMENU_WRITE_END

SectionEnd

Section "Base de datos" SecDB

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  File /r DB_Centolla

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecApp ${LANG_SPANISH} "Aplicaci�n"
  LangString DESC_SecDB ${LANG_SPANISH} "Base de datos"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecApp} $(DESC_SecApp)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDB} $(DESC_SecDB)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...
  Delete /REBOOTOK "$INSTDIR\CentollaOBS.exe"
  Delete /REBOOTOK "$INSTDIR\Centolla OBS V1.0 - Manual de usuario.pdf"
  Delete /REBOOTOK "$INSTDIR\libmysql.dll"
  Delete /REBOOTOK "$INSTDIR\libmysqld.dll"
  Delete /REBOOTOK "$INSTDIR\libmysqlclient.so.18.0.0"
  RMDir /r /REBOOTOK "$INSTDIR\PlanillasExcel"
  RMDir /r /REBOOTOK "$INSTDIR\es"
  RMDir /r /REBOOTOK "$LOCALAPPDATA\Centolla OBS"
  RMDir /r /REBOOTOK "$LOCALAPPDATA\CentollaOBS"

  Delete "$INSTDIR\Uninstall.exe"

  RMDir /r /REBOOTOK "$INSTDIR\DB_Centolla"

  RMDir "$INSTDIR"

 ;; RMDir "$PROGRAMFILES32\INIDEP"

  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder

  Delete "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk"
  Delete "$SMPROGRAMS\$StartMenuFolder\Centolla OBS.lnk"
  Delete "$DESKTOP\Centolla OBS.lnk"
  Delete "$DESKTOP\Centolla OBS - Manual.lnk"
  RMDir /r "$SMPROGRAMS\$StartMenuFolder"

  DeleteRegKey /ifempty HKCU "Software\INIDEP\Centolla OBS"

SectionEnd
