## Installatie Windows Server 2012 r2 / Windows Exchange Server Manueel/Scripts

### Voer volgende scripts uit via Powershell:
- Installatiescript_Deel1_JDM.ps1
- Installatiescript_Deel2_JDM.ps1


- Net Framework 4.5.2 manueel installeren (als niet geïnstalleerd wordt via de script)
- Download and install Microsoft Unified Communications Managed API 4.0, Core Runtime 64-bit in Mail Server.

- Deactiveer firewall via Powershell met volgende commando :

		Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
- Extend and prepare the Active Directory - Voer volgende commando's uit in Command prompt
		
		Setup.exe /PrepareSchema /IAcceptExchangeServerLicenseTerms
		Setup.exe /PrepareAD /OrganizationName:”<organization name>” /IAcceptExchangeServerLicenseTerms
- Start setup.exe


### Opmerkingen

- Error Code 8224 While Running Ldifde.exe to Import Schema File ([klik hier voor meer uitleg](https://practical365.com/exchange-server/error-code-8224-running-ldifde-exe-import-schema-file/))
	- Oplossing?