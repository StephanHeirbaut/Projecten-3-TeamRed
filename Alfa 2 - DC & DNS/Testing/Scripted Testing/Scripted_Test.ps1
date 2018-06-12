# Adaptable Variables ###########################################################################################
$Windowsversion = "Microsoft Windows Server 2016 Standard"
$ipv4 = "172.18.0.2"
$netmask = "255.255.255.0"
$DG = "172.18.0.1"
$PrimaryDNS = "255.255.255.255"
$SecondaryDNS = "255.255.255.255"
$successcount = 0
$failedcount = 0

echo "--------------------------------------------------------------"

#Check if the correct version is installed ###########################################################
echo "[$(Get-Date -format 'hh:mm:ss')] Checking windows server version:"

    if (
    (Get-WmiObject -class Win32_OperatingSystem).Caption |
     Select-String -Pattern ${Windowsversion} -Quiet)
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][OK] Windows Version"
                $successcount +=1
            }
            Else
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][FAILED] Windows Version"
                Write-Host "[$(Get-Date -format 'hh:mm:ss')][ERROR]The installed OS is $((Get-WmiObject -class Win32_OperatingSystem).Caption)." -ForegroundColor Red
                $failedcount +=1
            }

echo "--------------------------------------------------------------"

#Checking Network Configuration ###########################################################
echo "[$(Get-Date -format 'hh:mm:ss')] Checking the Network Configuration:"
    
    echo "[$(Get-Date -format 'hh:mm:ss')]Checking the IP-Address"
    if (ipconfig | sls IPv4 | sls $ipv4 -Quiet)
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][OK] IP-address"
                $successcount +=1
            }
    Else
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][FAILED] IP-address"
                Write-Host "[$(Get-Date -format 'hh:mm:ss')][ERROR]IP-address $ip is not found." -ForegroundColor Red
                $failedcount +=1
            }
            
                
    echo "[$(Get-Date -format 'hh:mm:ss')]Checking the netmask-address:"
    if (ipconfig | sls subnet | sls $netmask -Quiet)
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][OK] Netmask-address"
                $successcount +=1
            }
    Else
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][FAILED] Netmask-address"
                Write-Host "[$(Get-Date -format 'hh:mm:ss')][ERROR]Netmask $netmask is not found." -ForegroundColor Red
                $failedcount +=1
            }
            
                
    echo "[$(Get-Date -format 'hh:mm:ss')]Checking the default gateway:"
    if (ipconfig | sls gate | sls $DG -Quiet)
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][OK] Default Gateway"
                $successcount +=1
            }
    Else
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][FAILED] Default Gateway"
                Write-Host "[$(Get-Date -format 'hh:mm:ss')][ERROR]Default Gateway $DG is not found." -ForegroundColor Red
                $failedcount +=1
            }
            
                
    echo "[$(Get-Date -format 'hh:mm:ss')]Checking the Primary DNS server:"
    if (Get-NetIPConfiguration | out-string -stream | sls -pattern $PrimaryDNS -Quiet)
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][OK] Primary DNS"
                $successcount +=1
            }
    Else
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][FAILED] Primary DNS"
                Write-Host "[$(Get-Date -format 'hh:mm:ss')][ERROR]Primary DNS $DNS is not found." -ForegroundColor Red
                $failedcount +=1
            }
            
                
    echo "[$(Get-Date -format 'hh:mm:ss')]Checking the Secondary DNS server:"
    if (Get-NetIPConfiguration | out-string -stream | sls -pattern $PrimaryDNS -Quiet)
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][OK] Secondary DNS"
                $successcount +=1
            }
    Else
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][FAILED] Secondary DNS"
                Write-Host "[$(Get-Date -format 'hh:mm:ss')][ERROR]Secondary DNS $DNS is not found." -ForegroundColor Red
                $failedcount +=1
            }

echo "--------------------------------------------------------------"

echo "--------------------------------------------------------------"
echo "SUCCESFUL = ${successcount} FAILED = ${failedcount}"