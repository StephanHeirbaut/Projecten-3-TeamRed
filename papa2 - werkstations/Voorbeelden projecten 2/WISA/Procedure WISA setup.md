# Stappenplan WISA stack
## Windows 2012 R2 + IIS + MySQL of SQLServer + ASP.NET

_Uitgevoerd op een Windows 10 machine._

_**Benodigdheden: Hostmachine: GIT Bash en VirtualBox (minstens v5.1.6) en internetverbinding.**_

_Uitvoeren `.bat`: selecteer het bestand en druk op `<Enter>`._

_Uitvoeren `.ps1` : selecteer het bestand, rechtermuisklik en `Run with PowerShell`._

_Opmerking: indien Chocolatey even "blijft hangen", druk dan op `<Enter>`._

1. Download Vagrant en voer de `.exe` uit, deze voegt Vagrant automatisch toe aan `PATH`.
2. Maak een map aan (hier op de D-schijf) `D:\Vagrant Windows Server 2012 R2` en voer in CMD uit: `vagrant init kensykora/windows_2012_r2_standard`.
3. Normaal gezien wordt er nu een `Vagrantfile` aangemaakt.
4. Voer vervolgens `vagrant box add kensykora/windows_2012_r2_standard` uit.
5. Wacht totdat de Vagrant box gedownload is. Open `~/.vagrant.d/boxes/kensykora-VAGRANTSLASH-windows_2012_r2_standard/0.7.0/virtualbox/Vagrantfile` in een tekstverwerker (bv: Kladblok) en haal lijn 48: `#v.gui = true` uit commentaar (verwijder de `#`).
6. Typ dan `vagrant up` in Git BASH (indien dit niet werkt, typ dan `vagrant global-status` om het ID te weten en typ dan `vagrant up <id>`.
7. Normaal zou nu Virtualbox de VM opstarten (met een GUI).
8. Je kan gebruiker `vagrant` inloggen met paswoord `vagrant` (GUI, opgelet keyboard lay-out-script werd nog niet uitgevoerd, typ dus `vqgrqnt`).
9. Typ `vagrant ssh-config` en `vagrant global-status` om de instellingen te zien.
10. Plaats de folder `files` van [GitHub](https://github.com/HoGentTIN/p2ops-g04/tree/master/opdracht02/WISA/files) met daarin de gemaakte scripts/configuratiebestanden in `D:\Vagrant Windows Server 2012 R2` op je hostmachine (deze komt automatisch ook in de VM).
11. Voer script `mainscript.bat` uit op de VM (GUI). Na uitvoering zal je op de command-line van MySQL terecht komen. Druk vervolgens op `<Enter>` (geen paswoord ingesteld) om toegang te krijgen.
12. Verander het paswoord via MySQL (CMD) op de VM: `mysql> alter user 'root'@'localhost' identified by 'thebowlofpetunias';`.
13. Typ vervolgens `exit` (in de CMD van de VM) om MySQL-commandline af te sluiten.


### Scripts

- `mainscript.bat`: voert `installeerIISDotNetVeranderKeyboard.ps1`, `installChocolateyEnMySQL.bat`, `startMySQL.bat`, login in MySQL en `loginMySQL.bat` uit.

- `installeerIISDotNetVeranderKeyboard.ps1`: installeert IIS, .NET en verandert keyboard-layout naar NL-BE.

- `installChocolateyEnMySQL.bat`: zal Chocolatey (een Windows package manager) en MySQL installeren.

- `startMySQL.bat`: start MySQL (console) op.

- `voegMySQLToeAlsService.bat`: voegt MySQL toe aan PATH. Dit is optioneel omdat Chocolatey dit automatisch zal toevoegen aan PATH.


### Afbeeldingen

![Vagrant Git Bash](img/VagrantGITBASH.PNG)

![Vagrant ssh](img/Vagrantssh.PNG)

![MySQL gebruiker en paswoord veranderd](img/mysqlpassword.PNG)

## Testapplicatie

_Uitvoering via SQL Server en Visual Studio 2015 Professional_

Gebruik `choco install mssqlexpress2014sp1wt` om SQL Express te downloaden. Klik vervolgens bij Installation: `New SQL Server stand-alone installation or add features to an existing installation`, de download komt in `C:\Users\vagrant\AppData\Local\Temp\1\chocolatey\mssqlexpress2014sp1wt\1.1.0` en voer dan` C:\Users\vagrant\AppData\Local\Temp\1\chocolatey\mssqlexpress2014sp1wt\1.1.0\SQLEXPRWT_x64_ENU\SETUP.EXE` uit.

Installeer vervolgens SQL Server.

_Importeer de juiste packages in het .NET-bestand, anders gaf het nog fouten._

Klik op `Publish` op het project in VS (op je hostmachine, volg gewoon de instructies en verander localhost telkens naar `192.168.56.10`), zet ook `Web Management Service` op je VM aan (op `Running`).

![Running](img/running.PNG)

Probeer te pingen naar je VM vanaf je hostmachine, dit moet mislukken.
Open 
`Windows Firewall with Advanced Security` en "Enable Rule" `File and printer sharing - Echo Request ICMPv4)`, doe hetzelfde voor `Remote Desktop`.

![Enable ping](img/enableping.PNG)

![Enable RD](img/enablerd.PNG)


Installeer `Web Deploy 3.6` op je VM. Selecteer `Custom` want `Remote Service` moet ook geïnstalleerd worden.

Typ eventueel `net start msdepsvc`.

Maak een nieuwe regel aan in windows firewall voor poort 80 en 8127 [zie deze tutorial](https://wiki.mcneel.com/zoo/window7firewall).
Beide web-services moeten running zijn!


## Vervolg

Installeer [Microsoft Web Platform Installer 5.0](https://www.microsoft.com/web/downloads/platform.aspx) op de VM-server.
Zoek, selecteer en installeer alles van `Recommended Configuration for Hosting Providers` (dit kan even duren).

Solution Explorer--> Set as StartUp Project en kies de applicatie en **niet** de Tests!

Typ `SQLServerManager12.msc` en volg [deze instructies](http://stackoverflow.com/questions/11278114/enable-remote-connections-for-sql-server-express-2012) of zie hieronder.


**Oude instelling**
![Oude TCP/IP](img/tcpip.PNG)

**Nieuwe instelling**
![Nieuwe TCP/IP](img/tcpip2.PNG)

Herstart de PC (en installeer de updates).
![settings](img/settings.PNG)

**Opmerking:** Laat Microsoft SQL Server draaien op de VM om te kunnen inloggen op de VM!

## Verdere afbeeldingen

![Properties](img/properties.JPG)

De `Properties` van het project in Visual Studio.

![Connection](img/connection.JPG)

De instellingen voor `Connection`.

![Settings](img/settings.JPG)

De `Settings` (vooral de databank).

![Connectionstring](img/connectionstring.JPG)

Verdere databank-instellingen.

![Connectionstring 2](img/connectionstring2.JPG)

![Homepage](img/homepage.JPG)

De homepagina die te zien is (gehost op Server VM).

![Services](img/services.JPG)

De services die aan het draaien zijn.

![inetmgr](img/inetmgr.JPG)

IIS-instellingen.

![SQLMSStudio](img/SQLMSStudio.JPG)

Gebruik MS SQL Server 2014 voor deze testapplicatie.

![mdf](img/mdf.JPG)

![mdf22](img/mdf2.JPG)

Het databankbestand `KlimatogramDatabase.mdf`.

![Users](img/Users.JPG)

Gebruiker `sa` zal gebruikt worden voor deze demonstratie, hiervoor moeten we wel enkele instellingen veranderen, zie hieronder.

![sa](img/sa.JPG)

![sa2](img/sa2.JPG)

![vagrantuser](img/vagrantuser.JPG)

![vagrantuser2](img/vagrantuser2.JPG)


![sqlexpress](img/sqlexpress.JPG)

Volgende opties moeten ook correct staan om verbinding te kunnen maken met de MS SQL Server 2014 op de VM vanaf de hostmachine.

![sqlexpress2](img/sqlexpress2.JPG)

![sqlexpress3](img/sqlexpress3.JPG)

![sqlexpress4](img/sqlexpress4.JPG)

![extrafiles](img/extrafiles.JPG)

Volgende bestanden werden ook toegevoegd. Script `OpenSqlServerPort.bat` zorgt ervoor dat alle poorten die gebruikt worden (of kunnen gebruikt worden) openstaan. `database.sql` zorgt ervoor dat de databank aangemaakt wordt.

Hieronder zijn nog enkele extra voorbeelden ter demonstratie.

![vb1](img/vb1.JPG)
![vb2](img/vb2.JPG)
![vb3](img/vb3.JPG)
![vb4](img/vb4.JPG)
![vb5](img/vb5.JPG)
![vb6](img/vb6.JPG)
![vb7](img/vb7.JPG)
![vb8](img/vb8.JPG)
![vb9](img/vb9.JPG)
