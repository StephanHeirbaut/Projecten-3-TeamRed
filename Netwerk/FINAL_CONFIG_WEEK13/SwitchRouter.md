Configuratie voor Switch:

```
enable
configure terminal
hostname Switch
line console 0
password cisco
login
exit
vlan 80
name Linux
vlan 800
name Windows
exit
int fa0/2
switchport mode access
switchport access vlan 80
exit
int fa0/3
switchport mode access
switchport access vlan 800
exit
int fa0/1
switchport mode trunk
switchport trunk allowed vlan 80,800
switchport trunk native vlan 1
end
copy running-config startup-config

reload
```
