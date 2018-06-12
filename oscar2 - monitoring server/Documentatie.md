# Documentatie

## Hyper-V

### VM aanmaken

1. In Hyper-V Manager, in het rechtse paneel 'Actions' > New > Virtual Machine...

2. In de wizard klik op next. Kies een gepaste naam (hier: MonitoringServer).
Klik op next.

3. Kies voor generatie 2. Klik op next.

4. Vul een startup memory in (hier: 4096 MB. Laat 'Use Dynamic Memory' aangevinkt. Klik op next.

5. In Configure networking, klik op next.

6. Voor de virtuele hard drive, laat alles op default staan. (dynamisch gealloceerd). Klik op next.

7. Selecteer 'Install an operating system from a bootable image file'. Selecteer een gepaste ISO file (Windows 2012 R2). Klik op next.

8. Om te finaliseren controleer settings, klik op finish.

### VM configureren

3. In het rechtse paneel in Hyper-V manager open de Virtual Switch Manager.

4. Selecteer External en klik op 'Create Virtual Switch'.

5. Geef een naam voor je switch (NAT) op en selecteer Extern netwerk.
Kies een goede Adapter (hier: VirtualBox Host-Only Ethernet Adapter) Klik op Apply en druk op Ok.

1. In de Hyper-V manager, ga naar de settings van je VM en selecteer NAT als virtuele swtich. Vink 'Enable Virtual LAN identification' aan en vul **300** in.
Klik op Apply.

2. Ga da naar Integration Services, vink Guest Services aan. Klik op Apply.

8. Op je host ga naar de Wi-Fi adapter. Ga naar de properties, tabblad sharing. Klik op 'Allow other network access users to connect'. Zet de Home Networking connection op vEthernet (NAT).
Noteer het IP-adres dat in het venster verschijnt.

9. Ga naar de properties van vEthernet (NAT) adapter. Ga naar properties van IPv4 en vul bij Use the following DNS server: **172.18.2.67** Klik op Ok.

10. In de Hyper-V manager, rechtsklik op je VM en klik op start.

11. In de Windows Setup, kies Time and currency format: Dutch (Belgium) en Keyboard setting: Belgian (Period).

12. Klik op Install now.

13. Geef een geldige product key mee. Klik op next.

14. Kies de GUI installatie. Klik op next. Accepteer de license terms. Klik op next.

15. Kies voor een custom install.

16. Maak een nieuwe harde schijf aan en kies voor de primary partitie. Klik op next.

17. Na installatie wordt een nieuwe gebruiker aangemaakt. Deze noemt automatisch Administrator, gebruik als pw Admin1. Klik op Finish.

### Server configureren

1. Log in als Administrator (pw: Admin1).

2. Ga naar het Network and Sharing Center en klik op Adapter.

3. Ga naar de properties van je Ethernet en disable IPv6. In de properties van IPv4 stel IP-adres **172.18.2.6** met als subnetmask **255.255.255.224** in. Met DNS Server: **172.18.2.67**.
Default Gateway: **172.18.2.67**

4. In PowerShell run volgend commando: Install-WindowsFeature -Name web-asp-net45.

## PRTG

### Installatie PRTG

**Kan eventueel vervangen worden door installatiebestand mee te geven**

1. Ga naar de website van PRTG. https://www.paessler.com/prtg/download

2. Kies voor de Freeware Download.

3. Zorg dat Javascript aanstaat in de browser. (Internet Options > Security Settings > Scripting > Active scripting > enable )

4. Noteer de License Name (prtgtrial) en License Key en begin de download door de knop 'Download here'.

5. Unzip de gedownloade zip-file. Start de PRTG Network Monitor **17.3.33.2830** Setup (Stable) applicatie.

6. Kies English als taal, klik op Next.

7. Accepteer de license agreement, klik op next.

8. Vul een gepast hogent emailadres in. Klik op next.

9. Vul de voordien gegeven license name en license key in. Klik op next.

10. Na installatie start automatisch de PRTG Network monitor op **!! in google chrome !!**.


### Configureren PRTG + eventuele installaties op systeem

1. In PowerShell run volgend commando: Install-WindowsFeature -Name web-asp-net45.

2. Schakel aan op het netwerk

3. ga naar devices -> all (vanboven links)

4. ga in het tablad settings (root)

5. ga naar de credentials for windows systems

6. zet domain or computer name op 'RED' en user op 'Administrator' met ww: 'Aa12345' sla dit op.

7. Voor de domeincontroller te monitoren:

    * rechtsklik 'servers' -> add device
    * geef naam: ns1; ip: 172.18.2.67
    * we kiezen een passend icoon en klikken 'continue'
    * Nu kan je bij de toegevoegde server 'add sensor' klikken voor de volgende sensors... (of rechtklikken op de machine zelf)

    1. Voeg een ping sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'ping'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    2. Voeg een DNS sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'DNS'
        * klik op 'add this'
        * vul als domain name 'red.local' in en klik 'continue'

    3. Voeg een Folder sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi free disk space'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    4. Voeg een CPU sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'windows CPU load'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    5. Voeg een geheugen sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'WMI Memory'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

8. Voor de domeincontroller te monitoren:

    * rechtsklik 'servers' -> add device
    * geef naam: ns2; ip: 172.18.2.68
    * we kiezen een passend icoon en klikken 'continue'
    * Nu kan je bij de toegevoegde server 'add sensor' klikken voor de volgende sensors... (of rechtklikken op de machine zelf)

    1. Voeg een ping sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'ping'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    2. Voeg een DNS sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'DNS'
        * klik op 'add this'
        * vul als domain name 'red.local' in en klik 'continue'

    3. Voeg een Folder sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi free disk space'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    4. Voeg een CPU sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'windows CPU load'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    5. Voeg een geheugen sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'WMI Memory'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

9. Voor de fileServer te monitoren:

    * rechtsklik 'servers' -> add device
    * geef naam: fileserver; ip: 172.18.2.3
    * we kiezen een passend icoon en klikken 'continue'
    * Nu kan je bij de toegevoegde server 'add sensor' klikken voor de volgende sensors... (of rechtklikken op de machine zelf)

    1. Voeg een ping sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'ping'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    2. Voeg een geheugen sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'WMI Memory'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    3. Voeg een Folder sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi free disk space'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    4. Voeg een CPU sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'windows CPU load'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

10. Voor de exchange te monitoren:

    * rechtsklik 'servers' -> add device
    * geef naam: exchangeServer; ip: 172.18.2.69
    * we kiezen een passend icoon en klikken 'continue'
    * Nu kan je bij de toegevoegde server 'add sensor' klikken voor de volgende sensors... (of rechtklikken op de machine zelf)

    1. Voeg een ping sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'ping'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    2. Voeg een geheugen sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'WMI Memory'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    3. Voeg een Folder sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi free disk space'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    4. Voeg een CPU sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'windows CPU load'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    5. Voeg een exchange sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi exchange server'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

11. Voor de DHCP server te monitoren:

    * rechtsklik 'servers' -> add device
    * geef naam: exchangeServer; ip: 172.18.2.2
    * we kiezen een passend icoon en klikken 'continue'
    * Nu kan je bij de toegevoegde server 'add sensor' klikken voor de volgende sensors... (of rechtklikken op de machine zelf)

    1. Voeg een ping sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'ping'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    2. Voeg een geheugen sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'WMI Memory'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    3. Voeg een Folder sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi free disk space'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    4. Voeg een CPU sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi CPU'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

12. Voor de sqlserver te monitoren:

    * rechtsklik 'servers' -> add device
    * geef naam: SQLServer; ip: 172.18.2.5
    * we kiezen een passend icoon en klikken 'continue'
    * Nu kan je bij de toegevoegde server 'add sensor' klikken voor de volgende sensors... (of rechtklikken op de machine zelf)

    1. Voeg een ping sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'ping'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    2. Voeg een geheugen sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'WMI Memory'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    3. Voeg een Folder sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi free disk space'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    4. Voeg een CPU sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi CPU'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    5. Voeg een sql sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi Microsoft sql server 2016'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

13. Voor de sccm server te monitoren:

    * rechtsklik 'servers' -> add device
    * geef naam: SCCMServer; ip: 172.18.2.7
    * we kiezen een passend icoon en klikken 'continue'
    * Nu kan je bij de toegevoegde server 'add sensor' klikken voor de volgende sensors... (of rechtklikken op de machine zelf)

    1. Voeg een ping sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'ping'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    2. Voeg een geheugen sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'WMI Memory'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    3. Voeg een Folder sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi free disk space'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    4. Voeg een CPU sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi CPU'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

14. Voor de sharepoint te monitoren:

    * rechtsklik 'servers' -> add device
    * geef naam: sharepoint; ip: 172.18.2.4
    * we kiezen een passend icoon en klikken 'continue'
    * Nu kan je bij de toegevoegde server 'add sensor' klikken voor de volgende sensors... (of rechtklikken op de machine zelf)

    1. Voeg een ping sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'ping'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    2. Voeg een geheugen sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'WMI Memory'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    3. Voeg een Folder sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi free disk space'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    4. Voeg een CPU sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi CPU'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    5. Voeg een sharepoint sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi sharepoint process'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

15. Voor de webserver te monitoren:

    * rechtsklik 'servers' -> add device
    * geef naam: webServer; ip: 172.18.2.70
    * we kiezen een passend icoon en klikken 'continue'
    * Nu kan je bij de toegevoegde server 'add sensor' klikken voor de volgende sensors... (of rechtklikken op de machine zelf)

    1. Voeg een ping sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'ping'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    2. Voeg een geheugen sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'WMI Memory'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    3. Voeg een Folder sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi free disk space'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    4. Voeg een CPU sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi CPU'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    5. Voeg een webserver sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'windows IIS Application sensor'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

16. Voor de hosts te monitoren:

    * rechtsklik 'clients' -> add device
    * geef gepaste naam van client
    * we kiezen een passend icoon en klikken 'continue'
    * Nu kan je bij de toegevoegde server 'add sensor' klikken voor de volgende sensors... (of rechtklikken op de machine zelf)

    1. Voeg een ping sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'ping'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    2. Voeg een geheugen sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'WMI Memory'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    3. Voeg een Folder sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi free disk space'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

    4. Voeg een CPU sensor toe

        * klik 'add sensor'
        * zoek de sensor met naam 'wmi CPU'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'

17. Op de Probe Device (voor de DHCP te monitoren)

    1. Voeg een DHCP sensor toe

        * rechtsklik op 'Probe Device'
        * klik 'add sensor'
        * zoek de sensor met de naam 'DHCP'
        * klik op 'add this'
        * laat de default settings staan en klik 'continue'
