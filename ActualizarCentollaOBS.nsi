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
  OutFile "ActualizarCentollaOBS.exe"

  ;Default installation folder
  InstallDir "$PROGRAMFILES32\INIDEP\Centolla OBS"
  
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
;Para insertar un aviso de licencia descomentar la siguiente línea y configurar la ruta del txt
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

;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "Spanish"
;  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "Aplicación" SecApp

  SetOutPath "$INSTDIR"
  
  ;ADD YOUR OWN FILES HERE...
  File "CentollaOBS.exe"
  
  ;Store installation folder
;  WriteRegStr HKCU "Software\INIDEP\Centolla OBS" "" $INSTDIR
  
  ;Create uninstaller
;  WriteUninstaller "$INSTDIR\Uninstall.exe"
  
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    
  !ifndef NO_STARTMENUSHORTCUTS
    ;Create shortcuts
;    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
;    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Centolla OBS.lnk" "$INSTDIR\CentollaOBS.exe"
;    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Desinstalar Centolla OBS.lnk" "$INSTDIR\Uninstall.exe"
;    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Centolla OBS.lnk" "$INSTDIR\CentollaOBS.exe"
;;    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Centolla OBS - Manual.lnk" "$INSTDIR\Centolla OBS V1.0 - Manual de usuario.pdf"
  !endif
;;    CreateShortCut "$DESKTOP\Centolla OBS - Manual.lnk" "$INSTDIR\Centolla OBS V0.5 - Manual de usuario.pdf"
;    CreateShortCut "$DESKTOP\Centolla OBS.lnk" "$INSTDIR\CentollaOBS.exe"
  
  !insertmacro MUI_STARTMENU_WRITE_END
 
SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecApp ${LANG_SPANISH} "Aplicación"
  LangString DESC_SecDB ${LANG_SPANISH} "Base de datos"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecApp} $(DESC_SecApp)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDB} $(DESC_SecDB)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
 
;--------------------------------
;Uninstaller Section

