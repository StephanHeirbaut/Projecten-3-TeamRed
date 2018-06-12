Write-Host "Starting Windows Update Service"
Start-Service wuauserv
Write-Host "Windows Update Service Started"
Write-Host "Installing Prerequisites, this may take a few minutes"

#Directory path where SP 2016 RTM files are kept 
$PreRequsInstallerPath= "E:"  
 
#Directory path where SP 2016 Pre-requisites files are kept 
$PreRequsFilesPath = "C:\SharePointInstall\SharePoint_Prerequisites\PrerequisiteInstaller\" 
 
Start-Process "$PreRequsInstallerPath\PrerequisiteInstaller.exe" -Wait -ArgumentList /unattended,/idfx11:$PreRequsFilesPath\MicrosoftIdentityExtensions-64.msi,/Sync:$PreRequsFilesPath\Synchronization.msi,/AppFabric:$PreRequsFilesPath\WindowsServerAppFabricSetup_x64.exe,/kb3092423:$PreRequsFilesPath\AppFabric-KB3092423-x64-ENU.exe,/MSIPCClient:$PreRequsFilesPath\setup_msipc_x64.exe,/msvcrt11:$PreRequsFilesPath\vc_redist.x64.exe,/msvcrt14:$PreRequsFilesPath\vcredist_x64.exe,/dotnetfx:$PreRequsFilesPath\NDP47-KB3186497-x86-x64-AllOS-ENU.exe

