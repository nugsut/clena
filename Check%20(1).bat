@echo off
mode con: cols=90 lines=48
setlocal enabledelayedexpansion

:: Define the output file path
set "outputFile=%USERPROFILE%\Downloads\SystemInfo.txt"

:: Clear previous output file if it exists
if exist "%outputFile%" del "%outputFile%"

:: Collect and output BIOS serial number
echo BIOS >> "%outputFile%"
echo ------------ >> "%outputFile%"
wmic bios get serialnumber >> "%outputFile%" 2>&1
echo BIOS information collected. Press any key to continue...
pause >nul

:: Collect and output SMBIOS UUID
echo SMBIOS UUID >> "%outputFile%"
echo ------------ >> "%outputFile%"
wmic csproduct get uuid >> "%outputFile%" 2>&1
echo SMBIOS UUID information collected. Press any key to continue...
pause >nul

:: Collect and output CPU serial number
echo CPU >> "%outputFile%"
echo ------------ >> "%outputFile%"
wmic cpu get serialnumber >> "%outputFile%" 2>&1
echo CPU information collected. Press any key to continue...
pause >nul

:: Collect and output Baseboard serial number
echo Baseboard >> "%outputFile%"
echo ------------ >> "%outputFile%"
wmic baseboard get serialnumber >> "%outputFile%" 2>&1
echo Baseboard information collected. Press any key to continue...
pause >nul

:: Collect and output MAC Address
echo MAC Address >> "%outputFile%"
echo ------------ >> "%outputFile%"
wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress >> "%outputFile%" 2>&1
echo MAC Address information collected. Press any key to continue...
pause >nul

echo All information has been collected. Press any key to exit...
pause >nul
	