
#Gebruiker aanmaken in de groep Administratie
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "John Smet" -Name "John Smet" -Path "OU=Administratie,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "John" -UserPrincipalName ("john.smet"+"@red.local") -Enabled $true -ChangePasswordAtLogon $false -ProfilePath "\\lima2\ProfileDirs\%username%" -HomeDrive "Q" -HomeDirectory "\\lima2\HomeDirs\%username%";
$user = Get-ADUser "CN=John Smet,OU=Administratie,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Administratie,OU=Administratie,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep Directie
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Lien Smet" -Name "Lien Smet" -Path "OU=Directie,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Lien" -UserPrincipalName ("lien.smet"+"@red.local") -Enabled $true -ChangePasswordAtLogon $false -ProfilePath "\\lima2\ProfileDirs\%username%" -HomeDrive "Q" -HomeDirectory "\\lima2\HomeDirs\%username%";
$user = Get-ADUser "CN=Lien Smet,OU=Directie,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Directie,OU=Directie,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep IT Administratie
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Henry Smet" -Name "Henry Smet" -Path "OU=IT Administratie,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Henry" -UserPrincipalName ("henry.smet"+"@red.local") -Enabled $true -ChangePasswordAtLogon $false -ProfilePath "\\lima2\ProfileDirs\%username%" -HomeDrive "Q" -HomeDirectory "\\lima2\HomeDirs\%username%";
$user = Get-ADUser "CN=Henry Smet,OU=IT Administratie,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=IT Administratie,OU=IT Administratie,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep Ontwikkeling
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Laura Smet" -Name "Laura Smet" -Path "OU=Ontwikkeling,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Laura" -UserPrincipalName ("laura.smet"+"@red.local") -Enabled $true -ChangePasswordAtLogon $false -ProfilePath "\\lima2\ProfileDirs\%username%" -HomeDrive "Q" -HomeDirectory "\\lima2\HomeDirs\%username%";
$user = Get-ADUser "CN=Laura Smet,OU=Ontwikkeling,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Ontwikkeling,OU=Ontwikkeling,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep Verkoop
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Dirk Smet" -Name "Dirk Smet" -Path "OU=Verkoop,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Dirk" -UserPrincipalName ("dirk.smet"+"@red.local") -Enabled $true -ChangePasswordAtLogon $false -ProfilePath "\\lima2\ProfileDirs\%username%" -HomeDrive "Q" -HomeDirectory "\\lima2\HomeDirs\%username%";
$user = Get-ADUser "CN=Dirk Smet,OU=Verkoop,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Verkoop,OU=Verkoop,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;
