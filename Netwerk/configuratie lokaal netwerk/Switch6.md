Configuratie voor Switch 6:

```
enable
configure terminal
hostname Switch6
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
vlan 500
exit
interface vlan 999
ip address 172.18.2.133 255.255.255.240
no shutdown
exit
ip default-gateway 172.18.2.130

interface fa0/1
switchport mode access
switchport access vlan 600
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

interface range f0/2-19
shutdown
interface range f0/22-24
shutdown
interface g0/2
shutdown

end
copy running-config startup-config

```

Configuratie voor Router op Switch 6:

```
enable
configure terminal
hostname RouterSwitch6
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
interface g0/0.500
encapsulation dot1q 500
ip address 172.18.2.65 255.255.255.224
no shutdown
interface g0/0.600
encapsulation dot1q 600
ip address 172.18.2.97 255.255.255.240
no shutdown
interface g0/0.999
encapsulation dot1q 999 native
ip address 172.18.2.130 255.255.255.224
no shutdown
interface g0/0
no shutdown
interface g0/1
ip address 172.18.2.33 255.255.255.224
no shutdown
exit
ip route 172.18.0.0 255.255.254.0 172.18.2.34
ip route 172.18.2.0 255.255.255.224 172.18.2.34
ip route 0.0.0.0 0.0.0.0 g0/0.600
ip route 172.18.2.129 255.255.255.255 172.18.2.34
ip route 172.18.2.132 255.255.255.255 172.18.2.34
ip route 172.18.2.131 255.255.255.255 172.18.2.34
end
copy running-config startup-config

                                interface g0/0
                                ip helper-address 172.18.2.2


```
