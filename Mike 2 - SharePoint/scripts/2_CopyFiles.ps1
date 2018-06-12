Write-Host '1/3 begin'
Copy -Path F:\* -Destination c:\
Write-Host '1/3 done'
Write-Host '2/3 begin'
Copy -Path F:\SharePointInstall\* -Destination C:\SharePointInstall
Write-Host '2/3 done'
Write-Host '3/3 begin'
Copy -Path F:\SharePointInstall\SharePoint_Prerequisites\* -Destination C:\SharePointInstall\SharePoint_Prerequisites
Write-Host '3/3 done'
Copy -Path F:\SharePointInstall\SharePoint_Prerequisites\PrerequisiteInstaller\* -Destination C:\SharePointInstall\SharePoint_Prerequisites\PrerequisiteInstaller
Write-Host 'finished'