echo =======================================================================
 echo ======== INSTALL SITE SERVER AND PREREQS SCRIPT =========
 echo ======== By: Douwe van de Ruit =========
 echo =======================================================================
 echo Before proceeding make sure to copy sources from ADK, SQL 2012 SP1,
 echo SQL 2012 CU2, Windows 2012 sxs and ConfigMgr R2 echo to
 echo C:\Sources\ADK, C:\Sources\SCCM2012R2, C:\Sources\SQL2012SP1,
 echo C:\Sources\SQL2012CU2 and C:\Sources\sxs. Pre-download all prereq
 echo files for ConfigMgr to C:\Sources\SCCM2012R2\Downloads. Tested on Hyper-V.
 echo No reboots required. Hit enter, get some coffee, sit back and enjoy the ride.
 pause
 #server prereqs
 Get-Module servermanager
 Install-WindowsFeature Web-Windows-Auth
 Install-WindowsFeature Web-ISAPI-Ext
 Install-WindowsFeature Web-Metabase
 Install-WindowsFeature Web-WMI
 Install-WindowsFeature BITS
 Install-WindowsFeature RDC
 Install-WindowsFeature NET-Framework-Features
 Install-WindowsFeature Web-Asp-Net
 Install-WindowsFeature Web-Asp-Net45
 Install-WindowsFeature NET-HTTP-Activation
 Install-WindowsFeature NET-Non-HTTP-Activ
 Install-WindowsFeature WDS
 dism /online /enable-feature /featurename:NetFX3 /all /Source:c:\sources\sxs /LimitAccess
 #install adk components
 cmd /c C:\Sources\ADK8.1\adksetup.exe /quiet /installpath 'C:\Program Files (x86)\Windows Kits\8.1' /features OptionId.DeploymentTools OptionId.WindowsPreinstallationEnvironment OptionId.UserStateMigrationTool
 #install sql db
 #New-ADUser -SamAccountName svcSQL -AccountPassword (ConvertTo-SecureString -AsPlainText "P@ssw0rd" -Force) -name "svcSQL" -enabled $true -PasswordNeverExpires $true -ChangePasswordAtLogon $false
 #Enable-ADAccount svcSQL
 C:\Sources\SQL2012SP1\Setup.exe /qs /ACTION=Install /FEATURES=SQL,RS,Tools /INSTANCENAME=MSSQLSERVER /SQLSVCACCOUNT="red.local\Administrator" /SQLSVCPASSWORD="Aa12345" /SQLSYSADMINACCOUNTS="red.local\Domain Admins" /AGTSVCACCOUNT="NT AUTHORITY\Network Service" /IACCEPTSQLSERVERLICENSETERMS /SQLCOLLATION=SQL_Latin1_General_CP1_CI_AS
 #install configMgr
 C:\Sources\SCCM2012R2\SMSSETUP\BIN\X64\setup.exe /script C:\Sources\Site-setup.ini /nouserinput
