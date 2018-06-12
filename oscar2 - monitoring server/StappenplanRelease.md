# Stappenplan Release

- Box installeren

- Bestanden overzetten

- Chrome installeren

  * dependency: internet nodig, niet in domein, geen ip ingesteld

- PRTG installeren

  * dependency: internet nodig, niet in domein, geen ip ingesteld

- PRTG opstarten
  * dependency: PRTG geinstalleerd, internet nodig



## Automatische installaties

1. In hyper-v, check de instellingen voor de virtuele switch adapter.
Deze moeten we op Wi-Fi staan, zo heeft de installatie verbinding met internet.

![vlan](https://github.com/HoGentTIN/p3ops-red/tree/master/oscar2%20-%20monitoring%20server/img/switch.JPG)

2. 'vagrant up' op de locatie van vagrantfile. Hierna ongeveer 14 minuten wachten.

3. Script runnen voor PRTG te installeren en ip adressering. (Admin1.ps1 en admin2.ps1)

5. In hyper v manager, pas de switch instellingen aan (juiste ip instellingen en vlan)









## Configuratie PRTG

1. Voeg 9 servers toe met de templates. Gebruik hiervoor de IP adressen van de template. (Voor de 2 dc's gebruik de DNSTemplate)

2. Tijd om te testen!

3. Als de services klaar zijn volg dan documentatie voor de juiste sensors toe te voegen. (vanaf .7 onder PRTG configureren)
