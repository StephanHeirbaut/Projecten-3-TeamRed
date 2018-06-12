Set-ExecutionPolicy Unrestricted -Force
Write-Host "Mounting Disks" -Foregroundcolor Green

Mount-DiskImage -ImagePath D:\USB\ISO\WindowsServer2016EN.iso
Mount-DiskImage -ImagePath D:\USB\ISO\WindowsSharePointServer2016EN.iso
Mount-DiskImage -ImagePath D:\USB\ISO\Mike2.iso

Write-Host "Installing Features" -ForegroundColor Green

Write-Host " - Importing Module Servermanager..."  
Import-Module Servermanager

Write-Host " - Installing .NET Framework Feature..."  
get-windowsfeature|where{$_.name -eq "NET-Framework-Core"}|install-windowsfeature –Source F:\sources\sxs  
get-windowsfeature|where{$_.name -eq "NET-HTTP-Activation"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "NET-Non-HTTP-Activ"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "NET-WCF-HTTP-Activation45"}|install-windowsfeature

Write-Host " - Installing 'Application Server' role..."  
get-windowsfeature|where{$_.name -eq "AS-AppServer-Foundation"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "AS-Web-Support"}|install-windowsfeature

Write-Host " - Installing 'Web Server' role..."  
get-windowsfeature|where{$_.name -eq "Web-Static-Content"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Default-Doc"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Dir-Browsing"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Http-Errors"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Http-Redirect"}|install-windowsfeature

get-windowsfeature|where{$_.name -eq "Web-App-Dev"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Asp-Net45"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Net-Ext"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Net-Ext45"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-ISAPI-Ext"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-ISAPI-Filter"}|install-windowsfeature

get-windowsfeature|where{$_.name -eq "Web-Http-Logging"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Log-Libraries"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Request-Monitor"}|install-windowsfeature

get-windowsfeature|where{$_.name -eq "Web-Stat-Compression"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Dyn-Compression"}|install-windowsfeature

get-windowsfeature|where{$_.name -eq "Web-Filtering"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Basic-Auth"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Windows-Auth"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Digest-Auth"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Client-Auth"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Cert-Auth"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Url-Auth"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-IP-Security"}|install-windowsfeature

get-windowsfeature|where{$_.name -eq "Web-Mgmt-Tools"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Mgmt-Console"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Mgmt-Compat"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Metabase"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Lgcy-Mgmt-Console"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Lgcy-Scripting"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-WMI"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "Web-Scripting-Tools"}|install-windowsfeature

Write-Host " - Installing WAS Feature..."  
get-windowsfeature|where{$_.name -eq "WAS-Process-Model"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "WAS-NET-Environment"}|install-windowsfeature  
get-windowsfeature|where{$_.name -eq "WAS-Config-APIs"}|install-windowsfeature

Write-Host " - Installing Windows Identity Foundation Feature..."  
get-windowsfeature|where{$_.name -eq "Windows-Identity-Foundation"}|install-windowsfeature

Write-Host "Copying Files" -ForegroundColor Green

Write-Host '1/3 begin'
Copy -Path H:\* -Destination c:\
Write-Host '1/3 done'
Write-Host '2/3 begin'
Copy -Path H:\SharePointInstall\* -Destination C:\SharePointInstall
Write-Host '2/3 done'
Write-Host '3/3 begin'
Copy -Path H:\SharePointInstall\SharePoint_Prerequisites\* -Destination C:\SharePointInstall\SharePoint_Prerequisites
Write-Host '3/3 done'
Copy -Path H:\SharePointInstall\SharePoint_Prerequisites\PrerequisiteInstaller\* -Destination C:\SharePointInstall\SharePoint_Prerequisites\PrerequisiteInstaller
Write-Host 'finished'

Write-Host "Disabling IE ESC" -ForegroundColor Green

$AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
$UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0 -Force
Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0 -Force
Write-Host "IE Enhanced Security Configuration (ESC) has been disabled."

Write-Host "Starting PrerequisiteInstaller, this may need a restart of the system" -ForegroundColor Green

Write-Host "Starting Windows Update Service"
Start-Service wuauserv
Write-Host "Windows Update Service Started"

#Directory path where SP 2016 RTM files are kept 
$PreRequsInstallerPath= "G:"  
 
#Directory path where SP 2016 Pre-requisites files are kept 
$PreRequsFilesPath = "C:\SharePointInstall\SharePoint_Prerequisites\PrerequisiteInstaller\" 
 
Start-Process "$PreRequsInstallerPath\PrerequisiteInstaller.exe" -Wait -ArgumentList /unattended