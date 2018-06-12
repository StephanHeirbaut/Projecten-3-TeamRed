# Testplan
## Fysiek
!!!! Let op, de ip-adres kan elk moment gewijzigd worden. Momenteel is er een willekeurige ip-adres instellingen gekozen.:
- IP-adres: 172.18.0.6
- Subnetmask: 255.255.255.0
- Default-Gateway: 172.18.0.1
- DNS: 172.18.0.2 en 172.18.0.3<br>
!!!!
1. Sluit de DHCP server aan de switch, start het en log in met de volgende wachtwoord: Aa12345. 
2. Controleer of de ip adres van de server goed geconfigureerd is. Open hiervoor CMD, type ipconfig en druk op enter. Indien de ip-adres als volgt geconfigureerd is, is het goed:
- IP-adres: 172.18.0.6
- Subnetmask: 255.255.255.0
- Default-Gateway: 172.18.0.1
- DNS: 172.18.0.2 en 172.18.0.3
3. Sluit je eigen computer ook aan de switch.
4. Open CMD op je eigen computer, type `ipconfig /release` en druk op enter.
6. Wacht een beetje en type daarna in CMD `ipconfig` en druk op enter.
5. Indien je een ip-adres binnen het range 172.18.0.50-172.18.0.100 met subnetmask 255.255.255.0 met Default-Gateway: 172.18.0.1 en met DNS 172.18.0.2 en/of 172.18.0.3 hebt gekregen klopt alles en is de DHCP Sevrer goed geconfigureerd.

