# Testplan

In deze iteratie gaan we een MSCS lokaal installeren en configureren om in een eerste poging alles in orde te brengen. Zodanig dat we daarna alles kunnen automatiseren.

## Requirements

- Doel: Na het lezen van dit testplan moeten de testers instaat zijn om in 5 minuten te kunnen uitleggen hoe je de Papa2-server lokaal moet installeren
- Geschatte tijd: 02/09 tot 09/10

## Testplan

|Objectief|Korte beschrijving|Uitgevoerd|
|---------|------------------|-------|
|Documentatie|De uitleg met hoe we te werk zijn gegaan om MSCS lokaal te installeren.|X|
|Test rapport|Er is een rapport geschreven over het testplan|X|
|Resources|De nodige ondersteunende filmpjes en uitleg zoeken op YouTube en Google, om toch al eens (half) te zien hoe het moet.|X|

## Documentation

Ga als eerste naar ADSI Edit onder Server Manager en Tools. Controleer of ADSI Edit een verbinding heeft, er zou een object met de naam Default naming context moeten staan. Controleer ook in dit scherm of System Management is aangemaakt onder CN=System.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestplan/HandmatigInstalleren/adsiedit05.png)

Ga vervolgens naar Active Directory Users and Computers (onder Server Manager, Tools) en controleer of de Advanced Features aanstaan (onder View). Controleer vervolgens of de primary site server computer account rechten heeft tot het System Management object onder System, door te rechterklikken op System Mangement, Properties en onder Security te kijken of Administrators, Enterprise Admins en Domain Admins alle rechten hebben op deze folder.

Open hierna Server manager en Tools nog eens om te controleren of de nodige roles, role services en features zijn geïnstalleerd.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestplan/HandmatigInstalleren/web01.png)
![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestplan/HandmatigInstalleren/web02.png)
![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestplan/HandmatigInstalleren/web03.png)
![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestplan/HandmatigInstalleren/wsus01.png)
![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestplan/HandmatigInstalleren/wsus02.png)

Controleer ook of de Windows ADK geïnstalleerd is door op de Windows-toets te drukken en naar Apps te gaan. Scroll tot het einde en onder Windows Kits.

Klik hierna nog eens op Tools onder Server Manager en open vervolgens Group Policy manage console. Controleer of er hier 2 GPO's (Client Push Policy Settings en SQL ports for SCCM) zijn aangemaakt. Rechterklik vervolgens op deze GPO's en kijk vervolgens onder Windows Settings, Security Settings, Windows Firewall with Advanced Settings bij de Inbound Rules en Outbond Rules of de uitzondering voor File and Printer Sharing services en poorten 1433 en 4022 zijn toegevoegd.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestplan/HandmatigInstalleren/inbound.PNG)
![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestplan/HandmatigInstalleren/outbound.PNG)
![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestplan/HandmatigInstalleren/oo09.png)

Controleer vervolgens of er een installatie is uitgevoerd van MS SQL server 2014 door op de Windows-toets te duwen en SQL 2014 te typen. Open deze niet!



Controlleer tenslotte of System Center 2012 R2 correct is geinstalleerd door het programma te openen.

## Test report

Client Push Policy in-en outbound rules toevoegen.

## Resources

De nodige documentatie hebben we verzameld en opgeslaan en in [dit bestand](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/Links.md)
