:: https://github.com/xjasonlyu/tun2socks
:: https://www.wintun.net/

@echo off

"tun2socks.exe" -device wintun -proxy socks5://127.0.0.1:10808 -tcp-auto-tuning -tcp-rcvbuf 4m -tcp-sndbuf 4m -mtu 1500 -loglevel info -udp-timeout 30s -interface "Wi-Fi"
