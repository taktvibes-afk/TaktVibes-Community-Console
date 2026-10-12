@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0verify-signature.ps1"
exit /b %errorlevel%
