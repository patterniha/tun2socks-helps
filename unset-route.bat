@echo off
:: Check if script is running as admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Elevating to administrator...
    powershell -command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

netsh interface ipv4 set dnsservers name="Wi-Fi" source=dhcp

pause
