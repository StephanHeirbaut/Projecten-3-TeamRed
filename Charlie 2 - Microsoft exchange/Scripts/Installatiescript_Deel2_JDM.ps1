#Check if exchangefiles folder already exist
if(Test-Path ExchangeFiles)
{
$directoryInfo = Get-ChildItem ExchangeFiles | Measure-Object
if($directoryInfo.count -eq 0)
{
	Remove-Item ExchangeFiles 
}
}

#making exchangefiles folder
ECHO "Making folder for setupfiles"
if(!(Test-Path ExchangeFiles))
{
new-item ExchangeFiles -itemtype directory 
}else
{
ECHO "Already created"
}
ECHO "Place Setupfiles in C:\Users\Administrator\Documents\ExchangeFiles "

Write-Host "Press any key to continue"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

#running setupfiles
start-sleep -m 5
.\ExchangeFiles\Exchange2013-x64-SP1.exe 

#entering DIR & pressing enter
start-sleep -m 50000
$wshShell = new-object -com wscript.shell
$wshShell.SendKeys("C:\Users\Administrator\Documents\ExchangeFiles")
start-sleep -m 5
$wshShell.SendKeys("{Enter}") 
$wshShell.SendKeys("{Enter}")
ECHO "Extracting"

######NOT DONE########
#Checking if extraction is complete
<#
start-sleep -m 500
$ProcessActive = Get-Process |  Where {$_.name -Match "Extracting"} | Format-Wide -Column 1
$CheckNull = $ProcessActive -eq $true

do
{
ECHO "test"
start-sleep -m 50000
$ProcessActive = Get-Process |  Where {$_.name -Match "Extracting"} 
$CheckTrue = $ProcessActive -eq $false
ECHO "Still extracting"
}
while($CheckNull -eq $true)
#>




