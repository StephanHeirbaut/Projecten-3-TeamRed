xcopy /S E:\Setup\Scripts\
 C:\Users\Administrator\Documents\Scripts xcopy /S  E:\Setup\Bestanden\

powershell C:\Users\Administrator\Documents\Installattie "& 'C:\Users\Administrator\Documents\Scripts\0.ServerConfigNameIP.ps1'"
powershell "& 'C:\Users\Administrator\Documents\Scripts\1.preInstallDirectories.ps1'"
powershell "& 'C:\Users\Administrator\Documents\Scripts\2.InstallJava.ps1'"
powershell "& 'C:\Users\Administrator\Documents\Scripts\3.FirewallEnable.ps1'"
powershell "& 'C:\Users\Administrator\Documents\Scripts\4.InstallSql.ps1'"
powershell "& 'C:\Users\Administrator\Documents\Scripts\5.InstallSqlManagementStudio.ps1'"
