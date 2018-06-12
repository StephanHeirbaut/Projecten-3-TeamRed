Set-ExecutionPolicy Unrestricted -Force
Write-Host "Mounting Disks" -Foregroundcolor Green

Mount-DiskImage -ImagePath D:\USB\ISO\WindowsServer2016EN.iso
Mount-DiskImage -ImagePath D:\USB\ISO\WindowsSharePointServer2016EN.iso
Mount-DiskImage -ImagePath D:\USB\ISO\Mike2.iso

Start-Process "G:\PrerequisiteInstaller.exe" -Wait -ArgumentList /continue
Write-Host "Prerequisites Installed, please connect to the red.local network" 
Write-Host "Continue to setup"

Start-Process "G:\setup.exe" -ArgumentList "/config C:\SPInstall.xml" -WindowStyle Minimized -wait