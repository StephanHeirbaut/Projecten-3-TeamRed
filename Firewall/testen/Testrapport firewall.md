# Testrapport firewall

Verantwoordelijke testen: Pieter en Ebu

## Uitvoering testplan

### Configuratie

We kunnen de informatie over configuratie van de firewall uit de XML of PDF halen. Hierin zien we dat de protocollen van het LAN toegelaten worden, DNS-resolving uit staat, hostname en timezone geconfigureerd zjin, DNS-servers met domeinnaam en upstream WAN ook in orde is, en dat de interfaces ook correct zijn.


### Opstelling (connectiviteit) testen

We gebruiken de opstelling van de PT.

We stellen ook alles in zoals aangegeven in [het testplan](https://github.com/HoGentTIN/p3ops-red/blob/master/Firewall/testen/Testplan.md)

We stellen vast dat we vanaf de router (in het intern netwerk) en een client (hier een server met een statisch IP-adres) alle apparaten kunnen bereiken (dus ook over/door de firewall heen).

![connectiviteit](https://github.com/HoGentTIN/p3ops-red/blob/master/Firewall/testen/firewall%20afbeeldingen/connectiviteit.png)
![firewall](https://github.com/HoGentTIN/p3ops-red/blob/master/Firewall/testen/firewall%20afbeeldingen/firewall.jpg)
![ping](https://github.com/HoGentTIN/p3ops-red/blob/master/Firewall/testen/firewall%20afbeeldingen/ping.jpg)
![opstelling1](https://github.com/HoGentTIN/p3ops-red/blob/master/Firewall/testen/firewall%20afbeeldingen/opstelling1.jpg)
![opstelling2](https://github.com/HoGentTIN/p3ops-red/blob/master/Firewall/testen/firewall%20afbeeldingen/opstelling2.jpg)
![testrouter](https://github.com/HoGentTIN/p3ops-red/blob/master/Firewall/testen/firewall%20afbeeldingen/testrouter.jpg)
