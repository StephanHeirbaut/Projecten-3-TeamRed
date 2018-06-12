start-process powershell -verb runas -argument c:/users/vagrant/documents/configureIp.ps1
Start-Sleep -s 5
start-process powershell -verb runas -argument c:/users/vagrant/documents/domain.ps1
