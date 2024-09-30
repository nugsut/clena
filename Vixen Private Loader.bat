@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

title Vixen Private Loader ~ Sigma

echo Renaming .dll's
ren CompPkgSup.dll bCompPkgSup.dll
ren cat.dll CompPkgSup.dll

echo .dll renamed. Press Enter to unrename.
pause >nul

echo Unrenaming DLLs...
ren CompPkgSup.dll cat.dll
ren bCompPkgSup.dll CompPkgSup.dll

echo .dll reverted.
pause
