# Prerequisites voor het installeren van SCCM 2012 R2

## ADSI Edit (AD/DC)

In Tools, onder Server Mananger, open ADSI Edit en rechterklik op ADSI Edit en Connect to, Ok (verander de naam niet!).
Klik vervolgens op CN=System, New, Object.
Selecteer container, next.
Vul dan de naam System Management in bij Value en druk op next.

Ga hierna terug naar Tools (onder Server Manager) en open Active Directory Users and Computers.
Klik hier op View en duid Advanced Features aan. Nu kun je onder System, System Management vinden. Rechterklik erop en erna op Delegate Control.
Vervolgens rechterklikken op de System Management container en op Add. Dan kom je in het Select Users, Computer or Groups-window. Hier klik je op Object Types en voeg je Computers toe.
Voeg vervolgens de Primary Site Server Computer Account toe en klik op Next.
In het volgende scherm duid je Create a custom task to delegate aan en next.
Controleer vervolgens of This folder, existing objects in this folder, and creation of news objects in this folder staat aangeduid en druk op next.
Hierna opend de Delegation of Control Wizard. Selecteer alle permissies (General, Property-specific, Creation/deleteion of specific child objects) en duid Full Control aan.

## EXTADSH.exe (AD/DC)

Mount vervolgens de ISO van SCCM op de virtuele machine en ga naar \SMSSETUP\BIN\X64 en houdt vervolgens shift ingedrukt en rechterklik daarna op extadsh.exe en selecteer Copy as Path.
Paste hierna dit pad in een CMD-terminal.
Als het niet direct lukt, wacht even en probeer opnieuw.
Als het daarna nog steeds niet lukt voer dan het onderstaande commando in en probeer opnieuw.
    
    repadmin /syncall
    
Als het daarna nog steeds niet lukt, herstart de machine en begin opnieuw vanaf stap 1 van EXTASH.exe.

## Client Push Settings (AD/DC)

Open Group Policy Management console onder Tools bij Server Manager.
Rechterklik in dit scherm op Red.local onder Domains en klik daarna op Create a GPO in this domain, and Link it here...
Noem de nieuwe GPO bv.: Client Push Policy Settings (Source Starter GPO mag je op (none) laten staan).
Rechterklik vervolgens op deze nieuwe policy en klik op Edit. Expand computer configuration, Windows settings, Security settings, Windows Firewall with advanced security. Rechterklik op Inbound rules en klik op New Rule.
Selecteer onder Predefined op File and Printer Sharing, Next, controleer of alles aangevinkt is en selecteer anders alles en durk op Next, Op het volgende scherm ook alleen maar Next (niets aanpassen), Allow the connection en Finish.

Doe hetzelfde nog eens voor Outbond Rules, maar met hetzelfde proces.

Alsook voor WMI, maar alleen Inbound.

## Open SQL Ports (AD/DC)
Ga opnieuw naar Group Policy Management console onder Tools bij Server Manager. 
Rechterklik opnieuw op Red.local en klik opnieuw op Create a GPO in this domain, and Link it here...
Geef deze policy opnieuw een naam (bv.: SQL poorten voor SCCM2012R2).
Expand de boom hiervan opnieuw tot je Windows Firewall with advanced security onder Security Settings net zoals vorige keer en rechterklik op Inbouw Rules en klik dan op New Rule.


Selecteer deze keer Port en druk op next.
Selecteer TCP en Specific local ports, voeg hier 1433 in. Druk op next.
Controleer of Allow the connection is aangeduid en selecteer deze anders en druk op next.
Controleer vervolgens of alle 3 de checkboxes staan aangeduid en vink ze anders allemaal aan en druk op next en finish.


Herhaal de poortcreatie stap voor poortnummer 4022, maar maak geen nieuwe GPO aan.


Voor zeker te zijn van replicatie kun je best de volgende commando's eens uitvoeren:

    gpudate/force
    repadmin /syncall
    
Hierna kun je controleren of alles in orde is door rsp.msc in te voeren in rsop.msc in cmd en door de boom van Computer Configuration te openen, Administrative Templates en Extra Registry Settings.
Hieronder zul je normaal alle aangemaakte policies moeten vinden.

## Testen

Als je wilt controleren of alles gelukt is. Kun je kijken op de server waar je NIET deze configuratie hebt uitgevoerd. Door het replicatie proces zou op die server dan ook alle mappen en GPO's moeten aangemaakt geweest zijn.

Dus, ga naar Server Manager, Tools, Active Directory Users and Computers. Duid daar onder View Advanced Features aan en je zou er de map System en daaronder System Management moeten zien. Deze worden niet aangemaakt door Windows Server, maar zijn wel nodig voor SCCM.

ADSI Edit kan helaas niet echt getest worden.

De GPO's kun je bekijken door in cmd "rsop.msc" in te voeren. Administrative Templates te klikken, daarna Extra Registry Settings. Hieronder zul je alle aangemaakte GPO's vinden.

## Web Server (IIS) (SCCM)

Voeg vervolgens de volgende Roles, Roles Services en Features toe:

  - Web Server (IIS) (Role)
  - Management Tools (Role Services)
    - ISS Management Console
    - IIS 6 Management Compatibility
      - IIS 6 Metabase Compatibility
      - IIS 6 WMI Compability
    - IIS Management Scripts and Tools
  - Common HTTP Features
    - Default Document
    - Static Content
  - Application Development
    - ASP.NET 3.5
    - .NET Extensibility 3.5
    - ASP.NET 4.5
    - .NET Extensibility 4.5
    - ISAPI extensions
  - Security
    - Windows Authentication
  - Background Intelligent Transfer Service (BITS)

## Windows ADK 8.1 (SCCM)

Installeer ook de Windows 8.1 ADK.
Selecteer tijdens de installatie zeker:
  
  - Deployment Tools
  - Windows Preinstallation Enviroment (Windows PE)
  - User State Migration Tool (USMT)
    
## WSUS (SCCM)

Ga terug naar de Server Manager en voeg ook deze tools nog toe:

  - Windows Server Update Services
    - WSUS Services
    - Database

Het pad waar je updates moet opslaan moet je verwijzen naar onze server.
De databank waarnaar verwezen moet worden zal ook de databank van Papa2 worden.
Als de installatie bij 'check connection' geen string invult, vul dan zelf localhost of (local) in.

## MS SQL 2014 hotfix (SCCM)

Download de volgende hotfixes als je wilt werken met MS SQL 2014 als databank voor SCCM en plak deze in de installatiefolder van de image waarin de setup staat van SCCM (\SMSSETUP\BIN\X64\Setup.exe).

[ConfigMgr12R2SP1](http://hotfixv4.microsoft.com/ConfigMgrV5/sp1/CM12_SP1_QFE_KB3020755_X64_ENU_OOB/05.00.7804.1115/free/483084_ENU_x64_zip.exe)

[ConfigMgr12R2](http://hotfixv4.microsoft.com/ConfigMgrV5/nosp/ConfigMgr12_R2_QFE_KB3020755_X64_ENU_OOB/05.00.7958.1113/free/480671_ENU_x64_zip.exe)

## System Center 2012 R2 SP1 (SCCM)

Download de prerequisites van en mount daarna een ISO van *System Center 2012 SP2* en voer de setup.exe uit.
Zorg dat in het eerste scherm 'upgrade' aangeduid staat en klik daarna op next tot de installatie begint en druk tenslotte op finish.

## Windows ADK 10 (SCCM)

Hierna kun je eventueel nog ADK 10 naast 8.1 installeren of deze compleet vervangen. Maar, normaal moet ADK 8.1 ook instaat zijn om de Client op W10's en 2016's te pushen.