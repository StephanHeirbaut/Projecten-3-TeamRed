# Een eerste opstelling via virbox
## Opstelling virtual box omgeving
* 2x windows server 2012 R2 + gui
* username = administrator
* wachtwoord = banaan666

## Verder opzetten windows server 1

### In vm verder aanpassen:
* extra NIC -> intern netwerk

### In winser zelf verder aanpassen:
* 'ethernet' hernoemen naar 'internet'
* 'ethernet 2' hernoemen naar 'local'
* internet settings ipv6 uitzetten
* ipv4 adres instellen op '192.168.0.1' (local)

| **surfen werkt normaal nu** |
| --- |
* javascript enabled in internet explorer
* prtg downloaden via peassler.com (toevoegen aan trusted websites) en downloaden en installeren
* aanpassen computername naar 'PRTG-Server'
* werkgroepnaam aanpassen naar 'PRTGWERKGROEP'

### Installatie prtg
* username = prtgadmin
* wachtwoord = banaan666

## Verder opzetten windows server 2

### In winser zelf verder aanpassan:
* aanpassen computernaam naar 'PRTG-Client'
* aanpassen werkgroep naar 'PRTGWERKGROEP'
* ethernet hernoemen naar 'local'
* ipv6 uizetten
* ipv4 adres instellen op '192.168.0.2'
