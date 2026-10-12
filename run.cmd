@echo off
setlocal
cd /d "%~dp0"
if exist "TVC.Console\bin\Release\TVC.Console.exe" goto RELEASE
if exist "TVC.Console\bin\Debug\TVC.Console.exe" goto DEBUG
echo Keine EXE gefunden. Bitte zuerst mit Visual Studio 2019 erstellen.
exit /b 1
:RELEASE
"TVC.Console\bin\Release\TVC.Console.exe"
exit /b %errorlevel%
:DEBUG
"TVC.Console\bin\Debug\TVC.Console.exe"
exit /b %errorlevel%
