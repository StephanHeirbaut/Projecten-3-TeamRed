$domain = "RED"
$password = "Aa12345" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\Administrator" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential
Restart-Computer
