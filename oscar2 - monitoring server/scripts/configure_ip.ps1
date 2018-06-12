new-NetIPAddress -InterfaceIndex 12 –IPAddress 172.18.0.10 –PrefixLength 24 -DefaultGateway 172.18.0.1
Set-DnsClientServerAddress -InterfaceIndex 12 -ServerAddresses 172.18.2.67