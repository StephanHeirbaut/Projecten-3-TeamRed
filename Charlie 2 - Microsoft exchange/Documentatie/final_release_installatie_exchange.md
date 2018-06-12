# Final Release: Installatie Windows Exchange Server 2013 PS1

## Dependencies
- Windows Server 2012 R2 is geïnstalleerd

## Prerequisites

- Netwerk addressering:
		
		IP-adres:     		172.18.2.69
		Subnetmask:     	255.255.255.224
		DefaultGateway: 	172.18.2.65
		
		DNS1:     			172.18.2.67
		DNS2:     			172.18.2.68
		
- Voer volgende powershell scripts uit:

|   | Script  | Beschrijving  |
|---|---|---|
| 1  | [Installatiescript_Deel1_JDM.ps1](/Charlie%202%20-%20Microsoft%20exchange/Scripts/Installatiescript_Deel1_JDM.ps1)  |  Install roles and features + install UCMA |
| 2  | [Installatiescript_Deel2_JDM.ps1](/Charlie%202%20-%20Microsoft%20exchange/Scripts/Installatiescript_Deel2_JDM.ps1)  |  Extract exchange files |

## Exchange Server Installatie
- Voer volgende powershell script uit: [Installatiescript_Deel3_JDM.ps1](/Charlie%202%20-%20Microsoft%20exchange/Scripts/Installatiescript_Deel3_JDM.ps1)

- Om de installatie te laten beginnen moet je manueel de setup.exe laten lopen.

## Configuratie Exchange Server

- Open Exchange management shell en voer volgenden script uit:

		cd ..
		cd \C:\Users\Administrator\Documents
		cd .\exchange2013_config.ps1

- Volgende configuratie moet nog manueel gebeuren via Internet Information Services(IIS):
	
	- Redirect HTTP to HTTPS
	- Redirect **mail.red.local** to **https://mail.red.local/owa**



