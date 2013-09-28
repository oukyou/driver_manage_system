@echo off
echo Windows Registry Editor Version 5.00 >dms.reg
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\DMS] >>dms.reg
echo "Name"="WUXI-XU-ZHANG-WANG-DRIVER-MANAGE-SYSTEM" >>dms.reg
regedit /s dms.reg
del /q dms.reg
pause 