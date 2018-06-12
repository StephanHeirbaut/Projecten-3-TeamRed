# Testplan

##  Installatie Prerequesites voor Exchange Server

1. Start een computer met Windows Server op.
2. Voer volgende script uit	in Powershell(of maak gebruik van de script in de repository Charlie 2 -Exchange Server/Testing/ScriptOmTeTesten_JDM.ps1):

		<#TestScript#>
		
		get-WindowsFeature AS-HTTP-Activation, Desktop-Experience, NET-Framework-45-Features,
		RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt,
		RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45,
		Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression,
		Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext,
		Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console,
		Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression,
		Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation, ADlDS,RSAT-ADDS
		 
		$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
		
		Write-Host
		Write-Host "A"
		Write-Host "B"
		Write-Host "C"

3. U krijgt een lijst van de opgezochte software op uw scherm.
4. Normaalgezien zou de kolom "Install State" voor sommige items "Available" moeten weergeven.

	![avilable](https://i.imgur.com/0JkdKJj.png)

5. Nu moet u de Prerequisites voor de Exchange Server installeren a.h.v. volgende script(of maak gebruik van de script in de repository Charlie 2 -Exchange Server/Scripts/Installatiescript_JDM.ps1):

		ECHO "Installing OS roles and features"
		
		Install-WindowsFeature AS-HTTP-Activation, Desktop-Experience, 
		 RPC-over-HTTP-proxy, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45,
		 Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression,
		 Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext,
		 Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console,
		 Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression,
		 Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation
		ECHO "Done installing roles en features"
		
		ECHO "Installing NET-Framework-45-Features"
		Install-WindowsFeature NET-Framework-45-Features
		ECHO "Done installing NET-Framework-45-Features"
		
		ECHO "Installing Pre-Requisites"
		Install-WindowsFeature ADLDS
		ECHO "done installing ADLDS"
		
		ECHO "Exchange Management Shell opt"
		Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementScriptingTools,
		IIS-ManagementScriptingTools,IIS-IIS6ManagementCompatibility,IIS-LegacySnapIn,IIS-ManagementConsole,
		IIS-Metabase,IIS-WebServerManagementTools,IIS-WebServerRole
		ECHO "done installing EMS"
		
		ECHO "RSAT-ADDS feature for AD"
		Install-WindowsFeature RSAT-ADDS, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt,
		 RSAT-Clustering-PowerShell
		ECHO "done installing RSAT-ADDS"
		
		Write-Host "Press any key to restart"
		
		$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
		
		Write-Host
		Write-Host "A"
		Write-Host "B"
		Write-Host "C"
		
		Restart-Computer


6. Nu voert u de eerste script(test) opnieuw uit.
7. Indien de kolom "Install State" "Installed" weergeeft voor de software dan was de test succesvol.
	![](https://i.imgur.com/Ay8Qo3S.png)




