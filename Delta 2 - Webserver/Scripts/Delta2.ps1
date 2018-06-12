function main(){

    Timezone

    Firewall
    
    Install_IIS

    Install_ASP.NET

    setIpAddress
    
    setDomain

    #renameServer (rename zit in autounattend )

}

function Timezone()
{
    Set-TimeZone -Name "Central Europe Standard Time" 
}

function Firewall()
{
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
}

function Install_IIS()
{
    Write-Host "Istalling IIS ..." -ForegroundColor Green
    Install-WindowsFeature -name Web-Server -IncludeManagementTool

       $feature=Get-WindowsFeature Web-Default-Doc
   $featureInstalled = $feature.Installed

	if(-NOT ($featureInstalled))
	{
		Add-WindowsFeature Web-Default-Doc
	}
	
   $feature=Get-WindowsFeature Web-Dir-Browsing
   $featureInstalled = $feature.Installed

	if(-NOT ($featureInstalled))
	{
		Add-WindowsFeature Web-Dir-Browsing
	}
	
	$feature=Get-WindowsFeature Web-Http-Errors
    $featureInstalled = $feature.Installed

	if(-NOT ($featureInstalled))
	{
		Add-WindowsFeature Web-Http-Errors
	}
	
	$feature=Get-WindowsFeature Web-Static-Content
    $featureInstalled = $feature.Installed

	if(-NOT ($featureInstalled))
	{
		Add-WindowsFeature Web-Static-Content
	}
	
	$feature=Get-WindowsFeature Web-Http-Logging
    $featureInstalled = $feature.Installed

	if(-NOT ($featureInstalled))
	{
		Add-WindowsFeature Web-Http-Logging
	}
	
	$feature=Get-WindowsFeature Web-Request-Monitor
    $featureInstalled = $feature.Installed

	if(-NOT ($featureInstalled))
	{
		Add-WindowsFeature Web-Request-Monitor
	}
	
	$feature=Get-WindowsFeature Web-Http-Tracing
    $featureInstalled = $feature.Installed

	if(-NOT ($featureInstalled))
	{
		Add-WindowsFeature Web-Http-Tracing
	}
	
	$feature=Get-WindowsFeature Web-Stat-Compression
    $featureInstalled = $feature.Installed

	if(-NOT ($featureInstalled))
	{
		Add-WindowsFeature Web-Stat-Compression
	}

    $feature=Get-WindowsFeature Web-Filtering
    $featureInstalled = $feature.Installed

    if(-NOT ($featureInstalled))
    {
        Add-WindowsFeature Web-Filtering
    }


    $feature=Get-WindowsFeature Web-Net-Ext45
    $featureInstalled = $feature.Installed

    if(-NOT ($featureInstalled))
    {
        Add-WindowsFeature Web-Net-Ext45
    }


    $feature=Get-WindowsFeature Web-Asp-Net45
    $featureInstalled = $feature.Installed

    if(-NOT ($featureInstalled))
    {
        Add-WindowsFeature Web-Asp-Net45
    }

    $feature=Get-WindowsFeature Web-ISAPI-Ext
    $featureInstalled = $feature.Installed

    if(-NOT ($featureInstalled))
    {
        Add-WindowsFeature Web-ISAPI-Ext
    }


    $feature=Get-WindowsFeature Web-ISAPI-Filter
    $featureInstalled = $feature.Installed

    if(-NOT ($featureInstalled))
    {
        Add-WindowsFeature Web-ISAPI-Filter
    }


    
}

function Install_ASP.NET
{
    Write-Host "Installing NET-Framework-45-ASPNET ... " -ForegroundColor Green
    Add-WindowsFeature NET-Framework-45-ASPNET
    Write-Host "Installing NET-HTTP-Activation ..." -ForegroundColor Green
    Add-WindowsFeature NET-WCF-HTTP-Activation45
   
}

function setIpAddress()
{

<# Als $wmi niets teruggeeft bij het uitvoeren, aanpassen van de switch in Hyper-V #>
<#
$wmi = Get-WmiObject win32_networkadapterconfiguration -filter "ipenabled = 'true'"
$wmi.EnableStatic("172.18.2.70", "255.255.255.224")
$wmi.SetGateways("172.18.2.65", 1)
$wmi.SetDNSServerSearchOrder("0.0.0.0")
#>
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress "172.18.2.70" -PrefixLength 27 -DefaultGateway "172.18.2.65"
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses "172.18.2.67"

#Write-Host "New Ip address and DNS are set. And ready to go ;) " -ForegroundColor Green

}

function setDomain()
{


$credential = New-Object System.Management.Automation.PSCredential("red.local\Administrator",(ConvertTo-SecureString "Aa12345" -AsPlainText -Force))
Add-Computer -DomainName red.local -Credential $credential

}

function renameServer()
{

$domain="red.local"
$password = "Aa12345" | ConvertTo-SecureString -asPlainText -Force
$username = "Administrator" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
    Rename-Computer -NewName "Delta2" -DomainCredential $credential -Restart # rename server

}




main 
