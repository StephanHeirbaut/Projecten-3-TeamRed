# Configuraties

Switch routering gaat uit van MAC-adressen, dus zorg ervoor dat alle servers en computers een verschillend MAC-adres heeft in zijn configuratie.

Switchen kunnen hersteld worden door:
1. de power van de switch af te leggen, en terug in te steken
2. vervolgens direct de mode-button ingedrukt houden tot de System-Led niet-knipperend groen is, dan mag je de knop loslaten.

IP-info moet aangewezen worden aan een svi.
Als je de switch wilt managen vanop een netwerk-op-afstand, moet er een default-gateway geconfigureerd zijn.
Switchen kunnen geen layer-3 packetten routeren.

gebruik `show ip interface brief` om te checken welke interfaces aanstaan.

Auto-MDIX instellen op alle poorten (dit is default).

Port-security staat default af, maar we kunnen mogelijks wel gebruiken indien gewenst.

Elke VLAN is een broadcast-domein.

VLAN's zijn geïsoleerd, en pakketten kunnen elkaar passeren tussen hen via een router.

Default is VLAN 1 de default native VLAN.

Layer-2 swithen kunnen geen traffic forwarden tussen VLAN's zonder de assistentie van een router.
Inter-VLAN routing is een proces om netwerk van het ene VLAN naar het andere te forwarden.
* https://supportforums.cisco.com/t5/getting-started-with-lans/in-a-single-switch-2-vlans-are-created-if-we-want-to-communicate/td-p/2095334 (zie post van Kenneth Sharp)

ACL's -> vergeet niet dat ze wildcard's gebruiken ipv subnetmasks
ACL's plaatsen zo dicht mogelijk bij de bestemming (standaard ACL's)

We gebruiken USB-poort om te back-uppen en te restoren.
1. dir usbflash0
2. copy run usbflash0:/... of copy usbflash0:/... running-config

op MLS -> gebruik commando `no switchport` om interface te gebruiken met ip-adressen en subnetmasks.

## Switch 4 en Switch 7

- Ze behoren elk maar tot 1 Vlan, maak hiervoor een interface, geef per interface een description mee en doe `no shutdown`
- Stel de default-gateway in voor de switch naar de volgende switch/router
- Stel een naam in voor de device
- zorg dat de console en de ssh beveiligd zijn met een wachtwoord
- configureer een banner om duidelijk te maken dat niet iedereen wijzigingen mag aanbrengen
- Sla ook op het einde de huidige configuratie op in de startup-configuratie
- Configureer ssh op alle switchen, met `ip domain-name red.local`. Zorg dat het versie 2 is.
- Disable alle poorten die niet gebruikt zullen worden!
- Aparte Management-VLAN?
- Trunks voorzien, zien welke VLAN's over netwerk mogen gaan.
- Wat is de Native VLAN?
- VLAN ACL's instellen (http://www.ciscopress.com/articles/article.asp?p=1181682&seqNum=4)
(https://www.youtube.com/watch?v=PwKkwS-BzAg)
- CDP (device discovery) misschien instellen?
- STP niet nodig (geen redundante paden)
- Mogelijks EtherChannel toepassen (poorten moeten allemaal dezelfde snelheid, duplex en VLAN hebben).



## Switch 5 en Switch 6

- Maak voor elke VLAN die aan de switch direct gekoppeld is een interface, geef per interface een description mee en doe `no shutdown`
- Stel de default-gateway in voor de switch naar de volgende switch/router
- Stel een naam in voor de device
- zorg dat de console en de ssh beveiligd zijn met een wachtwoord
- configureer een banner om duidelijk te maken dat niet iedereen wijzigingen mag aanbrengen
- Sla ook op het einde de huidige configuratie op in de startup-configuratie
- Als ze enkel voor een switch worden aanzien (en dus niet als router), dan kunnen er geen routing protocollen ingesteld worden, pok geen statische routering.
- Configureer ssh op alle switchen, met `ip domain-name red.local`. Zorg dat het versie 2 is.
- Disable alle poorten die niet gebruikt zullen worden!
- Aparte Management-VLAN?
- Trunks voorzien!
- Wat is de Native VLAN?
- VLAN ACL's instellen (http://www.ciscopress.com/articles/article.asp?p=1181682&seqNum=4)
(https://www.youtube.com/watch?v=PwKkwS-BzAg)
- Router-on-a-stick voorzien om tussen verschillende VLAN's te kunnen babbelen
- stel DHCP-relay in op deze router, zodat de DHCP-server gemakkelijk gevonden kan worden. `ip helper-address ...`
- CDP (device discovery) misschien instellen?
- van Switch6 een NTP-server maken?
- STP niet nodig (geen redundante paden)
- Mogelijks EtherChannel toepassen (poorten moeten allemaal dezelfde snelheid, duplex en VLAN hebben).
