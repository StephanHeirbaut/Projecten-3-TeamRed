Configuratie voor Switch 5:

```
enable
configure terminal
hostname Switch5
banner motd %Unauthorized access prohibited%
enable secret DirkThijs
ip domain-name red.local
crypto key generate rsa
1024
username red secret DirkThijs
line con 0
password BertVanVreckem
login
line vty 0 15
password DirkThijs
transport input ssh
login local
exit
ip ssh version 2
ip ssh authentication-retries 2
ip ssh time-out 60
vlan 999
vlan 200
exit
interface vlan 999
ip address 172.18.2.132 255.255.255.240
no shutdown
exit
ip default-gateway 172.18.2.129
interface range f0/4-9
switchport mode access
switchport access vlan 300
no shutdown
exit
interface range f0/20-21
channel-group 1 mode desirable
no shutdown
exit
interface port-channel 1
switchport mode trunk
switchport trunk native vlan 999
no shutdown
exit


interface g0/1
switchport mode trunk
switchport trunk native vlan 999
no shutdown

interface range f0/1-3
shutdown
interface range f0/10-19
shutdown
interface range f0/22-24
shutdown
interface g0/2
shutdown

end
copy running-config startup-config


```


Configuratie voor Router op Switch 5:

```
enable
configure terminal
hostname RouterSwitch5
banner motd %Unauthorized access prohibited%
enable secret DirkThijs
ip domain-name red.local
crypto key generate rsa
1024
username red secret DirkThijs
line con 0
password BertVanVreckem
login
line vty 0 15
password DirkThijs
transport input ssh
login local
exit
ip ssh version 2
ip ssh authentication-retries 2
ip ssh time-out 60


interface g0/0.200
encapsulation dot1q 200
ip address 172.18.0.1 255.255.254.0
ip helper-address 172.18.2.2
no shutdown
interface g0/0.300
encapsulation dot1q 300
ip address 172.18.2.1 255.255.255.224
no shutdown
interface g0/0.999
encapsulation dot1q 999 native
ip address 172.18.2.129 255.255.255.224
no shutdown
interface g0/0
no shutdown
interface g0/1
ip address 172.18.2.34 255.255.255.224
no shutdown
exit
access-list 1 permit 172.18.0.0 0.0.255.255
interface g0/0.300
ip access-group 1 out
exit
ip route 0.0.0.0 0.0.0.0 172.18.2.33
ip route 172.18.2.130 255.255.255.255 172.18.2.33
ip route 172.18.2.133 255.255.255.255 172.18.2.33
ip route 172.18.2.134 255.255.255.255 172.18.2.33

end
copy running-config startup-config


```
