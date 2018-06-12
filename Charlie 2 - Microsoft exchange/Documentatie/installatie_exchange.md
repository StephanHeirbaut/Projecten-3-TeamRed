## Installatie Windows Server 2012 r2 / Windows Exchange Server Manueel/Scripts

### Voer volgende stappen uit
- Run installatiescript_Deel1_JDM.ps1 **Need UCMA.EXE**
- Pas de IP-Instellingen aan:

		IP-Address: 172.18.0.4
		Subnetmask: 255.255.255.0
		Default-Gateway: 172.18.0.1
		DNS-Server: 172.18.0.2

- Meld je aan in het domein: System -> Change setting -> Change -> Domain: red.local
- Restart PC and log in as domain admin
- Run installatiescript_Deel2_JDM.ps1 **Need Exchange2013.EXE**

- Run installatiescript_Deel3_JDM.ps1

- Deactiveer firewall via Powershell met volgende commando :

		Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

- Run exchange2013_config.ps1

### Opmerkingen

- Error Code 8224 While Running Ldifde.exe to Import Schema File ([klik hier voor meer uitleg](https://practical365.com/exchange-server/error-code-8224-running-ldifde-exe-import-schema-file/))
	- Oplossing?
