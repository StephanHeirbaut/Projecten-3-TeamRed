# User manual

### System Requirements

- As a host-machine, make sure you are using a Windows 10 PRO edition.
- 1GB RAM
- 200GB Storage Space
- Enough coffee to survive install times.

### Getting Ready

- Copy the scripts from your usb-stick to the virtual machine
  - After the installation completed and you're logged in, restart the server. (Else you won't be able to copy scripts within the VM)

### Run Scripts

#### On Host system
- Make sure HyperV is enabled on your host-machine by running the HyperV_enable.ps1
- Run lima2_deployment_script.ps1

#### On Lima2
- Open a powershell
- Run Partitioning.ps1
- Configure the IP-settings
  - ip: 172.18.2.3
  - sm: 255.255.255.224
  - dg: 172.18.2.1
  - dns1: 172.18.2.67
  - dns2: 172.18.2.68
- Run DomainJoin.ps1
  - If there's an error about trust issues, leave and rejoin the domain!
- Log-in with administrator@red.local
  - The scripts won't be saved on the domain account, so you need yo copy them again.
- Run Roles_and_features.ps1
- Run SharesQuotasAndShadowCopy.ps1
- Run Create_share_folders.ps1
