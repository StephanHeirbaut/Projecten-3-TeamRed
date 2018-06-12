$User = "red\administrator"
$Password = ConvertTo-SecureString "Password" -AsPlaintext -Force
$cred = New-Object System.Management.Automation.PsCredential($User,$Password)
Add-Computer -DomainName "red.local" -Credential $cred
