- `switchport port-security mac-address sticky` en `switch port-security violation restrict`?
- Native VLAN 1 veranderen naar 99 (of andere non-defaultwaarde)
- Management VLAN = interface-VLAN op switch?
- Ook VTP (?)
- Geen DTP, Slide 24 Chapter 2 CN IV


**Ter illustratie**

````

line vty 0 15
transport input ssh
login local
exit
ip ssh version 2
ip ssh authentication-retries 2
ip ssh time-out 60

interface range fa0/1-2
channel-group 1 mode desirable
interface port-channel 1
switchport mode trunk
switchport trunk allowed vlan1,2,20
show etherchannel summary

````




