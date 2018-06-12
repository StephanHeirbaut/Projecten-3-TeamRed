New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 172.18.2.4 -DefaultGateway 172.18.2.1 -PrefixLength 27
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 172.18.2.67, 172.18.2.68
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

$User = "red\administrator"
$Password = ConvertTo-SecureString "Aa12345" -AsPlaintext -Force
$cred = New-Object System.Management.Automation.PsCredential($User,$Password)
Add-Computer -DomainName "RED.local" -Credential $cred

