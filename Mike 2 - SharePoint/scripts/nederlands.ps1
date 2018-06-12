Write-Host 'script uitvoeren'
$nederlands = New-WinUserLanguageList nl-BE
$nederlands[0].handwriting = 1
Set-WinUserLanguageList $nederlands -force
Write-Host 'script succesvol'