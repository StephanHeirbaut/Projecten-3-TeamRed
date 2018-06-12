# The top-level folder in the installation folder tree
New-Item c:\SharePointInstall -type directory
$RootFolder = "C:\SharePointInstall"

# The folder for prerequisites used by the Prerequisite Installer
New-Item $RootFolder\SharePoint_Prerequisites\PrerequisiteInstaller -type directory
$Prereqs2Folder = "$RootFolder\SharePoint_Prerequisites\PrerequisiteInstaller"

# END CONFIGURATION BLOCK
# -----------------------

# ----------------------------------------------------------------
# Download details
# Do not change unless Microsoft changes the downloads themselves
# ----------------------------------------------------------------

# Specify download url's for SharePoint 2016 prerequisites
$Downloads = @{
            # Microsoft ODBC Driver 13.1 for SQL Server http://go.microsoft.com/fwlink/?LinkId=618410
            "https://download.microsoft.com/download/D/5/E/D5EEF288-A277-45C8-855B-8E2CB7E25B96/x86/msodbcsql.msi" = "$Prereqs2Folder\msodbcsql.msi";
            # Microsoft Sync Framework Runtime v1.0 SP1 (x64) http://go.microsoft.com/fwlink/?LinkId=618411
            "https://download.microsoft.com/download/E/0/0/E0060D8F-2354-4871-9596-DC78538799CC/Synchronization.msi" = "$Prereqs2Folder\Synchronization.msi";
            # Windows Server App Fabric http://go.microsoft.com/fwlink/?LinkId=618412
            "https://download.microsoft.com/download/A/6/7/A678AB47-496B-4907-B3D4-0A2D280A13C0/WindowsServerAppFabricSetup_x64.exe" = "$Prereqs2Folder\WindowsServerAppFabricSetup_x64.exe";
            # Windows Identity Foundation (KB974405)
            "http://download.microsoft.com/download/D/7/2/D72FD747-69B6-40B7-875B-C2B40A6B2BDD/Windows6.1-KB974405-x64.msu" = "$Prereqs2Folder\Windows6.1-KB974405-x64.msu";
            # Microsoft Identity Extensions
            # http://go.microsoft.com/fwlink/?LinkID=252368
            "http://download.microsoft.com/download/0/1/D/01D06854-CA0C-46F1-ADBA-EBF86010DCC6/rtm/MicrosoftIdentityExtensions-64.msi" = "$Prereqs2Folder\MicrosoftIdentityExtensions-64.msi";
            # Microsoft Information Protection and Control Client http://go.microsoft.com/fwlink/?LinkID=544913
            # MSI version (does not satisfy Prerequisite Installer):
            #     http://go.microsoft.com/fwlink/?LinkId=320724
            #     https://download.microsoft.com/download/9/1/D/91DA8796-BE1D-46AF-8489-663AB7811517/setup_msipc_x64.msi
            "http://download.microsoft.com/download/3/C/F/3CF781F5-7D29-4035-9265-C34FF2369FA2/setup_msipc_x64.exe" = "$Prereqs2Folder\setup_msipc_x64.exe";
            # Microsoft WCF Data Services 5.0 for OData V3
            "https://download.microsoft.com/download/8/F/9/8F93DBBD-896B-4760-AC81-646F61363A6D/WcfDataServices.exe" = "$Prereqs2Folder\WcfDataServices.exe";
            # Microsoft WCF Data Services 5.6 required for SharePoint 2016
            "https://download.microsoft.com/download/9/B/C/9BC5D029-12FC-4BEF-9515-67746FD9059F/WcfDataServices.exe" = "$Prereqs2Folder\WcfDataServices56.exe";
            # .NET Framework 4.7 Offline Installer https://www.microsoft.com/en-us/download/details.aspx?id=55167
            "https://download.microsoft.com/download/D/D/3/DD35CC25-6E9C-484B-A746-C5BE0C923290/NDP47-KB3186497-x86-x64-AllOS-ENU.exe" = "$Prereqs2Folder\NDP47-KB3186497-x86-x64-AllOS-ENU.exe";
            # Cumulative Update Package 7 for AppFabric 1.1 for Windows Server https://support.microsoft.com/en-us/kb/3092423
            "https://download.microsoft.com/download/F/1/0/F1093AF6-E797-4CA8-A9F6-FC50024B385C/AppFabric-KB3092423-x64-ENU.exe" = "$Prereqs2Folder\AppFabric-KB3092423-x64-ENU.exe";
            # Visual C++ Redistributable for Visual Studio 2012 Update 4 http://go.microsoft.com/fwlink/?LinkId=327788
            "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" = "$Prereqs2Folder\vcredist_x64.exe";
            # Visual C++ Redistributable for Visual Studio 2015 http://go.microsoft.com/fwlink/?LinkId=623013
            "http://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe" = "$Prereqs2Folder\vc_redist.x64.exe"
            # Silverlight http://go.microsoft.com/fwlink/p/?LinkId=166506
            "http://silverlight.dlservice.microsoft.com/download/F/8/C/F8C0EACB-92D0-4722-9B18-965DD2A681E9/30514.00/Silverlight_x64.exe" = "$Prereqs3Folder\Silverlight_x64.exe";
            # Exchange Web Services Managed API, version 1.2 http://go.microsoft.com/fwlink/p/?linkid=238668
            "https://download.microsoft.com/download/7/6/1/7614E07E-BDB8-45DD-B598-952979E4DA29/EwsManagedApi.msi" = "$Prereqs3Folder\EwsManagedApi.msi";
            # Windows Server 2016 Update https://support.microsoft.com/en-us/help/4041688
            "http://download.windowsupdate.com/c/msdownload/update/software/updt/2017/10/windows10.0-kb4041688-x64_a098c258a1d8f6b4bbfff87ee5ab687d629d3bd9.msu" = "$Prereqs1Folder\windows10.0-kb4041688-x64_a098c258a1d8f6b4bbfff87ee5ab687d629d3bd9.msu.exe";
            }

# Import Required Modules: BITS is used for file transfer
Import-Module BitsTransfer

function DownloadFiles()
{

    Write-Host ""
    Write-Host "====================================================================="
    Write-Host "             Downloading SharePoint 2016 Prerequisites"
    Write-Host "====================================================================="

    $ReturnCode = 0

    $Downloads.GetEnumerator() | ForEach {
        $DownloadURL = $_.get_key()
        $Filespec = $_.get_value()
        # Get the file name based on the portion of the file path after the last slash
        $FilePath = Split-Path $Filespec
        $FileName = Split-Path $Filespec -Leaf
        Write-Host "DOWNLOADING: $FileName"
        Write-Host "       FROM: $DownloadURL"
        Write-Host "         TO: $FilePath"

        Try
        {
            # Check if file already exists
            If (!(Test-Path "$Filespec"))
            {
                # Begin download
                Start-BitsTransfer -Source $DownloadURL -Destination "$Filespec" -DisplayName "Downloading `'$FileName`' to $FilePath" -Priority High -Description "From $DownloadURL..." -ErrorVariable err
                If ($err) {Throw ""}
                Write-Host "     STATUS: Downloaded"
                Write-Host
            }
            Else
            {
                Write-Host "     STATUS: Already exists. Skipping."
                Write-Host
            }
        }
        Catch
        {
            $ReturnCode = -1
            Write-Warning " AN ERROR OCCURRED DOWNLOADING `'$FileName`'"
            Write-Error   $_
            Break
        }

    }
    return $ReturnCode
}

$rc = DownloadFiles

if($rc -ne -1)
{
    Write-Host ""
    Write-Host "DOWNLOADS ARE COMPLETE."
}
