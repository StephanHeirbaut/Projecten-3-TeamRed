# DISCLAIMER: _THIS IS A WORK IN PROGRESS, AND THEREFORE ONLY MEANT AS A DRAFT_

***


# User manual

### User manual (poging Cedric 08/10/2017):

- install hyper-V op de pc waarop je werkt (win 10 pro nodig)
- voer in powershell uit: Enable-WindowsOptionalFeature -Online -FeatureName:Microsoft-Hyper-V -All
- ~~add new generation 2 vm: Lima2_win_ser_2016 with 2048MB startup memory~~
- ~~add virtual harddisk Lima2_win_ser_2016_disk1 with 50GB~~
- ~~use code: GN8DC-F98HQ-T9893-TTGW6-RRHYF code~~
- run the script below with powershell as an admin by typing: .\lima2_deployment_script.ps1 (obviously change the names/paths accordingly)
(manueel verder 16/10/2017)
- start hyper-v en ga naar de settings van de aangemaakte vm (eerst vm afsluiten)
- add nog een harddrive in ide controller 0
- maak voor deze een virtuele harddisk aan (format: VHDX, type: Dynamic, name: Disk2, location: C:\HyperV\Lima2_WinSer2016\, size: 100Gb, )  
- stel in, taal: nederlands(belgiê) keyboardlayout: belgisch (komma)
- administrator wachtwoord: Admin123
- log in met Administrator, pw:Admin123 
- Dvd station uitwerpen en veranderen naar Q
- stel volgende partities in via Disk Management (schijfbeheer)
- Systeempartities schijf 1 : 
	- C: 32 gb System 
	- D: 33 gb VerkoopData
	- E: 35 gb OntwikkelingData
- Systeempartities schijf 0 : 
	- F: 20 gb ITData  (Schijf formateren en zo naam toewijzen)
	- G: 20 gb DirData 
	- H: 20 gb AdminData
	- Y: 20 gb HomeDirs
	- Z: 20 gb ProfileDirs
- in dashboard: add roles and features. File server (bestand server) selecteren
  //## Install-windowsFeature -Name <>
- add roles and features, file server resource manager
- virtual switch manager, switch 5 external network (ethernet adapter) instellen (op vlan 300?)
- ip adressen instellen op 172.18.2.3 met subnet automatisch, en default gateway 172.18.2.67
- Control panel, system settings: domain aanpassen zodat je red.local joined met Administrator & Aa12345
- bestand- en opslagservices shares selecteren, start wizard nieuwe share, smb snel, share locatie D:, Sharenaam "VerkoopData", extern pad: "\\Lima2\VerkoopData" (wordt automatisch gedaan)
- caching van share toestaan, gegevenstoegang versleutelen 
- machtigingen aanpassen (bv, nieuwe share VerkoopData met IT administratie met full control en Verkoop met lees- en schrijfrechten
- in VerkoopData een map "ShareVerkoop" aanmaken
- rightclick op de folder, en in de tab "Delen" click je op delen (via geavanceerd moet je it administratie op full control zetten) // ook andere permisies nog??
- op shareverkoop bij de permisies (share, niet geavanceerde share), read/write instellen voor Verkoop.
- op alle schijven moet je rightclick doen, eigenschappen, en dan onder de "delen"-tab, alle schijven delen via geavanceerd delen, (default name is goed)
- om te testen moet je inloggen met Lien.Smet en Aa12345
- rechtsclicken op de folder>eigenschappen>quotum, quotumbeheer inschakelen en vervolgens de juiste waarden ingeven.
- VerkoopData, DirData en AdminData op maximum 100MB per gebruiker instellen. 
- OntwikkelingData en ITData maximum 200Mb per gebruiker instellen.
- Alles aanvinken in de quotum tab, en het waarschuwingsniveau instellen op 75% van de limiethoeveelheid.
- Stel in dat er voor AdminData dagelijks een schaduwkopie wordt gemaakt van de data.
- Dit doe je door rightclick op AdminData>shadowcopy, selecteer schijf H en click op "instellingen" en stel een dagelijkse planning in voor 7:00, 12:00 en 18:00. Stel de hoeveelheid op 5000Mb in en stel dit in op schijf C:/
***


#### randnotities voor later (manual execution) 
- tools>file server resource manager
- quota management>quota
- rightclick>create quota in Disk of choice, limit,
- create subfolder in disk
- create quote for subfolder
- bepaalde soorten files blocken in file screen management?


#### randnotities automation
- zie links file shares & quotas with powershell
- C:\> Get-FsrmQuota -Path "d:\www\example.com"
- PS C:\> Set-FsrmQuota -Path "d:\www\example.com" -Size 4.5GB
- D:\www> Get-FsrmQuota
- als er een error is met de "trust relation between workstation & domain" -> uit domein gaan, restart, terug in domein redlocal, restart
- DFS gebruiken voor share, (powershell line for installation), nog uitzoeken hoe dfs te automatiseren

#### netwerkinformatie
- ip: 172.18.2.3
- subnetmask: 255.255.255.224
- default gateway: 172.18.2.1
