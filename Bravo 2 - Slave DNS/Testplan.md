# Testplan Bravo 2
## Windows Server 2016 installatie

### GUI
1. Start de server **Bravo 2**
2. Log in op Bravo 2 met gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open "_Server Manager_" indien dat niet automatisch gebeurt is. Dit doe je door naar het startmenu te gaan en daar op "Server Manager" te klikken.
4. Nadat "_Server Manger_" geopend is, klik op "_Local Server_" dat je links van de pagina terug kan vinden.
5. Controller of de "_Operating system version_" op "Windows Server 2016 Standard staat". Indien dat zo is, is de server installatie succesvol uitgevoerd.

### CMD
1. Start de server Bravo 2 
2. Log in op Bravo 2 met gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open "Command Prompt"
	1. Klik op het vergrootglas in de taakbalk;
	2. type "cmd" en druk op enter;
4. type "_Winver_" en druk op enter;
5. Indien er Windows Server 2016 verschijnt op het scherm, 
5.  en je ziet welke Windows versie er geïnstalleerd is. Indien er Windows Server 2016 staat is de server installatie succesvol uitgevoerd.

## Netwerkkaart
1. Start de server Bravo 2 
2. Log in op Bravo 2 met gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open "Command Prompt"
	1. Klik op het vergrootglas in de taakbalk;
	2. type "cmd" en druk op enter;
4. Type **ipconfig** en druk op enter.
5. De netwerkconfiguratie moet gelijk zijn aan het volgende: 
	- **IP-Address:** 172.18.2.68
	- **Netmask:** 255.255.0.0
	- **Default Gateway:** 172.18.2.65
	- **Preffered DNS:** 172.18.2.67
	- **Alternate DNS:** 172.18.2.68
6. Indien het ip adres klopt is het netwerk juist geconfigureerd

## Server naam en domein naam
### GUI
1. Start de server Bravo 2 
2. Log in op Bravo 2 met gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open "_Server Manager_" indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op "_Server Manager_" te klikken.
4. Nadat "_Server Manager_" geopend is, klik op "_Local Server_" dat je link van de pagina terug kan vinden.
5. Controlleer of de "_Computer Name_" op "_ns2_" en de "_Domain_" op "_red.local_" staat. Indien dat zo is, is de server naam en domein succesvol geconfigureerd.

### CMD
1. Start de server Bravo 2 
2. Log in op Bravo 2 met gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open "Command Prompt"
	1. Klik op het vergrootglas in de taakbalk;
	2. type "_cmd_" en druk op enter;
4. Type "_HOSTNAME_" en je ziet wat de naam van de server is. Indien het "_ns2_" is, is de naam goed geconfigureerd.
5. Type "_wmic computersystem get domain_" om de domain naam te vinden. Indien er "_red.local_" staat is dat ook goed geconfigureerd.

## Domeincontroller en DNS
### DC en DNS geïnstalleerd?
1. Start de server Bravo 2 
2. Log in op Bravo 2 met gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open de "Server Manager";
4. Indien er aan de linkerkant AD DS en DNS staat, zijn de rollen succesvol geïnstalleerd.

### Duplicatie van Alfa 2
1. Start de servers Alfa 2 & Bravo 2;
2. Log in op Alfa 2 & Bravo 2 met gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Op Alfa 2
	1. Open de _Server Manager_;
	2. Klik op _Tools_;
	3. Klik op _Active Directory Users and Computers_;
	4. Klik op het pijltje naast _red.local_;
	5. Klik op het pijltje naast _Red_;
	6. Klik op _IT administratie_;
	7. Klik op _Create a new user in the current container_ boven in de werkbalk;
	8. Geef de volgende gegevens in:
		- **First Name:** Lieven
		- **Last Name:** Smits
		- **User logon name:** Lie.Smi
	   En klik op _Next_;
	9. Geef de volgende gegevens in:
		- **Password:** Aa12345
		- Haal het vinkje weg voor _User must change password at next logon_ indien het aangeduid staat;
	   En klik op _Next_;
	10. Klik op _Finish_.
4. Op Bravo 2
	1. Open de _Server Manager_;
	2. Klik op _Tools_;
	3. Klik op _Active Directory Users and Computers_;
	5. Klik op het pijltje naast _Red_;
	6. Klik op _IT administratie_;
	7. Indien de gebruiker _Lieven LS Smits_ zichtbaar is, Repliceert Bravo 2 van Alfa2.

### Controleren of ADDC en DNS werkt
1. Start de server dat genaamd is als Bravo 2
2. Indien Alfa 2 aanstaat, sluit Alfa 2 af 
3. Maak een nieuwe VM aan en installeer windows 10 daarop. Je kan de stappen op [dit](https://www.extremetech.com/computing/198427-how-to-install-windows-10-in-a-virtual-machine) pagina volgen voor het installatie van een Windows 10 op VM.
	- Verander de ip adres van de computer zodat het in de zelfde netwerk ligt als de server, dit doe je door de inststructies op [dit pagina](https://support.microsoft.com/nl-be/help/15089/windows-change-tcp-ip-settings) te volgen (stap 5 moet je niet uitvoeren aangezien we niet werken met IPv6). Geef de volgende netwerkinformatie in voor het configureren van de netwerk:
		- IP adres: 172.18.2.70
		- Subnetmask: 255.255.0.0
		- Default Gateway: 172.18.2.65
		- DNS Server: 172.18.2.67
		- Alternate DNS Server: 172.18.2.68
4. Maak na de netwerkconfiguratie de geïnstalleerde computer lid van de domein. Om dit te doen volg de volgende stappen
	- Start de computer en log in
	- Ga naar "Mijn computer", doe rechtermuisklik en klik op "eigenschappen"
	- Klik daarna op "Instellingen wijzigen" in het gedeelte "Instellingen voor computernaam,domein en werkgroep"
	- Klik daarna op de geopende pagina op wijzigen
	- Vink daarna de "domein" aan en geef als domeinnaam "red.local" in.
		- Gebruik de volgende gegevens voor verificatie:
			- **Gebruiker:** Administrator;
			- **Wachtwoord:** Aa12345;
			- Start de computer opnieuw op;
5. Als de bovenstaande procedure gelukt is, werkt domeincontroller en dns zonder problemen.

## Gebruikersgroepen, gebruikers en werkstations

### Gui
1. Start de server Bravo 2 
2. Log in op Bravo 2 met gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open de _Server Manager_;
4. Klik op _Tools_;
5. Klik op _Active Directory Users and Computers";
5. Klap daarna red.local uit. je moet een map _Red_ moeten zien.
6. Daarin moet je de volgende mappen terug kunnen vinden:
 - Administratie
 - Directie
 - IT Administratie
 - Ontwikkeling
 - Verkoop
 - Werkstation
7. In de bovenstaande mappen (behalve in de map _Werkstation_ moet je een groep met dezelfde naam en minstens één gebruiker terug kunnen vinden).
8. Indien dat het geval is, zijn de groepen goed aangemaakt.
9. In de map _Werkstation_ moet je vijf werkstations terug kunnen vinden met de volgende namen:
 - AClient
 - DClient
 - ITClient
 - OClient
 - VClient
 <br>Indien dat het geval is, zijn de werkstations ook goed aangemaakt
 10. Als laatst controleren we of de gebruikers tot de juiste groep(en) behoren. Dit doen we als volgt:
 - Klik één per één op de groepen die je terug kan vinden in de mappen in stap 6.
 - Klik daarna op de tab "_Members_"
 - Indien je daar de gebruikers als volgt kan terug vinden, is alles goed geconfigureerd:
 
| Groep            | Gebruiker(s)                 |
|------------------|------------------------------|
| Administratie    | Lies LS. Smet en Dirck DS. Smet |
| Directie         | Tim TS. Smet                 |
| IT Administratie | Jan JS. Smet                 |
| Ontwikkeling     | Sylvie SS. Smet              |
| Verkoop          | Bert BS. Smet                |


### CMD
1. Start de server Bravo 2 
2. Log in op Bravo 2 met gebruiker;
	- **Account name:** _red/administrator_
	- **Paswoord:** Aa12345
3. Open "Command Prompt"
	1. Klik op het vergrootglas in de taakbalk;
	2. type "_cmd_" en druk op enter;
4. Type _dsa.msc_ in en klik op enter. "Active directory users and computers" wordt geopend.
5. Volg hierna de bovenstaande Gui vanaf stap 5

## Inloggen op computer

1. Tijdens het uitwerken van de policies test je ook of de gebruikers zijn aangemaakt en of je kan inloggen op de computers.

## Policies

Indien je Windows 10 nog niet geinstalleerd hebt tijdens het controleren van DC moet je dit nu doen! Anders, volg de stappen onder de title _Controleren of ADDC & DNS werkt_

Log uit en log in met de volgede gebruikers (In de derde kolom wordt beschreven wat normaal gezien niet moet werken. Indien dat klopt zijn de policies goed geconfigureerd):

| Groep            | Gebruikersnaam en wachtwoord                |Beperking                 |
|------------------|------------------------------|------------------------------|
| Administratie    | Lies.Smet - P@ssword |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu, eigenschappenvan de netwerkadapters kan niet geopend worden |
| Directie         | Tim.Smet - P@ssword                |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu                |
| IT Administratie | Jan.Smet - P@ssword                 |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu                 |
| Ontwikkeling     | Sylvie.Smet - P@ssword              |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu             |
| Verkoop          | Bert.Smet - P@ssword                |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu, eigenschappenvan de netwerkadapters kan niet geopend worden                |




## Fileserver
1. Start de computer en log in met de gegevens in de rubriek policies.
2. Bij elk gebruiker in elk groep moeten enkel de volgende folders te zien zijn in "mijn computer". Voer in elk folder een actie uit. Probeer bijvoorbeeld een document te lezen (testen van lees rechten) en en een document aan te maken (notepad) en op te slaan, indien dat lukt is alles goed geconfigureerd:
![FileServer](https://github.com/HoGentTIN/p3ops-red/blob/master/Alfa%202%20-%20DC%20%26%20DNS/FileServer.png)



