@echo off
:: Check if script is running as admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Elevating to administrator...
    powershell -command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

netsh interface ipv4 set address "wintun" static 10.10.14.1 255.255.255.252
netsh interface ipv6 set address "wintun" fc00::10:10:14:1/126

netsh interface ipv4 set dnsservers name="wintun" static 127.0.0.1 primary validate=no
netsh interface ipv4 set dnsservers name="Wi-Fi" static 127.0.0.1 primary validate=no

netsh interface ipv4 add route 0.0.0.0/1 "wintun" 10.10.14.1 metric=1
netsh interface ipv4 add route 128.0.0.0/1 "wintun" 10.10.14.1 metric=1
netsh interface ipv6 add route ::/1 "wintun" fc00::10:10:14:1 metric=1
netsh interface ipv6 add route 8000::/1 "wintun" fc00::10:10:14:1 metric=1

pause
