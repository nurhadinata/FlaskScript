@echo off

echo Downloading winget...

rem Define the URL for the winget installer package (ensure this URL is up-to-date)
set WINGET_URL=https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

rem Define the path for the downloaded file
set WINGET_FILE=%TEMP%\winget.msixbundle

rem Download the winget installer package
powershell -Command "Invoke-WebRequest -Uri %WINGET_URL% -OutFile %WINGET_FILE%"

rem Install the winget package (you may need administrative privileges)
echo Installing winget...
powershell -Command "Add-AppxPackage -Path %WINGET_FILE%"

rem Clean up the downloaded file
del %WINGET_FILE%

REM echo Installing Git Bash...
winget install --id Git.Git -e

winget install --id Google.Chrome -e

set "GIT_BASH_PATH=C:\Program Files\Git\bin\bash.exe"
set "SCRIPT_PATH=%cd%\install-script.sh"
start "" "%GIT_BASH_PATH%"
REM "%SCRIPT_PATH%"
