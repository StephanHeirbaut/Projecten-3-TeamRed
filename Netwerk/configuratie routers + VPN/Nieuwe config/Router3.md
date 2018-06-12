Configuratie voor Router3:

```
enable
configure terminal
hostname Router3
line console 0
password cisco
login
exit
int Fa0/1
ip add 192.168.0.2 255.255.255.0
no shut
int Fa0/0.80
encapsulation dot1q 80
ip add 192.168.1.2 255.255.255.0
int fa0/0.800
encapsulation dot1q 800
ip add 192.168.2.2 255.255.255.0
exit
int fa0/0
no shutdown
exit
ip route 172.16.0.0 255.255.0.0 fa0/0.80
ip route 172.18.0.0 255.255.0.0 fa0/0.800
ip route 0.0.0.0 0.0.0.0 fa0/1
end
copy running-config startup-config

reload
```
