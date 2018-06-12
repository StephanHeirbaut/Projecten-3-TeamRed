## User manual autounattend.xml

### Benodigdheden

- [Windows ADK](https://go.microsoft.com/fwlink/p/?LinkId=393005)
- Windows System Image Manager (Bij ADK installatie "Deployment tools" en "Windows PE" selecteren)
- Programma om ISO files te maken bv. [imgburn](http://www.imgburn.com).
- ISO file van windows server

### Voorbereidend werk
- ISO uitpakken
- in de map sources van de iso het bestand install.wim lokaal kopiëren.

### Autounattend.xml
- in windows system image manager: copied install.wim openen, SERVERDATACENTER selecteren, catalog files worden aangemaakt...
- ga naar components and packages, components en rightclick op 'amd64_microsoft-windows-internal-core-winPE_10.0.14393.0_neutral' en click add setting to pass 1.

- in de answer file panel onder components, 1 windowsPE, amd64..., dan kan je rechts de waarden invullen. bij inputlocale en userlocale 'nl-be' bij systemlocale en UILanguage 'en-US'.
- amd64... openklappen, bij setupUILanguage - UILanguage 'en-US' invullen.

- onder windows image pane component amd64_Microsoft-Windows-setup_xxx_neutral, add setting to pass 1.
- onder amd64_Microsoft-Windows-Setup_neutral in answer file pane diskconfiguration rightclick en insert new disk.
- DiskID = 1, willWipe = True
- createPartition: order = 1, size = 32Gb, type = primary. Nog een partitie order = 2, size 50 type primary, idem voor 3de maar dan order 3.
- nieuwe Disk met DiskID = 2, zelfde procedure als vorige maar dan 5 partities.
- new modifyPartition active = true, extend = false, format = NTFS, label System, letter C, order 1 partitionID 1
- new modifyPartition voor resterende partitites. Zelfde procedure, enkel acvtive = false, label en letters aanpassen.

- In answerFilePane: ImageInstal, osImage, installToAvailablePartition = false, willShowUI = Allways (kan je kiezen)
- klap osimage open, installTo = beide op 1(overeenkomende disk en partitie)
- installFrom: rightclick, insertMetaData. key = /IMAGE/NAME, value = Windows Server 2016 SERVERDATACENTER

- terug in answerFilePane, userData: acceptEula = true, Fullname = Lima2, Org = Team Red.
- onder userData: productKey willSHowUi = always.

- Nieuw component: amd64_Microsoft-Windows-Shell-Setup_XXX_neutral: add setting to pass 4 specialize.
- ComputerName = Lima 2, key invullen, Timezone=Romance Standard Time, registeredOrganization = '-'.

- in answerFilePane: windows shell setup openklappen
- terug zelfde component rightclick en Add setting to pass 7 oobeSystem
- registeredOrganization en owner = '-'
- autoLogon: enabled = true, LogonCount = 2, username = Administrator (domain local.red maar nu nog niet ingevuld voor test)
- Passwoord onder autologon invullen (Admin123 nu als test)
- Onder UserAccounts: Zelfde adminpasswoord invullen.

!!VALIDATE ANSWER FILE!! Het is normaal dat er validation messages komen, echter mogen er geen errors zijn!! 
- Save answer file in root van ISO als "autounattend.xml"
- Kopiëer de lokale install.wim in de sources folder van de uitgepakte ISO. (vervangen)
- Gebruik tool (imgburn) om weer een iso bestand te maken
