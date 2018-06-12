New-ADOrganizationalUnit -Name "RED"

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
