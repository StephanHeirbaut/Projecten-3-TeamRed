# **Testplan Alfa 2**
## Stap 1: Installatie Windows Server 2016
### GUI
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Server Manager* indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op *Server Manager* te klikken.
4. Nadat *Server Manager* geopend is, klik op *Local Server* dat je links in de pagina terug kan vinden.
5. Controller of het *Operating system version* op `Windows Server 2016 Standard` staat.
### CMD
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Command Prompt*
	1. Klik op het vergrootglas in de taakbalk;
	2. type `cmd` en druk op *enter*;
4. Type `winver` en druk op *enter*;
5. Controller of het *Operating system version* op `Windows Server 2016 Standard` staat.
## Stap 2: Netwerkinstellingen
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Command Prompt*
	1. Klik op het vergrootglas in de taakbalk;
	2. type `cmd` en druk op enter;
4. Type `ipconfig` en druk op enter.
5. Het IP-adres moet als volgt geconfigureerd zijn: 
- IP-address: 172.18.2.67 (OF 172.18.0.2)
- Netmask: 255.255.0.0 (OF 255.255.255.0)
- Default Gateway: 172.18.2.65 (OF 172.18.0.1)
- DNS: 172.18.2.67
## Stap 3: Active Directory Domain Cervices
### Installatie
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Server Manager* indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op *Server Manager* te klikken.
4. Indien er aan de linkerkant `AD DS` en `DNS` staat, zijn de rollen succesvol geïnstalleerd.
### Functionaliteit
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Start een **workstation**.
4. **Verbind het workstation** via kabel met Alfa2. (Kan adhv één switch, router, of rechtstreeks verbonden.)
4. **Verander de netwerkconfiguratie van het workstation** zodat het in hetzelfde netwerk ligt als de server, dit doe je door de inststructies op [deze pagina](https://support.microsoft.com/nl-be/help/15089/windows-change-tcp-ip-settings) te volgen (stap 5 moet je niet uitvoeren aangezien we niet werken met IPv6). Geef de volgende netwerkinformatie in voor het configureren van het netwerk:
- IP adres: 172.18.2.70 (OF 172.18.0.99)
- Subnetmask: 255.255.0.0 (OF 255.255.255.0)
- Default Gateway: 172.18.2.65 (OF 172.18.0.1)
- DNS Server: 172.18.2.67 (OF 172.18.0.2)
3. Maak na de netwerkconfiguratie het workstation lid van het domein. Om dit te doen volg de volgende stappen:
	1. Open **File Explorer**;
	2. Right-Mouse Click op **Mijn computer**, en selecteer **eigenschappen**;
	3. Klik daarna op **Instellingen wijzigen** in het gedeelte *Instellingen voor computernaam, domein en werkgroep*;
	4. Een nieuwe pagina opent. Klik op **Wijzigen**;
	5. Vink daarna het bolletje **domein** aan en geef als domeinnaam `red.local` in. Druk op *enter* op het toetsenbord.
	6. Een nieuwe pagina opent, waarin er een gebruikersnaam & een wachtwoord wordt gevraagd. **Vul de volgende info in**:
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
	Druk op *enter*.
	7. Indien succevol, zal een pop-up verschijnen die je verwelkomt in het domain red.local. **Herstart het workstation**.
	8. Log in op het workstation met de volgende info:
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345


## Server naam en domein naam

### GUI
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Server Manager* indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op *Server Manager* te klikken.
4. Nadat *Server Manager* geopend is, klik op *Local Server* dat je links van de pagina terug kan vinden.
5. Controlleer of de *Computer Name* op **ns1** en het *Domain* op **red.local** staat.
### CMD

1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Command Prompt*
	1. Klik op het vergrootglas in de taakbalk;
	2. type `cmd` en druk op *enter*;
4. Type `HOSTNAME` en druk op *enter*;
5. Indien er **ns1** verschijnt, is de naam goed geconfigureerd.
5. Type `wmic computersystem get domain` en druk op *enter*;
6. Indien er **red.local** verschijnt, is dat ook goed geconfigureerd.

## Gebruikersgroepen, gebruikers en werkstations

### Gui
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Server Manager* indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op *Server Manager* te klikken.
4. Nadat *Server Manager* geopend is, **klik op Tools** dat je rechts bovenaan in de pagina terug kan vinden;
5. **Klik op Active directory users and computers** in het drop-down menu.
6. Een nieuwe pagina opent. **Klap red.local uit**.
7. In de subfolders van *red.local*, **Open RED**.
8. Daarin moet je de volgende mappen terug kunnen vinden:
 - Administratie
 - Directie
 - IT Administratie
 - Ontwikkeling
 - Verkoop
 - Werkstation
9. In elk van de bovenstaande mappen (behalve in de map Werkstation" moet je een groep met dezelfde naam en met minstens één gebruiker terug kunnen vinden.
10. Indien dat het geval is, zijn de groepen goed aangemaakt.
11. In de map "Werkstation" moet je vijf werkstations terug kunnen vinden met de volgende namen:
 - AClient
 - DClient
 - ITClient
 - OClient
 - VClient
12. Als laatst controleren we of de gebruikers tot de juiste groep(en) behoren. Dit doen we als volgt:
 - Bezoek één per één iedere map in **stap 8**; 
 - Right-mouse click op de group die in de map zit. **Klik op eigenschappen**;
 - **Klik** daarna op de tab "Members";
 - Indien je daar de gebruikers als volgt kan terug vinden, is alles goed geconfigureerd:
 
| Groep            | Gebruiker(s)                 |
|------------------|------------------------------|
| Administratie    | John Smet 	|
| Directie         | Lien Smet 	|
| IT Administratie | Henry Smet	|
| Ontwikkeling     | Laura Smet |
| Verkoop          | Dirk Smet	|


### CMD
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Command Prompt*
	1. Klik op het vergrootglas in de taakbalk;
	2. type `cmd` en druk op *enter*;
4. Type `dsa.msc` in en klik op enter. *Active directory users and computers* wordt geopend.
5. Volg hierna de GUI sectie vanaf stap 5

## Inloggen op computer

Tijdens het uitwerken van de policies test je ook of de gebruikers zijn aangemaakt en of je kan inloggen op de computers.

## Policies

*Indien je al een workstation hebt opgezet om Active Directory Domain Services te testen, hoef je stap 5 & 6 niet meer te doen.*

1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Start een **workstation**.
4. **Verbind het workstation** via kabel met Alfa2. (Kan adhv één switch, router, of rechtstreeks verbonden.)
5. **Verander de netwerkconfiguratie van het workstation** zodat het in hetzelfde netwerk ligt als de server, dit doe je door de inststructies op [deze pagina](https://support.microsoft.com/nl-be/help/15089/windows-change-tcp-ip-settings) te volgen (stap 5 moet je niet uitvoeren aangezien we niet werken met IPv6). Geef de volgende netwerkinformatie in voor het configureren van het netwerk:
- IP adres: 172.18.2.70 (OF 172.18.0.99)
- Subnetmask: 255.255.0.0 (OF 255.255.255.0)
- Default Gateway: 172.18.2.65 (OF 172.18.0.1)
- DNS Server: 172.18.2.67 (OF 172.18.0.2)
6. Maak na de netwerkconfiguratie het workstation lid van het domein. Om dit te doen volg de volgende stappen:
	1. Open **File Explorer**;
	2. Right-Mouse Click op **Mijn computer**, en selecteer **eigenschappen**;
	3. Klik daarna op **Instellingen wijzigen** in het gedeelte *Instellingen voor computernaam, domein en werkgroep*;
	4. Een nieuwe pagina opent. Klik op **Wijzigen**;
	5. Vink daarna het bolletje **domein** aan en geef als domeinnaam `red.local` in. Druk op *enter* op het toetsenbord.
	6. Een nieuwe pagina opent, waarin er een gebruikersnaam & een wachtwoord wordt gevraagd. **Vul de volgende info in**:
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
	Druk op *enter*.
	7. Indien succevol, zal een pop-up verschijnen die je verwelkomt in het domain red.local. **Herstart het workstation**.

7. **Log in met de volgende gebruikers**. In de derde kolom wordt beschreven wat normaal gezien niet moet werken. Indien dat klopt zijn de policies goed geconfigureerd.

| Groep            | Gebruikersnaam en wachtwoord                |Beperking                 |
|------------------|------------------------------|------------------------------|
| Administratie    | John.Smet@red.local - P@ssword |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu, eigenschappenvan de netwerkadapters kan niet geopend worden |
| Directie         | Lien.Smet@red.local - P@ssword |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu                |
| IT Administratie | Henry.Smet@red.local - P@ssword |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu                 |
| Ontwikkeling     | Laura.Smet@red.local - P@ssword |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu             |
| Verkoop          | Dirk.Smet@red.local - P@ssword |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu, eigenschappenvan de netwerkadapters kan niet geopend worden                |




## Fileserver
*Indien je al een workstation hebt opgezet om Active Directory Domain Services te testen, hoef je stap 5 & 6 niet meer te doen.*

**PREREQUISITE:** `Lima2` moet verbonden zijn met `Alfa2` en aanstaan.

1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Start een **workstation**.
4. **Verbind het workstation** via kabel met Alfa2. (Kan adhv één switch, router, of rechtstreeks verbonden.)
5. **Verander de netwerkconfiguratie van het workstation** zodat het in hetzelfde netwerk ligt als de server, dit doe je door de inststructies op [deze pagina](https://support.microsoft.com/nl-be/help/15089/windows-change-tcp-ip-settings) te volgen (stap 5 moet je niet uitvoeren aangezien we niet werken met IPv6). Geef de volgende netwerkinformatie in voor het configureren van het netwerk:
- IP adres: 172.18.2.70 (OF 172.18.0.99)
- Subnetmask: 255.255.0.0 (OF 255.255.255.0)
- Default Gateway: 172.18.2.65 (OF 172.18.0.1)
- DNS Server: 172.18.2.67 (OF 172.18.0.2)
6. Maak na de netwerkconfiguratie het workstation lid van het domein. Om dit te doen volg de volgende stappen:
	1. Open **File Explorer**;
	2. Right-Mouse Click op **Mijn computer**, en selecteer **eigenschappen**;
	3. Klik daarna op **Instellingen wijzigen** in het gedeelte *Instellingen voor computernaam, domein en werkgroep*;
	4. Een nieuwe pagina opent. Klik op **Wijzigen**;
	5. Vink daarna het bolletje **domein** aan en geef als domeinnaam `red.local` in. Druk op *enter* op het toetsenbord.
	6. Een nieuwe pagina opent, waarin er een gebruikersnaam & een wachtwoord wordt gevraagd. **Vul de volgende info in**:
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
	Druk op *enter*.
	7. Indien succevol, zal een pop-up verschijnen die je verwelkomt in het domain red.local. **Herstart het workstation**.
7. **Log in met de volgende gebruikers**. Bij elk gebruiker moeten enkel de volgende shares te zien zijn als je *File Explorer* opent. Voer in elk folder de acties onder *Testing* uit:

| Gebruikersnaam en wachtwoord| Zichtbare Shares|Permissions|Testing |
|-----------|---------------------|---------------------|---------------------|
| John.Smet@red.local - P@ssword|ITData|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | VerkoopData|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | OntwikkelingData|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | DirData|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | AdminData|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ShareVerkoop|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | HomeDirs|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ProfileDirs|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| Lien.Smet@red.local - P@ssword |AdminData|Read, Write|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | HomeDirs |Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ProfileDirs|Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| Henry.Smet@red.local - P@ssword |DirData |Read, Write|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | HomeDirs |Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ProfileDirs|Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| Laura.Smet@red.local - P@ssword |OntwikkelingData|Read, Write|Voeg een bestand toe, wijzig en sla op, en verwijder|
||ShareVerkoop|Read|Lees een bestand dat al toegevoegd is in het map. Verwijderen en wijzigen zou niet mogen lukken.|
| | HomeDirs |Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ProfileDirs|Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| Dirk.Smet@red.local - P@ssword|VerkoopData|Read, Write|Voeg een bestand toe, wijzig en sla op, en verwijder|
| |ShareVerkoop | Read, Write | Voeg een bestand toe, wijzig en sla op, en verwijder|
| | HomeDirs |Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ProfileDirs|Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|





