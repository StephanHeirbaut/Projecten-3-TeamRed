# Documentatie Alfa 2
## Installatie procedure
1. Download een iso file van Windows Server 2016
2. Download de programma ["ISO to USB"](http://www.isotousb.com) op je computer, open de programma, selecteer de gedownloade iso file en de usb stik waarin Windows Server 2016 geïnstalleer moet worden en klik op burn
3. Kopiër daarna de bestand "autounattend.xml" naar de root van de usb stick.
4. Maak een nieuwe map genaamd "script" aan in de root van de usb stick en kopier de bestanden uit de map ["script"](https://github.com/HoGentTIN/p3ops-red/tree/master/Kilo%202%20-%20DHCP/Script) daarin.
5. Sluit de usb stick aan op de server waarin DHCP geïnstalleerd moet worden. 
6. Start de computer aan, open boot menu en selecteer usb drive zodat de installatie uit de usb kan starten. De installatie zal nu automatisch starten en uitgevoerd worden.
7. Nadat de installatie klaar is, open de usb stick op de server en ga naar de aangemaakt map "script" in stap 4.
8. Doe rechtermuisklik op "Naam en domein.ps1" en klik op "run with powershell". De server zal automatisch lid worden van het domein. De computer zal automatisch opnieuw opstarten nadat de installatie voltooid is.
9. Voer stap 8 opnieuw uit en doe nu rechtermuisklik op "DHCP role and config.ps1" en klik op "run with powershell". De DHCP zal automatisch geconfigureerd worden.
10. Nadat stappen hierboven uitgevoerd zijn, is de installatie van de server voltooid.

## Informatie over server
Server naam: DHCPServer <br>
Domein naam: red.local<br>
<br>
Server gebruikersnaam: Administrator<br>
Server wachtwoord: Aa12345<br>
<br>
Domein gebruikersnaam: Administrator@red.local<br>
Domein wachtwoord: Aa12345<br>

## Informatie voer DHCP 
Scope naam: VLAN200 <br>
IP-range: 178.18.0.50 - 172.18.0.100<br>

