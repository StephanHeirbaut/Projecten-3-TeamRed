# Testplan November2

* Verantwoordelijke uitvoering: Maarten De Smedt

* Verantwoordelijke testen: Robin D'Hondt

## Server opzetten + Aanmelden

Server werkt zonder problemen.


## Testen

### IP - Server Name - Domein

### IP

Na het runnen van het eerste script, en een ipconfig/all in cmd, kloppen alle ip instellingen voor November2.


#### Computernaam en Domein

De computernaam is November2 en zit in het domein red.local.


### Aanmaken Directories

Na het runnen van het tweede script, ga ik naar C:\Program Files, daar staat de map Microsoft SQL Server, deze stap is ook geslaagd.


### Java en .Net Installatie 

#### Java

Na het runnen van het derde script, ga ik naar control panel --> Programma's, hier staat er Java 8, Java is correct geïnstalleerd.

#### .Net

Na uitvoeren van het commando _Get-WindowsFeature Net-Framework-Core_ in Powershell, staat er dat .NET geïnstalleerd is, deze stap is geslaagd.

### Firewall

Ik ga naar Control panel --> Windows Firewall --> advanced settings --> Inbound Rules, daar staat de rule _MSSQL ENGINE TCP_, dit onderdeel is geslaagd.


### SQl Server

Ik run het 4de script, ik kan SQL Management Studio openen en connecteren met de Server.
Dit is dus Correct geïnstalleerd.

## Samenvatting

De server is volledig en correct geïnstalleerd.
