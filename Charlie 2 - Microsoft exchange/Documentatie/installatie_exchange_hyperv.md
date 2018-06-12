# Installatie Exchange Server 2013 SP1 op Windows Server 2012 R2 - Hyper V

## Dependencies:
- Windows Server 2012 R2 is geïnstalleerd
- Server Alfa2(Domeincontroller) is actief(automatisatie scripts te vinden bi documentatie Alfa2)
- Er is verbinding met Alfa2 en Charlie2 behoort tot het domein red.local met de volgende ip-adressering:

		Ip-address: 172.18.0.4
		Subnetmask: 255.255.255.0
		Default Gateway: 172.18.0.1

		Dns Server= 172.18.0.2

## Prerequisites

- Maak shared folder om de nodige bestanden/scripts door te geven aan de virtuele machine.
- Voer [script](Charlie%202%20-%20Microsoft%20exchange/Scripts/install_prerequs_exch2013sp1.ps1) uit
- Voer [test](Charlie%202%20-%20Microsoft%20exchange/Testing/Test%20scripts/ScriptOmTeTesten_JDM.ps1) uit om geïnstalleerde prerequisites te controleren 
- Installeer Microsoft Unified Communications Managed API 4.0
- Extract Exchange2013-x64-SP1.exe
- Run setup.exe

