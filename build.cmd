@echo off
setlocal
cd /d "%~dp0"
where msbuild >nul 2>nul
if errorlevel 1 (
    echo MSBuild nicht gefunden.
    echo Bitte die "Developer Command Prompt for VS 2019" oeffnen
    echo und build.cmd erneut ausfuehren.
    exit /b 1
)
msbuild "TVC.Console.sln" /nologo /t:Rebuild /p:Configuration=Release /p:Platform="Any CPU" /verbosity:minimal
if errorlevel 1 (
    echo FEHLER: Build fehlgeschlagen.
    exit /b 1
)
echo.
echo OK: TVC.Console\bin\Release\TVC.Console.exe
exit /b 0
