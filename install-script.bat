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

mkdir "%install_dir%" 2>nul
cd /d "%install_dir%"

curl -L -o "%installer_name%" "%installer_url%"
start /wait "" "%installer_name%" /SILENT /NORESTART

echo Git has been installed successfully.

set "GIT_BASH_PATH=C:\Program Files\Git\bin\bash.exe"
set "SCRIPT_PATH=%cd%\install-script.sh"
set "SCRIPT_PATH_1=%cd%\install-1.sh"
set "SCRIPT_PATH_2=%cd%\install-2.sh"
start "" /wait "%GIT_BASH_PATH%" "%SCRIPT_PATH_1%"

timeout /t 5 /nobreak

start "" /wait "%GIT_BASH_PATH%" "%SCRIPT_PATH_2%"
