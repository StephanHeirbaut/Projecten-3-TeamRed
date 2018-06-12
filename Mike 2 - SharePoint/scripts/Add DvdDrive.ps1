Write-Host 'Stopping VM WinSer16'
Stop-VM -Name WinSer16 -Force
Write-Host 'WinSer16 Stopped'
Write-Host 'Adding Dvd Disks'
Write-Host 'Adding 1/3: Windows Server 2016 ISO'
Add-VMDvdDrive -VMName WinSer16 -ControllerLocation 1 -ControllerNumber 0
Set-VMDvdDrive -VMName WinSer16 -ControllerLocation 1 -ControllerNumber 0 -Path C:\ISO\WindowsServer2016EN.iso
Write-Host 'Windows Server 2016 ISO Added'
Write-Host 'Adding 2/3: Windows SharePoint Server 2016 ISO'
Add-VMDvdDrive -VMName WinSer16 -ControllerLocation 0 -ControllerNumber 1
Set-VMDvdDrive -VMName WinSer16 -ControllerLocation 0 -ControllerNumber 1 -Path C:\ISO\WindowsSharePointServer2016EN.iso
Write-Host 'Windows SharePoint Server 2016 ISO Added'
Write-Host 'Adding 3/3: Mike 2 Prerequisites ISO'
Add-VMDvdDrive -VMName WinSer16 -ControllerLocation 1 -ControllerNumber 1
Set-VMDvdDrive -VMName WinSer16 -ControllerLocation 1 -ControllerNumber 1 -Path C:\ISO\Mike2.iso
Write-Host 'Mike 2 Prerequisites ISO Added'
Write-Host 'Starting VM'
Start-VM -Name WinSer16
Write-Host 'Done'

