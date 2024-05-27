@echo off

winget upgrade --all

echo Installing Git Bash...
winget install --id Git.Git -e

if %ERRORLEVEL% equ 0 (
  echo Git installation succesful.
  echo Continuing Purchase App installation...
) else (
  echo Installation failed with error code %ERRORLEVEL%.
  pause
  exit /b %ERRORLEVEL%
)

set "GIT_BASH_PATH=C:\Program Files\Git\bin\bash.exe"
set "SCRIPT_PATH_1=%cd%\install_script\install-sh-1.sh"
set "SCRIPT_PATH_2=%cd%\install_script\install-sh-2.sh"
start "" /wait "%GIT_BASH_PATH%" "%SCRIPT_PATH_1%"
