echo "--------------------------------------------------------------"

#Check if Active Directory is installed ###########################################################
echo "[$(Get-Date -format 'hh:mm:ss')] Checking AD DS Installation:"

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