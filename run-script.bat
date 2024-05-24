@echo off
set "GIT_BASH_PATH=C:\Program Files\Git\bin\bash.exe"
set "SCRIPT_PATH=%cd%\run-script.sh"
start "" "%GIT_BASH_PATH%" "%SCRIPT_PATH%"