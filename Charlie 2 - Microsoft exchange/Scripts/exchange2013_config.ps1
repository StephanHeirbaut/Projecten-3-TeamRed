#Deze script moet uitgevoerd worden in de Exchange Management Shell
#Maar kan ook in de gewone Powershell uitgevoerd worden als volgende SnapIn geïnstalleerd wordt

#Add-PSSnapin microsoft-exhcange.management.powershell.snapin
#Add-PSSnapin microsoft-exhcange.management.powershell.setup
#Add-PSSnapin microsoft-exhcange.management.powershell.support

#Elke bestaande user krijgt een mailbox
Get-User | Where-Object {$_.RecipientType -eq "User"} | ForEach-Object {Enable-Mailbox -Identity $_.Name}

## New send connector
New-SendConnector -Name "MBG Send Connector" -Usage Internet -AddressSpaces * -DNSRoutingEnabled $true 

## Set External URL EWS
Set-WebServicesVirtualDirectory -Identity "EWS (Default Web Site)" -ExternalUrl https://mail.red.local/EWS/exchange.asmx

## Set External URL owa
Set-owavirtualdirectory –Identity "owa (Default Web Site)" –ExternalUrl https://mail.red.local/owa

## Set External URL ecp
Set-ecpvirtualdirectory –Identity "ecp (Default Web Site)" –ExternalUrl https://mail.red.local/ecp

## Set External URL Microsoft-Server-ActiveSync
Set-ActiveSyncVirtualDirectory -Identity "Microsoft-Server-ActiveSync (Default Web Site)" -ExternalUrl https://mail.red.local/Microsoft-Server-ActiveSync 

## Set External URL OAB
Set-oabvirtualdirectory –Identity "OAB (Default Web Site)" –ExternalUrl https://mail.red.local/oab

## Set Outlook Anywhere
Set-OutlookAnywhere -Identity "mail\rpc (Default Web Site)" -InternalHostname mail.red.local -ExternalHostname mail.red.local -ExternalClientsRequireSsl $true -DefaultAuthenticationMethod negotiate -InternalClientsRequireSsl $true

## Auto discover
Set-ClientAccessServer -Identity mail -AutoDiscoverServiceInternalUri https://autodiscover.red.local/Autodiscover/Autodiscover.xml

## Permission Reset Password
New-ManagementRoleAssignment -Role "Reset Password" -SecurityGroup "Organization Management"

## Public Folder Maibox
## Moet nog aangepast worden
New-Mailbox -PublicFolder -Name PublicRED1
New-PublicFolder -Name Administratie
New-PublicFolder -Name Directie
New-PublicFolder -Name ITAdministratie
New-PublicFolder -Name Ontwikkeling
New-PublicFolder -Name Verkoop

## Public Folder permissions
Add-PublicFolderClientPermission -Identity "\Administratie" -User "John Smet" -AccessRights owner
Add-PublicFolderClientPermission -Identity "\Directie" -User "Lien Smet" -AccessRights owner
Add-PublicFolderClientPermission -Identity "\Ontwikkeling" -User "Laura Smet" -AccessRights owner
Add-PublicFolderClientPermission -Identity "\ITAdministratie" -User "Henry Smet" -AccessRights owner
Add-PublicFolderClientPermission -Identity "\Verkoop" -User "Dirk Smet" -AccessRights owner