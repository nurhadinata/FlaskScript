@echo off

REM winget upgrade --all

REM echo Installing Git Bash...
REM winget install --id Git.Git -e

REM winget install --id Google.Chrome -e


@echo off
echo Installing Git...
set "installer_url=https://github.com/git-for-windows/git/releases/download/v2.35.1.windows.2/Git-2.35.1.2-64-bit.exe"
set "installer_name=GitInstaller.exe"
set "install_dir=%TEMP%\Git"

if exist "%install_dir%\%installer_name%" (
    echo Git installer found. Installing...
    start /wait "" "%install_dir%\%installer_name%" /SILENT /NORESTART
    echo Git has been installed successfully.
) else (
    echo Error: Git installer not found in the same directory as the script.
    exit /b 1
)

echo Git has been installed successfully.

set "GIT_BASH_PATH=C:\Program Files\Git\bin\bash.exe"
set "SCRIPT_PATH=%cd%\install-script.sh"
set "SCRIPT_PATH_1=%cd%\install-1.sh"
set "SCRIPT_PATH_2=%cd%\install-2.sh"
start "" /wait "%GIT_BASH_PATH%" "%SCRIPT_PATH_1%"

timeout /t 5 /nobreak

start "" /wait "%GIT_BASH_PATH%" "%SCRIPT_PATH_2%"
