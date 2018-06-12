mkdir "C:\tools\mysql\mysql-5.7.17-winx64\data"
icacls "C:\tools\mysql\mysql-5.7.17-winx64\data" /grant "LOCAL SERVICE":(OI)(CI)F /T

cd "C:\tools\mysql\mysql-5.7.17-winx64\bin"

mysqld --console
