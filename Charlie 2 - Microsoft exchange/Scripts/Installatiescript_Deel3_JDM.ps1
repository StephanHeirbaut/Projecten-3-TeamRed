#Run exchange setup + prepare Active Directory
C:\Users\Administrator\Documents\ExchangeFiles\setup /PrepareAD /OrganizationName:"Red" /IAcceptExchangeServerLicenseTerms

Write-Host "Press any key to continue"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

C:\Users\Administrator\Documents\ExchangeFiles\setup /role:ClientAccess,Mailbox /IAcceptExchangeServerLicenseTerms