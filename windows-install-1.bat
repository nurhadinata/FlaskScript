@echo off

cd /d %~dp0

echo Checking internet connection...
ping -n 1 www.google.nl
cls

if not %ERRORLEVEL% equ 0 GOTO NOCONNECTION

call install_script\install-script-1.bat
GOTO CONTINUE

:NOCONNECTION
echo No connection available...
pause
exit

:CONTINUE
exit
