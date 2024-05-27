@echo off

REM winget upgrade --all

REM echo Installing Git Bash...
REM winget install --id Git.Git -e

REM winget install --id Google.Chrome -e

set "GIT_BASH_PATH=C:\Program Files\Git\bin\bash.exe"
set "SCRIPT_PATH_1=%cd%\install_script\install-sh-1.sh"
set "SCRIPT_PATH_2=%cd%\install_script\install-sh-2.sh"
start "" /wait "%GIT_BASH_PATH%" "%SCRIPT_PATH_1%"
