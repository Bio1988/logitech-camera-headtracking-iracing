@echo off
setlocal EnableExtensions
cd /d "%~dp0.."
title iRacing G9 Logitech Headtracking Setup

echo ============================================================
echo   iRacing + Samsung G9 + Logitech Webcam Headtracking
echo   OpenTrack NeuralNet / Accela / FreeTrack
echo ============================================================
echo.

set "OTEXE="
if exist "%ProgramFiles%\opentrack\opentrack.exe" set "OTEXE=%ProgramFiles%\opentrack\opentrack.exe"
if exist "%ProgramFiles(x86)%\opentrack\opentrack.exe" set "OTEXE=%ProgramFiles(x86)%\opentrack\opentrack.exe"

if not defined OTEXE (
  set "INSTALLER="
  for %%F in ("%~dp0..\opentrack-*-win32-setup.exe") do set "INSTALLER=%%~fF"
  if not defined INSTALLER for %%F in ("%USERPROFILE%\Downloads\opentrack-*-win32-setup.exe") do set "INSTALLER=%%~fF"
  if not defined INSTALLER (
    echo FEHLER: OpenTrack-Installer nicht gefunden.
    echo Lade den offiziellen Installer herunter und lege ihn ins Repo-Verzeichnis
    echo oder in deinen Downloads-Ordner.
    echo.
    pause
    exit /b 2
  )
  echo Installiere OpenTrack aus:
  echo %INSTALLER%
  echo.
  start /wait "" "%INSTALLER%" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
  if exist "%ProgramFiles%\opentrack\opentrack.exe" set "OTEXE=%ProgramFiles%\opentrack\opentrack.exe"
  if exist "%ProgramFiles(x86)%\opentrack\opentrack.exe" set "OTEXE=%ProgramFiles(x86)%\opentrack\opentrack.exe"
)

if not defined OTEXE (
  echo FEHLER: opentrack.exe wurde nach der Installation nicht gefunden.
  pause
  exit /b 3
)

set "PROFILEDIR=%USERPROFILE%\Documents\opentrack"
if not exist "%PROFILEDIR%" mkdir "%PROFILEDIR%"
copy /Y "%~dp0..\profiles\default.ini" "%PROFILEDIR%\default.ini" >nul
copy /Y "%~dp0..\profiles\G9-C920-C920e-30fps-YawOnly.ini" "%PROFILEDIR%\G9-C920-C920e-30fps-YawOnly.ini" >nul
copy /Y "%~dp0..\profiles\G9-C922-Brio-StreamCam-60fps-YawOnly.ini" "%PROFILEDIR%\G9-C922-Brio-StreamCam-60fps-YawOnly.ini" >nul

reg add "HKCU\Software\opentrack-2.3" /v settings-filename /t REG_SZ /d default.ini /f >nul 2>&1

echo.
echo Fertig. Standardprofil: 30 fps / Yaw only / konservativ fuer G9.
echo.
echo WICHTIG BEIM ERSTEN START:
echo   1. Input = NeuralNet Tracker
echo   2. Kamera im Schraubenschluessel waehlen
echo   3. Output = freetrack 2.0 Enhanced
echo   4. Filter = Accela
echo   5. Center-Hotkey auf Lenkrad/Keyboard legen
echo.
echo C922/Brio/StreamCam? Danach scripts\USE_60FPS_PROFILE.cmd starten.
echo.
start "" "%OTEXE%"
pause
