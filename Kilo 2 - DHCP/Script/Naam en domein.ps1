#IP-adres en default gateway wijzigen
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "172.18.2.2" -PrefixLength 27 -DefaultGateway "172.18.2.1"
#DNS Server wijzigen
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "172.18.2.67","172.18.2.68"

#Firewall uitschakelen
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

$cred = New-Object System.Management.Automation.PSCredential("red.local\Administrator",(ConvertTo-SecureString "Aa12345" -AsPlainText -Force))
Add-Computer -DomainName red.local -Credential $cred

Restart-Computer
