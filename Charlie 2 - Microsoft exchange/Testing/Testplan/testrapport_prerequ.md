# Testplan

##  Installatie Prerequesites voor Exchange Server

1.
  - Welke Windows Server? (2012 R2, maar staat niet vermeld in het testplan!)
2. 
  - Pad naar testscript is vermoedelijk veranderdt;
  - testscript in het testplan gaf een foutmelding bij de lijn

  	$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

  	maar ik zag de lijst met _Available_ software;

  - Het Script ScriptOmTeTesten_JDM.ps1 werkt zonder foutmeldingen;

3.
  - Ik gebruik het script Installatiescript_JDM.ps1 voor de volgende bevindingen:
  	- Het script vroeg mij voor een restart, heb toegestemd;

4. Alles behalve RSAT was geinstalleerd;
   Heb het installatiescript nog eens gedraaid;
   Alles is installed;

Conclusie: Het script werkt;