Configuratie voor VPN

```
enable
configure terminal
acces-list 110 permit ip "ip + subnet" "ip + subnet"
crypto isakmp policy 10
encryption aes 256
authentication pre-share
group 5
exit
crypto isakmp key VPN2 address "address"
crypto ipsec transform-set VPN-SET esp-aes esp-sha-hmac
crypto map VPN-MAP 10 ipsec-isakmp
description VPN connectie naar "linux of windows"
set peer "adres"
set transform-set VPN-SETmatch address 110
exit
int S0/0/1
crypto map VPN-MAP
end

```