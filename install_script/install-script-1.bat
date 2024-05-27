@echo off

REM winget upgrade --all

REM echo Installing Git Bash...
REM winget install --id Git.Git -e

REM winget install --id Google.Chrome -e

echo Installing Git...
set "installer_name=GitInstaller.exe"
set ""installer_dir=%~dp0"

if exist "%install_dir%\%installer_name%" (
    echo Git installer found. Installing...
    start /wait "" "%install_dir%\%installer_name%" /SILENT /NORESTART
    echo Git has been installed successfully.
) else (
    echo Error: Git installer not found in the same directory as the script.
    exit /b 1
)

set "GIT_BASH_PATH=C:\Program Files\Git\bin\bash.exe"
set "SCRIPT_PATH_1=%cd%\install_script\install-sh-1.sh"
set "SCRIPT_PATH_2=%cd%\install_script\install-sh-2.sh"
start "" /wait "%GIT_BASH_PATH%" "%SCRIPT_PATH_1%"