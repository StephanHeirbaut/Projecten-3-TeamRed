Start-Process "e:\PrerequisiteInstaller.exe" -Wait -ArgumentList /continue
Write-Host "Prerequisites Installed"
Write-Host "Continue to setup"
Start-Process "e:\setup.exe" -ArgumentList "/config C:\SPInstall.xml" -WindowStyle Minimized -wait