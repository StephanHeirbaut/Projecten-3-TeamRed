Set-ExecutionPolicy Unrestricted -Force
Write-Host "Mounting Disks" -Foregroundcolor Green

Mount-DiskImage -ImagePath D:\USB\ISO\WindowsServer2016EN.iso
Mount-DiskImage -ImagePath D:\USB\ISO\WindowsSharePointServer2016EN.iso
Mount-DiskImage -ImagePath D:\USB\ISO\Mike2.iso

#Directory path where SP 2016 RTM files are kept 
$PreRequsInstallerPath= "G:"  
 
#Directory path where SP 2016 Pre-requisites files are kept 
$PreRequsFilesPath = "C:\SharePointInstall\SharePoint_Prerequisites\PrerequisiteInstaller\" 
 
Start-Process "$PreRequsInstallerPath\PrerequisiteInstaller.exe" -Wait -ArgumentList /unattended