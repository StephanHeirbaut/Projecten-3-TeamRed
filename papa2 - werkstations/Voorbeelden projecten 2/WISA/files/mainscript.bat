powershell.exe -ExecutionPolicy Bypass -Command "C:\vagrant\files\installeerIISDotNetVeranderKeyboard.ps1"

timeout 3

call installChocolateyEnMySQL.bat

timeout 3

call startMySQL.bat

timeout 3

cd "C:\tools\mysql\mysql-5.7.17-winx64\bin"
mysql -u root -p
