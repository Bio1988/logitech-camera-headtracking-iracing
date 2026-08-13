@echo off
setlocal
set "OT=%ProgramFiles%\opentrack\opentrack.exe"
if not exist "%OT%" set "OT=%ProgramFiles(x86)%\opentrack\opentrack.exe"
if not exist "%OT%" (
  echo OpenTrack nicht gefunden. Starte zuerst SETUP_HEADTRACKING.cmd
  pause
  exit /b 1
)
start "" "%OT%"
