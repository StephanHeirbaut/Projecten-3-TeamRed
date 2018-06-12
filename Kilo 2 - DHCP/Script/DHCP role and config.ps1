Add-WindowsFeature -IncludeManagementTools dhcp
netsh dhcp add securitygroups
Restart-service dhcpserver
Add-DhcpServerInDC DHCPServer 172.18.2.67

Add-DhcpServerv4Scope -ComputerName DHCPServer -Name "VLAN200" -StartRange 172.18.0.50 -EndRange 172.18.0.100 -SubnetMask 255.255.254.0
Set-DhcpServerv4OptionValue -ComputerName DHCPServer -Router 172.18.0.1 -DnsServer 172.18.2.67 -DnsDomain red.local

Add-DhcpServerv4ExclusionRange -ScopeId 172.18.0.0 -StartRange 172.18.0.0 -EndRange 172.18.0.49
