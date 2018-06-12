# Testplan

##  Extracting files voor Exchange Server

1. Start de computer met Windows Server op.
2. Browse naar "C:\Users\Administrator\Documents"
3. U krijgt een geen folder ExchangeFiles te zien.
4. Nu moet u de Files voor de Exchange Server extracten a.h.v. volgende script(of maak gebruik van de script in de repository Charlie 2 -Exchange Server/Scripts/Installatiescript_Deel2_JDM):
**volg ook de stappen die het script vraagt**

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



7. Browse weer naar "C:\Users\Administrator\Documents"
8. Als u daar een folder ExchangeFiles ziet met daarin meerdere bestande, is de test succesvol




