#Locatie moet misschien aangepast worden
#Mount-DiskImage 'C:\Users\vagrant\Desktop\en_sql_server_2016_enterprise_x64_dvd_8701793.iso'
#bootable usb
Write-Host 'Disk mounten'
Mount-DiskImage 'D:\Setup\Bestanden\en_sql_server_2014_enterprise_edition_with_service_pack_1_x64_dvd_6669618.iso'
Write-Host 'SQL Installeren'
#Locatie moet misschien aangepast worden // Verschillende schijfmogelijkheden (standaard D:\)
G:\setup.exe /configurationfile="D:\Setup\Bestanden\ConfigurationFile.ini"
Write-Host 'Done'