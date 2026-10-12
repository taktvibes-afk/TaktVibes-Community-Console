@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0sign-release.ps1"
exit /b %errorlevel%
