Configuratie voor Switch 4:

```
enable
configure terminal
hostname Switch4
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
exit
interface vlan 999
ip address 172.18.2.131 255.255.255.240
no shutdown
exit
ip default-gateway 172.18.2.129
interface range f0/1-5
switchport mode access
switchport access vlan 200
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
interface range f0/6-19
shutdown
exit
interface range f0/22-24
shutdown
interface range g0/1-2
shutdown
end
copy running-config startup-config

```
