# Testplan issue #5: Configuratie switchen en routers lokaal netwerk

* Verantwoordelijke uitvoering: Laurens en Robin
* Verantwoordelijke testen: Ebu en Pieter

## Wat moet getest worden

In de map Netwerk -> files -> Lokaal netwerk vind je de file **Netwerk-red-local-AFGEWERKT.pkt**. Hierin
kan je elk apparaat van ons lokaal netwerk terugvinden met zijn correcte configuratie. Alles wat momenteel al is ingesteld in de Packettracer, staat beschreven in het document **VLSM-red.pdf** en in de map Netwerk -> configuratie lokaal netwerk.

## Testwijze

1. Open de Packet-tracer en kijk of alle apparaten hun interface direct correct zijn (worden alle bolletjes groen?)(behalve tussen router en firewall).
2. Ga na of er fouten terug te vinden zijn onze configuratie-bestanden.
3. Ga na in de PT of je van bijvoorbeeld VLAN 300 kan pingen naar de firewallpoort, of van VLAN 500 naar VLAN 200 (een pc met DHCP).
4. Check of onze default route altijd verwijst naar de firewall, zodat alle verkeer dat niet bestemd is voor ons lokaal netwerk, naar Router1 wordt geduwd.
5. Ga na of je vanaf een server uit een bepaalde vlan kan SSH'en naar een switch of routerswitch uit een andere VLAN.

## Wat bevat het testrapport?

Antwoorden op de vragen hieronder, gestaafd met afbeeldingen
