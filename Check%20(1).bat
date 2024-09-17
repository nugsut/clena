@echo off
mode con: cols=90 lines=48
:diocane
title REEEEEEEEEEEEEEEEEEEEEEEEE
color 0c
cls

echo BIOS
echo [92m------------[91m
wmic bios get serialnumber

echo SMBIOS UUID
echo [92m------------[91m
wmic csproduct get uuid

echo CPU
echo [92m------------[91m
wmic cpu get serialnumber

echo Baseboard
echo [92m------------[91m
wmic baseboard get serialnumber

echo MAC Address
echo [92m------------[91m
wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress

echo Press ENTER to check information again...
pause >nul
goto diocane
