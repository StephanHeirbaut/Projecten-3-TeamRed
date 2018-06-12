# papa2

Een member server in het domein red.local.
Deze server is een Microsoft System Center Server. Gebruik steeds de meest recente versie. Deze server is verantwoordelijk voor het deployen van Windows 7 Enterprise en/of Windows 10 Enterprise images naar de Windows clients in VLAN 200. Daarnaast zorgt deze server voor alle Windows en Office updates voor zowel de clients als deservers.
Deze Server moet ook in staat zijn om een aantal basis applicaties te deployen op de client PC’s. Volgende apllicaties moeten zeker kunnen uitgerold worden:
*  Office 2013 of Office 2016
*  Adobe Acrobat Reader laatste versie.
*  Java Packages laatste versie.
*  Adobe Flash componenten voor IE en Firefox.3.6 

# Werkstations VLAN 20 en VLAN 200

Configureer op zijn minst 5 client pc’s waar een gebruiker kan op inloggen, e-mail kan lezen, envan waar de publieke en private services van het eigen en publieke services van andere domeinenkunnen getest worden. Elk van deze PC’s is lid van één van gespecifieerde afdelingen in de directorystructuur (AD voorWindows en OpenLDAP voor Linux). Zorg ervoor dat elke afdeling minimaal met 1 PC voorzien is.
