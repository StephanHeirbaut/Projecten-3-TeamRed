#Java.exe moet via bootable usb meegegeven worden.
Write-Host 'Java installeren'
Start-Process -FilePath "D:\Setup\Bestanden\JreJava.exe" -ArgumentList '/s' -wait -PassThru
Write-Host '.Net Installeren'
#Install-Module servermanager
Mount-DiskImage "D:\Setup\Bestanden\en_windows_server_2016_x64_dvd_9327751.iso"
install-WindowsFeature Net-Framework-Core -source F:\sources\sxs
Write-Host 'Done'
