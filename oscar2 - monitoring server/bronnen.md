# PRTG

### Router toevoegen

(met SNMP) op router: snmp-server community 'xxx' ro

PRTG: device toevoegen > SNMP Credentials: xxx

Eventuele sensors: ICMP / TCP / POORTEN (FaEth) / UDP / SNMP

# Bronnen
### Manual
https://www.paessler.com/manuals/prtg/exe_script_advanced_sensor
### System requirements
https://www.paessler.com/manuals/prtg/detailed_system_requirements
### Hyper-V installeren en VM aanmaken
https://technet.microsoft.com/en-us/library/hh846766(v=ws.11).aspx
### Automatische installatie prtg
https://stackoverflow.com/questions/41041684/how-to-run-an-exe-file-to-install-an-application
https://social.technet.microsoft.com/Forums/en-US/13e4dbcc-91ee-4f3d-914b-b4fca00c7269/application-installation-via-powershell?forum=winserverpowershell
http://community.idera.com/powershell/ask_the_experts/f/200/t/13603
### Sharepoint sensor
https://www.paessler.com/manuals/prtg/wmi_sharepoint_process_sensor

### Sensor voor mailserver
https://www.paessler.com/manuals/prtg/available_sensor_types#mail

https://www.paessler.com/manuals/prtg/exchange_mailbox_sensor

### Sensor toevoegen aan nieuwe server
https://www.paessler.com/manuals/prtg/add_a_sensor

### Remote powershell
https://technet.microsoft.com/en-us/library/ff700227.aspx

### Info over automatisatie EXE met echoargs
https://stackoverflow.com/questions/1673967/how-to-run-an-exe-file-in-powershell-with-parameters-with-spaces-and-quotes

* & 'c:\Users\Arto\Downloads\PRTG Network Monitor 17.3.33.2830 Setup (Stable).exe' /silent

### automatisatie vagrant
https://www.howtogeek.com/112660/how-to-change-your-ip-address-using-powershell/

https://app.vagrantup.com/mwrock/boxes/Windows2012R2

### Info over automatiseren installatie PRTG
https://kb.paessler.com/en/topic/2773-what-command-line-codes-and-exit-codes-can-i-use-with-paessler-setups

# PRTG Sensor uitwerking

### DC

?

### mailserver
**!! Bij settings op PRTG ipv IP-adres meegeven de FQDN meegeven !!**

**Om op target server remote powershell te controleren, gebruik "get-service winrm" & "enable-psremoting -force" in powershell**

Sensor: Totale grote van items, aantal items en tijd sinds laatste logon.

URL: https://www.paessler.com/manuals/prtg/exchange_mailbox_sensor

Benodigdheden:
- minstens Exchange 2010, Remote PowerShell en Remote Exchange Management Shell op target servers.
- **Powershell 2.0 op probe systeem.**
- FQDN van target server in parent device settings;
- Heeft "elevated rechten" voor de gebruiker van de sensor op exchange systeem nodig. Niet enkel admin rechten.
- **.NET 4.0 of hoger op probe system**

### NIET MEER TE DOEN - DHCP

Sensor: Address of server + offered IP, response time, lease time

URL: https://www.paessler.com/manuals/prtg/dhcp_sensor

Benodigdheden: / (host moet statisch ip hebben en probe device zijn)

### Fileserver

Sensor: Folder size, Number of files, Tijd sinds laatste en eerste verandering

URL: https://www.paessler.com/manuals/prtg/folder_sensor

Benodigdheden: LANMANSERVICE moet aanstaan op target server (start type: automatic)

### Monitoring

?

### MSCS

?

### Webserver (IIS)

Sensor: verzonden en ontvangen bytes (p/s), verzonden en ontvangen files (p/s), aantal anonieme gebruikers en gekende, aantal CGI request (p/s), aantal GET en POST request (p/s), aantal not found errors (p/s)

URL:  https://www.paessler.com/manuals/prtg/wmi_iis_application_sensor

Benodigdheden: / (credentials van windows systeem nodig)

### Sharepoint

Sensor: nummer van huidige requests, actieve threads en huidige uitgevoerde SQL queries. Globale heap size (RAM?), live grote van Object cache.

URL: https://www.paessler.com/manuals/prtg/wmi_sharepoint_process_sensor

Benodigdheden:/ (credentials van windows systeem nodig)

### MS-SQL

Sensor: executie tijd van volledige request, tijd van query, aantal rijen die aangepast zijn.

URL: https://www.paessler.com/manuals/prtg/microsoft_sql_v2_sensor

URL: https://www.paessler.com/manuals/prtg/wmi_microsoft_sql_server_2014_sensor

Benodigdheden:
- **.NET 4.0 op probe, credentials, poort en timeout van parent device.**
( https://www.paessler.com/manuals/prtg/device_settings#dbcredentials)
- **Microsoft .NET Framework moet geinstalleerd zijn op PRTG probe.**
