$file = get-content C:\MySQL\mysql-5.7.17-winx64\mysqldata\vagrant-2012-r2.err
foreach ($line in $file) { 
    if ($line -like "*A temporary password is generated*") {
$line.split()[-1] | out-file -FilePath "C:\password.txt" -Append
Write-Host $line.split()[-1]
$pas = $line.Split()[-1]
cd "C:\vagrant\files"
cmd.exe /c "loginMySQL.bat" 
    }
}
