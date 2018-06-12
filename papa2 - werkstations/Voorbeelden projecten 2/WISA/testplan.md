# Testplan WISA


## Opzetten website via Powershell

_Installeer eerst alles ervoor (IIS, ASP.NET, etc.)_

`Get-Website –Name ‘Default Web Site’ | Start-Website` (om zeker te zijn)

Om je published package te uploaden (Visual Studio -> Build -> Publish project (maakt een .ZIP).



## Controleren installatie IIS en ASP.NET

Typ `Get-WindowsFeature -name web-server` en `Get-WindowsFeature -Name Web-Asp-Net45`

**Verwacht resultaat: Beide moeten geïnstalleerd zijn.**


## Controleren installatie (websites) IIS Management Console

_2 mogelijkheden:_

1. Typ`inetmgr` in Windows-Run (Windowsknop + R). Bekijk dan bij Sites: Sites -> Connections (als je een configuratiescherm krijgt dan is IIS geïnstalleerd).
2. Typ `Get-Website` om de actieve websites te zien, een poort kan maar 1 actieve website ondersteunen.

(In Linux -> `curl -I <ip-adres>`)

**De huidige (indien geen toegevoegd zal de default website alleen verschijnen) website wordt getoond.**

## Controleren connectie via Powershell
`Invoke-WebRequest <ip-adres>`

**Verwacht resultaat: Er mogen geen foutboodschappen verschijnen.**

## Controleren installatie MySQL

`C:\MySQL\mysql-5.7.17-winx64\bin>mysql --version"`

Uitvoer= `mysql  Ver 14.14 Distrib 5.7.17, for Win64 (x86_64)`

**Verwacht resultaat: MySQL werd correct geïnstalleerd (met de juiste versie).**

## Controleren default/dummy databank MySQL

In de MySQL command line: typ `show databases;` (de `;` is zeer belangrijk!).

**Verwacht resultaat: de databanken wordt getoond, zie afbeelding.**


## Connectiviteit (PC)

- Is de TCP/IP correct geïnstalleerd en werkt de netwerkkaart van de computer?

**Verwacht resultaat: De meeste packets zouden ontvangen moeten worden.**

- Kan deze computer andere computers bereiken?

**Verwacht resultaat: De meeste packets zouden ontvangen moeten worden.**


## Configuratie IP-toekenning (PC)

- Heeft deze PC het correcte IP-adres en Default Gateway toegekend gekregen?

**Verwacht resultaat: Bij `IP Address` staat het overeenkomstige IP-adres en Default Gateway. (Voor deze opdracht: Default Gateway werd nog niet geconfigureerd).**

## Configuratie MAC-toekenning (PC)

- Heeft deze PC het correcte MAC-adres toegekend gekregen?

**Verwacht resultaat: Bij `MAC Address` staat het overeenkomstige MAC-adres `080027C52EF7`.**

## SSH-connectie

- Is het mogelijk om via Vagrant de VM te verbinden via SSH?

`vagrant ssh <ip-adres>`

_IP-adres kan optioneel zijn._

**Verwacht resultaat: Het is mogelijk om via Vagrant verbinding te maken met de VM.**

## Map files op VM

- Staan de meegeleverde bestanden (map: `files`) op de virtuele machine?

**Verwacht resultaat: Deze zouden normaal gezien meegeleverd moeten zijn.**

## Werd MySQL toegevoegd als aan PATH?

**Verwacht resultaat: `mysql -u root -p` intypen in CMD zou herkend moeten worden (en je op de login terecht laten komen).**


## Heeft de aangemaakte gebruiker in de VM als naam `Vagrant` met paswoord `vagrant`?

**Verwacht resultaat: De standaardgebruiker moet `Vagrant` zijn met paswoord `vagrant`.**

## Staat `ExectionPolicy` op de VM op `Unrestricted`?

**Verwacht resultaat: De `ExectionPolicy` moet op `Unrestricted` staan.**

## Worden de scripts correct uitgevoerd?

**Verwacht resultaat: Er komen geen foutboodschappen op (buiten de, ondanks successvolle, installatie van MySQL via Chocolatey).**
