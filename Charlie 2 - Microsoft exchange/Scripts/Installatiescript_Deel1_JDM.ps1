
#Installing pre-requisites
ECHO "Installing pre-requisites"
ECHO "Installing OS roles and features"
Install-WindowsFeature AS-HTTP-Activation, Desktop-Experience,
 RPC-over-HTTP-proxy, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth,
 Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging,
 Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter,
 Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service,
 Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression,
 Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation
ECHO "Done installing roles en features"

#NET-Framework
ECHO "Installing NET-Framework-45-Features"
Install-WindowsFeature NET-Framework-45-Features
ECHO "Done installing NET-Framework-45-Features"

#RSAT-ADDS
ECHO "Installing Pre-Requisites"
Install-WindowsFeature RSAT-ADDS,
RSAT-Clustering,RSAT-Clustering-CmdInterface,
RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell
ECHO "done installing ADLDS"

###################UCMA-START##################################
#Check if ucma-folder already exist
if(Test-Path ucma)
{
$directoryInfo = Get-ChildItem ucma | Measure-Object
if($directoryInfo.count -eq 0)
{
	Remove-Item ucma 
}
}

#making ucma folder
ECHO "Making folder for setupfiles"
if(!(Test-Path ucma))
{
new-item ucma -itemtype directory 
}else
{
ECHO "Already created"
}
ECHO "Place Setupfiles in C:\Users\Administrator\Documents\ucma "

Write-Host "Press any key to continue"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

.\ucma\UcmaRuntimeSetup.exe -q
###################UCMA-END##################################

#Restarting PC !NEED TO BE AT END!
Write-Host "Press any key to restart"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

Restart-Computer
