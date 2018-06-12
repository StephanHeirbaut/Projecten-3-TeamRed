 echo No reboots required. Hit enter, get some coffee, sit back and enjoy the ride.
 pause
#Enable-ADAccount svcSQL
 C:\Sources\SQL2012SP1\Setup.exe /qs /ACTION=Install /FEATURES=SQL,RS,Tools /INSTANCENAME=MSSQLSERVER /SQLSVCACCOUNT="red.local\Administrator" /SQLSVCPASSWORD="Aa12345" /SQLSYSADMINACCOUNTS="red.local\Domain Admins" /AGTSVCACCOUNT="NT AUTHORITY\Network Service" /IACCEPTSQLSERVERLICENSETERMS /SQLCOLLATION=SQL_Latin1_General_CP1_CI_AS
 