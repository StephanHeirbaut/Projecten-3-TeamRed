# Automatisatie

## Stap 1: _Verify Hyper-V installation_
  - Run the command:
  		Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V

## Customization
  1. Install the manual for the cmdlets with the command
  		_Update-Help_
  2. 

## Cheat sheet
### Basic Commands
| *Description* | *Command* |
| Manual Page | Get-Help [Command] <br/> OR <br/> man |
| list cmdlets | Get-Command [Service] |
| Show objects of service | [Service] &#124; Get-Member |
| Undo the previous action | Undo |
| Performs the action that was just undone | Redo |
| 
### Customization Commands
| *Description* | *Command* |
| Install help files for Windows Powershell | Update-Help |
| Enable scripts | Set-ExecutionPolicy[PSITPro5_Security] |
| Enable receiving remote commands | Enable-PSRemoting |
### VM manipulation
| *Description* | *Command* |
| Create a new VM | New-VM |

## Bronnen
  1. [Windows Powershell Reference](https://msdn.microsoft.com/en-us/library/ms714469(v=vs.85).aspx)
  2. [Writing a Windows Powershell Module](https://msdn.microsoft.com/en-us/library/dd878310(v=vs.85).aspx)
  3. 