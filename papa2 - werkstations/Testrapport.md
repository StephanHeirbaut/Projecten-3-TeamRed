# Testrapport

* Verantwoordelijke uitvoering: team Papa2
* Verantwoordelijke testen: Arto Collumbien

## ADSI Edit

Ga als eerste naar ADSI Edit onder Server Manager en Tools. Controleer of ADSI Edit een verbinding heeft, er zou een object met de naam Default naming context moeten staan. Controleer ook in dit scherm of System Management is aangemaakt onder CN=System.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/1.jpg)

**Gecheckt en in orde**

## Services, roles, en features

Ga vervolgens naar Active Directory Users and Computers (onder Server Manager, Tools) en controleer of de Advanced Features aanstaan (onder View). Controleer vervolgens of de primary site server computer account rechten heeft tot het System Management object onder System, door te rechterklikken op System Mangement, Properties en onder Security te kijken of Administrators, Enterprise Admins en Domain Admins alle rechten hebben op deze folder.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/2.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/3.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/4.jpg)

**Gecheckt en in orde**

Open hierna Server manager en Tools nog eens om te controleren of de nodige roles, role services en features zijn geïnstalleerd.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/5.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/6.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/7.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/8.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/9.jpg)

**Gecheckt en in orde**

## Group Policy

Controleer ook of de Windows ADK geïnstalleerd is door op de Windows-toets te drukken en naar Apps te gaan. Scroll tot het einde en onder Windows Kits.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/10.jpg)

**Gecheckt en in orde**

Klik hierna nog eens op Tools onder Server Manager en open vervolgens Group Policy manage console. Controleer of er hier 2 GPO's (Client Push Policy Settings en SQL ports for SCCM) zijn aangemaakt.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/11.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/12.jpg)

**Gecheckt en in orde**

Rechterklik vervolgens op deze GPO's en kijk vervolgens onder Windows Settings, Security Settings, Windows Firewall with Advanced Settings bij de Inbound Rules en Outbond Rules of de uitzondering voor File and Printer Sharing services en poorten 1433 en 4022 zijn toegevoegd.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/13.jpg)

**Gecheckt en in orde**

Controleer vervolgens of er een installatie is uitgevoerd van MS SQL server 2014 door op de Windows-toets te duwen en SQL 2014 te typen. Open deze niet!

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/15.JPG)

**Gecheckt en in orde**

Controlleer tenslotte of System Center 2012 R2 correct is geinstalleerd door het programma te openen.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/14.jpg)

**Gecheckt en in orde**
