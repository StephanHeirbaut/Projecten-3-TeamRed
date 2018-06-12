# Testplan November2



* Verantwoordelijke uitvoering: Maarten De Smedt

* Verantwoordelijke testen: Robin D'Hondt



## Server opzetten + Aanmelden

1. Start windows met de booteable USB.

2. Doorloop de installatie

3. Meld aan met deze instellingen

	- **Gebruikersnaam:** Administrator

	- **Wachtwoord:** Projecten3Nov2



## Testen

### IP - Server Name - Domein

### IP

1. Run het eerste script

2. Doe een ipconfig/all.

3. Dit moeten de waarde zijn:

	- **IP-Address:** 172.18.2.5

	- **Netmask:** 255.255.255.224

	- **Default Gateway:** 172.18.2.1

	- **Preffered DNS:** 172.18.2.67

	- **Alternate DNS:** 172.18.2.68

4. Als dit klopt is het netwerk correct geconfigureerd.



#### Computernaam

1. Ga naar de server manager

2. Ga daar naar Local Server

3. De computer naam moet **November2** zijn.

4. Als dit zo is heeft het de correcte computernaam



#### Domein

1. Ga naar de server manager

2. Ga daar naar Local Server

3. Het domein naam moet **Red.local** zijn.

4. Als dit zo is heeft het de correcte domeinnaam



### Aanmaken Directories

1. Restart aller eerst de computer en meld aan op het domein

2. Run het 2de script

3. Ga naar C:\Program Files

4. Als hier de map Microsoft SQL Server staat is dit gelukt



### Java en .Net Installatie 

#### Java

1. Run het 3de script

2. Ga naar Control panel --> Programma's

4. Bij de programma's moet **Java 8** staan.

5. Als dit zo is, is Java geïnstalleerd. 



#### .Net

1. Open powershell 

2. Run het commando **Get-WindowsFeature Net-Framework-Core**

3. Als je het vindt is het correct geïnstalleerd.



### Firewall

1. Run het 4de script

2. Open het Control Panel of Configuratie Scherm.

3. Ga daarna naar Windows Firewall.

4. Klik op advanced settings.

5. Klik op Inbound Rules.

6. Daar moet de rule **MSSQL ENGINE TCP** staan.

7. Als je deze vindt is de rule toegevoegd.



### SQl Server

1. Run het 5de script

2. Open na de installatie SQL Management Studio

3. Als je dit kunt openen en connecteren met de Server is het correct geïnstalleerd

