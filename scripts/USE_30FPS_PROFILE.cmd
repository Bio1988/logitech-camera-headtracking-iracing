@echo off
setlocal
set "PROFILEDIR=%USERPROFILE%\Documents\opentrack"
if not exist "%PROFILEDIR%" mkdir "%PROFILEDIR%"
copy /Y "%~dp0..\profiles\G9-C920-C920e-30fps-YawOnly.ini" "%PROFILEDIR%\default.ini" >nul
echo 30-fps-Profil ist jetzt als default.ini aktiv. OpenTrack neu starten.
pause
