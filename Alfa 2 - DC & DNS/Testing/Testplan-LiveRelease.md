# **Testplan Alfa 2**
## Installatie Windows Server 2016
1. Log in op Alfa 2:
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
2. Open *Command Prompt*;
3. Type `winver` en druk op *enter*;
4. Controller of het *Operating system version* op `Windows Server 2016 Standard` staat.

## Netwerkinstellingen
1. Log in op Alfa 2:
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
2. Open *Command Prompt*;
3. Type `ipconfig` en druk op enter.
4. Het IP-adres moet als volgt geconfigureerd zijn: 
	- IP-address: 172.18.2.67
	- Netmask: 255.255.0.0
	- Default Gateway: 172.18.2.65
	- DNS: 172.18.2.67 OF 127.0.0.1

## Server naam en domein naam
1. Log in op Alfa 2:
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
2. Open *Command Prompt*;
3. Type `HOSTNAME` en druk op *enter*;
4. Indien er **ns1** verschijnt, is de naam goed geconfigureerd.
5. Type `wmic computersystem get domain` en druk op *enter*;
6. Indien er **red.local** verschijnt, is dat ook goed geconfigureerd.

## AD DC & DNS
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Server Manager*.
4. Indien er aan de linkerkant `AD DS` en `DNS` staat, zijn de rollen succesvol geïnstalleerd.

## DNS forwards
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Server Manager*;
4. Klik op **Tools**;
5. Klik op **DNS**;
6. Klik op **Forwarders**;
7. Er zijn twee forwarders:
	- 193.190.173.2
	- 193.190.173.1

## OU & Users
1. Log in op Alfa 2:
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Command Prompt*;
4. Type `dsa.msc` in en klik op enter.
6. Klap red.local uit.
7. In de subfolders van *red.local*, Open RED.
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
 - Bezoek één per één iedere map in **stap 7**; 
 - Right-mouse click op de group die in de map zit. **Klik op eigenschappen**;
 - **Klik** daarna op de tab "Members";
 - Indien je daar de gebruikers als volgt kan terug vinden, is alles goed geconfigureerd:

## Gebruikers
1. Log in op een Workstation:
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345

## Policies
1. Start de server `Alfa2`
2. Log in met de gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open *Server Manager*;
4. Klik op **Tools**;
5. Klik op **Group Policy Management**;
6. Klap **Forest: red.local**, **Domains**, **red.local**, **Group Policy Objects** uit;
7. Er staan 5 policies:
	 - ActiveScripting;
	 - ControlPanelGameLink;
	 - FileServer;
	 - Netwerkadapter;
	 - SQLpoortenVoorSSCM2012R2;

## Fileserver (Kan pas getest worden als Lima 2 af is)
1. **Log in op een werkstation met de volgende gebruikers**. Bij elk gebruiker moeten enkel de volgende shares te zien zijn als je *File Explorer* opent. Voer in elk folder de acties onder *Testing* uit:

| Gebruikersnaam en wachtwoord| Zichtbare Shares|Permissions|Testing |
|-----------|---------------------|---------------------|---------------------|
| John.Smet@red.local - P@ssword|ITData|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | VerkoopData|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | OntwikkelingData|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | DirData|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | AdminData|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ShareVerkoop|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | HomeDirs|Full Control|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ProfileDirs|Full Control|Heeft een folder met jouw naam|
| Lien.Smet@red.local - P@ssword |AdminData|Read, Write|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | HomeDirs |Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ProfileDirs|Full Control|Heeft een folder met jouw naam|
| Henry.Smet@red.local - P@ssword |DirData |Read, Write|Voeg een bestand toe, wijzig en sla op, en verwijder|
| | HomeDirs |Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ProfileDirs|Full Control|Heeft een folder met jouw naam|
| Laura.Smet@red.local - P@ssword |OntwikkelingData|Read, Write|Voeg een bestand toe, wijzig en sla op, en verwijder|
||ShareVerkoop|Read|Lees een bestand dat al toegevoegd is in het map. Verwijderen en wijzigen zou niet mogen lukken.|
| | HomeDirs |Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ProfileDirs|Full Control|Heeft een folder met jouw naam|
| Dirk.Smet@red.local - P@ssword|VerkoopData|Read, Write|Voeg een bestand toe, wijzig en sla op, en verwijder|
| |ShareVerkoop | Read, Write | Voeg een bestand toe, wijzig en sla op, en verwijder|
| | HomeDirs |Read, Write |Voeg een bestand toe, wijzig en sla op, en verwijder|
| | ProfileDirs|Full Control|Heeft een folder met jouw naam|
