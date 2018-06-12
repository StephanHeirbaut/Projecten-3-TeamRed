Configuratie voor Router1:

```
enable
configure terminal
hostname Router1
line console 0
password cisco
login
exit
int Fa0/1
ip add 172.16.129.13 255.255.255.252
no shut
int Fa0/0
ip add 192.168.1.1 255.255.255.0
no shut
exit
ip route 0.0.0.0 0.0.0.0 FastEthernet0/0
ip route 172.16.0.0 255.255.0.0 172.16.129.9
ip route 172.16.0.0 255.255.128.0 172.16.129.9
ip route 172.16.0.0 255.255.128.0 172.16.129.14
ip route 172.16.128.0 255.255.255.128 172.16.129.14
ip route 172.16.128.128 255.255.255.128 172.16.129.14
ip route 172.16.129.12 255.255.255.252 172.16.129.14
ip route 172.16.129.8 255.255.255.252 172.16.129.14
ip route 172.18.0.0 255.255.0.0 FastEthernet0/0
ip route 192.168.0.0 255.255.255.0 FastEthernet0/0
ip route 192.168.2.0 255.255.255.0 FastEthernet0/0
end
copy running-config startup-config

reload
```

( als niet werkt, .14 vervangen door .9)
