 echo No reboots required. Hit enter, get some coffee, sit back and enjoy the ride.
 pause
#Install WSUS
Install-WindowsFeature -Name UpdateServices-Services,UpdateServices-DB -IncludeManagementTools
.\wsusutil.exe postinstall SQL_INSTANCE_NAME="DC1\SQL2014" CONTENT_DIR=C:\WSUS