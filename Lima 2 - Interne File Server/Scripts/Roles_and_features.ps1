#Script roles and features file server Lima2

Install-WindowsFeature FileAndStorage-Services
Install-WindowsFeature –Name FS-Resource-Manager –IncludeManagementTools
Install-WindowsFeature FS-DFS-Namespace, FS-DFS-Replication, RSAT-DFS-Mgmt-Con 