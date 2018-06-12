Configuratie voor Router4:

```
enable
configure terminal
hostname Router4
line console 0
password cisco
login
exit
int fa0/0
ip add 172.22.17.161 255.255.0.0 ( statisch ip geven aan toegang naar internet )
no shut
exit
int fa0/1
ip add 192.168.0.1 255.255.255.0
no shut
exit
ip route 192.168.2.0 255.255.255.0 192.168.0.2
ip route 192.168.1.0 255.255.255.0 192.168.0.2
ip route 172.16.0.0 255.255.0.0 192.168.0.2
ip route 172.18.0.0 255.255.0.0 192.168.0.2
ip route 0.0.0.0 0.0.0.0 Fa0/0
ip nat inside source list 1 interface Fa0/0 overload
access-list 1 permit any
int fa0/1
ip nat inside
int fa0/0
ip nat outside
end
copy running-config startup-config

reload

```
