Set-ExecutionPolicy Unrestricted 

Write-Host "Keyboard lay-out wordt aangepast naar NL-BE"

Set-WinUserLanguageList -LanguageList NL-BE

Write-Host "IIS zal nu geïnstalleerd worden."

import-module servermanager
add-windowsfeature web-server -includeallsubfeature

Write-Host "ASP.NET zal nu geïnstalleerd worden."

Install-WindowsFeature Net-Framework-Core -source \\network\share\sxs

Write-Host "Controleren installatie ASP.NET"

Get-WindowsFeature
