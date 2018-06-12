
#shares & permissions

new-smbshare -name VerkoopData -Path: D:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "Verkoop"
new-smbshare -name OntwikkelingData -Path: E:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "Ontwikkeling"
new-smbshare -name ITData -Path: F:\ -EncryptData $False -FullAccess "IT Administratie"
new-smbshare -name DirData -Path: G:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "Directie"
new-smbshare -name AdminData -Path: H:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "Administratie"
new-smbshare -name HomeDirs -Path: Y:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "everyone"
new-smbshare -name ProfileDirs -Path: Z:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "everyone"
new-smbshare -name ShareVerkoop -Path: J:\ -EncryptData $False -FullAccess "IT Administratie" -ReadAccess "Ontwikkeling" -ChangeAccess "Verkoop"
 
# quotas

#$Action = New-FsrmAction -Type Command -Command "c:\windows\system32\cmd.exe" -CommandParameters "echo  >> c:\log.txt" -ShouldLogError
#$Threshold = New-FsrmQuotaThreshold -Percentage 90 -Action $action

New-FsrmQuota -Path "D:\" -Description "VerkoopData Quota" -Size 100MB #-Threshold $Threshold
New-FsrmQuota -Path "G:\" -Description "DirData Quota" -Size 100MB #-Threshold $Threshold
New-FsrmQuota -Path "H:\" -Description "AdminData Quota" -Size 100MB #-Threshold $Threshold

New-FsrmQuota -Path "E:\" -Description "OntwikkelingData Quota" -Size 200MB #-Threshold $Threshold
New-FsrmQuota -Path "F:\" -Description "ITData Quota" -Size 200MB #-Threshold $Threshold

# shadowcopy

# is enabling shadowcopies even possible with powershell? 
# activation of vss seems gui-only? https://mcpmag.com/articles/2015/12/07/creating-volume-shadow-copies.aspx

# perhaps this works?? check later:
# http://juventusitprofessional.blogspot.be/2013/11/windows-powershell-shadow-copy.html
vssadmin add shadowstorage /for=H: /on=C: /MaxSize=500MB

#Set Shadow Copy Scheduled Task for H: PM
$Action=new-scheduledtaskaction -execute "c:\windows\system32\vssadmin.exe" -Argument "create shadow /for=H:"
$Trigger=new-scheduledtasktrigger -daily -at 06:00PM
Register-ScheduledTask -TaskName ShadowCopyH_PM -Trigger $Trigger -Action $Action -Description "ShadowCopyH_PM"

# this seems to work, but how do i schedule it for automatic daily copies?

#check this out aswell https://social.technet.microsoft.com/Forums/ie/en-US/fb69840d-5f52-4711-8168-2faa23088233/shadow-copy-schedule-per-script?forum=winserverfiles
