#Ip adres 
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "172.18.0.4" -PrefixLength 24 -DefaultGateway "172.18.0.1"
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 172.18.0.2

#Firewall afzetten

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False