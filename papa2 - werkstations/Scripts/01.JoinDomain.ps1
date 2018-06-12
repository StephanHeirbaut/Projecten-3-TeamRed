 echo No reboots required. Hit enter, get some coffee, sit back and enjoy the ride.
 pause
$domain = "red.local"
$password = "Aa12345" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\Administrator"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential
