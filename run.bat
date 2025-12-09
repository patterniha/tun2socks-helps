:: https://github.com/xjasonlyu/tun2socks
:: https://www.wintun.net/


@echo off
:: Check if script is running as admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Elevating to administrator...
    powershell -command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

"tun2socks-windows-amd64-v3.exe" -device wintun -proxy socks5://127.0.0.1:10808 -tcp-auto-tuning -tcp-rcvbuf 4m -tcp-sndbuf 4m -mtu 1500 -loglevel info -udp-timeout 30s

pause


:: it use default interface to send data, you can explicitly define (other) interface with for example #-interface "Wi-Fi"#
:: but if interface is explicitly defined, udp-bind-IP-in-UDP-associate-response should be in explicted-defined-interface-IP-ranges (tun2socks bug)

:: you can use socks-forwarder-addr/target-socks-in-addr for socks5 address, but care about udp-bind-IP-in-UDP-associate-response for differnt scenarios
