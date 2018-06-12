Write-Host 'Firewall profile'
#Code voor servers slack
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
Write-Host 'Firewall Rule Port 1433'
New-NetFirewallRule -DisplayName "MSSQL ENGINE TCP" -Direction Inbound -LocalPort 1433 -Protocol TCP -Action Allow