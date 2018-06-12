#Automatisation script configuration DFS, shareVerkoop

#STILL IN PROGRESS!#

#Make folder
$folders = 'C:\dfsroots\files','D:\testShare' 
mkdir -path $folders
#Make share
New-SMBShare -Name testShare -Path "D:\testShare" -ReadAccess "Ontwikkeling" -ChangeAccess "Verkoop" -FullAccess "IT Administratie"}
#DFNSroot
New-DfsnRoot -Path \\red.local\testShare -TargetPath \\lima2\testShare -Type DomainV2

#Add folder target to namespace
$DfsPath = \\red.local\files\testShare 
$targetPath = \\lima2\testShare
New-DfsnFolderTarget -Path $DfsPath -TargetPath $targetPath



