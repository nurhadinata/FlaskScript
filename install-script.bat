@echo off

REM echo Installing Git Bash...
winget install --id Git.Git -e

winget install --id Google.Chrome -e

set "GIT_BASH_PATH=C:\Program Files\Git\bin\bash.exe"
set "SCRIPT_PATH=%cd%\install-script.sh"
start "" "%GIT_BASH_PATH%" "%SCRIPT_PATH%"
