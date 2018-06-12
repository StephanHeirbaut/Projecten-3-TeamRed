
#OU aanmaken
New-ADOrganizationalUnit -Name "RED" ;

#Sub OU aanmaken
New-ADOrganizationalUnit -Name "Administratie" -Path "OU=RED,DC=red,DC=local";
New-ADOrganizationalUnit -Name "Directie" -Path "OU=RED,DC=red,DC=local";
New-ADOrganizationalUnit -Name "IT Administratie" -Path "OU=RED,DC=red,DC=local";
New-ADOrganizationalUnit -Name "Ontwikkeling" -Path "OU=RED,DC=red,DC=local";
New-ADOrganizationalUnit -Name "Verkoop" -Path "OU=RED,DC=red,DC=local";
New-ADOrganizationalUnit -Name "Werkstations" -Path "OU=RED,DC=red,DC=local";

#Groepen aanmaken
New-ADGroup -Name "Administratie" -SamAccountName "Administratie" -GroupCategory Security -GroupScope Global -DisplayName "Administratie" -Path "OU=Administratie,OU=RED,DC=red,DC=local"
New-ADGroup -Name "Directie" -SamAccountName "Directie" -GroupCategory Security -GroupScope Global -DisplayName "Directie" -Path "OU=Directie,OU=RED,DC=red,DC=local"
New-ADGroup -Name "IT Administratie" -SamAccountName "IT Administratie" -GroupCategory Security -GroupScope Global -DisplayName "IT Administratie" -Path "OU=IT Administratie,OU=RED,DC=red,DC=local"
New-ADGroup -Name "Ontwikkeling" -SamAccountName "Ontwikkeling" -GroupCategory Security -GroupScope Global -DisplayName "Ontwikkeling" -Path "OU=Ontwikkeling,OU=RED,DC=red,DC=local"
New-ADGroup -Name "Verkoop" -SamAccountName "Verkoop" -GroupCategory Security -GroupScope Global -DisplayName "Verkoop" -Path "OU=Verkoop,OU=RED,DC=red,DC=local"

#Gebruiker aanmaken in de groep Administratie
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "John Smet" -Name "John Smet" -Path "OU=Administratie,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "John" -UserPrincipalName ("john.smet"+"@red.local") -Enabled $true -ChangePasswordAtLogon $false;
$user = Get-ADUser "CN=John Smet,OU=Administratie,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Administratie,OU=Administratie,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep Directie
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Lien Smet" -Name "Lien Smet" -Path "OU=Directie,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Lien" -UserPrincipalName ("lien.smet"+"@red.local") -Enabled $true -ChangePasswordAtLogon $false;
$user = Get-ADUser "CN=Lien Smet,OU=Directie,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Directie,OU=Directie,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep IT Administratie
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Henry Smet" -Name "Henry Smet" -Path "OU=IT Administratie,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Henry" -UserPrincipalName ("henry.smet"+"@red.local") -Enabled $true -ChangePasswordAtLogon $false;
$user = Get-ADUser "CN=Henry Smet,OU=IT Administratie,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=IT Administratie,OU=IT Administratie,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep Ontwikkeling
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Laura Smet" -Name "Laura Smet" -Path "OU=Ontwikkeling,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Laura" -UserPrincipalName ("laura.smet"+"@red.local") -Enabled $true -ChangePasswordAtLogon $false;
$user = Get-ADUser "CN=Laura Smet,OU=Ontwikkeling,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Ontwikkeling,OU=Ontwikkeling,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep Verkoop
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Dirk Smet" -Name "Dirk Smet" -Path "OU=Verkoop,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Dirk" -UserPrincipalName ("dirk.smet"+"@red.local") -Enabled $true -ChangePasswordAtLogon $false;
$user = Get-ADUser "CN=Dirk Smet,OU=Verkoop,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Verkoop,OU=Verkoop,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Groep policies aanmaken en linken met OU's
new-gpo -name ControlPanelGameLink | new-gplink -target "OU=Administratie,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=Verkoop,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=IT Administratie,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=Ontwikkeling,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=Directie,OU=RED,DC=red,dc=local"

#Groep policies aanmaken en linken met OU's
new-gpo -name Netwerkadapter | new-gplink -target "OU=Verkoop,OU=RED,DC=red,dc=local"
New-GPLink -Name Netwerkadapter -Target "OU=IT Administratie,OU=RED,DC=red,dc=local"

#Groep policies aanmaken en linken met OU's
new-gpo -name FileServer | new-gplink -target "DC=red,dc=local"

#Groep policies aanmaken en linken met OU's
new-gpo -name SQLpoortenVoorSCCM2012R2 | new-gplink -target "DC=red,dc=local"


#Policies importeren
Import-GPO -BackupID "058EA888-9327-48D6-98A4-DCA8FF5ACC64" -Path "D:\backup\" -TargetName "Netwerkadapter"
Import-GPO -BackupID "C1C534A3-1039-42B5-9C3A-CBFBD710B182" -Path "D:\backup\" -TargetName "ControlPanelGameLink"
Import-GPO -BackupID "A6C24491-2822-4A58-B11F-605982B160D5" -Path "D:\backup\" -TargetName "FileServer"
Import-GPO -BackupID "09068053-EC76-4B2A-B9FE-0BC6DD0290D1" -Path "D:\backup\" -TargetName "SQLpoortenVoorSCCM2012R2"
