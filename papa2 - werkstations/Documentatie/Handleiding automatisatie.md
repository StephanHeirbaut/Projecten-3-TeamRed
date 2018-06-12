# Handleiding automatisatie SCCM

Voor de opdracht van Projecten III, kregen we de opdarcht om onderandere een SCCM server op te zetten en dit zoveel mogelijk te automatiseren. Door de verschillende stappen in deze handleiding te volgen, zou dit moeten lukken.

## Installatie Windows Server 2012 R2

Door gebruik te maken van het bestand `autounattend.xml` kan je de basisinstallatie van de server automatiseren. In deze XML staan onderandere gespecifieerd welke productcode er gebruikt moet worden maar ook welke taal er ingesteld moet worden en welke gebruiker aangemaakt moet worden.

##  Installatie prerequisites & SCCM

Door het script `Install_Prereqs_andsccm.ps1` uit te voeren op de SCCM server in de map `Sources`, start je de installatie van de verschillende prereqs en uiteindelijk SCCM.
De prerequisites bestaan uit:
  - Web Server (IIS)
  - MS SQL 2014
  - ADK 10 Versie 1703
De versie van SCCM die hierna geinstalleerd wordt is 1702.
In de map Sources (waarin dit script zich ook bevindt) vind je alle offline install files die nodig zijn om dit script succesvol uit te voeren.

## Installatie WSUS

Wanneer je het script `InstalWSUS.ps1` uitvoert, zal de installatie van WSUS starten. Een powershell venster opent en in de uitvoer van dit venster staan de vereiste acties die nodig zijn tijdens deze installatie duidelijk beschreven.

## Configuratie SCCM

De configuratie van SCCM gebeurt op dezelfde wijze als bij de handmatige installatie. De uitgebreide stappen hoe je dit aanpakt vind je [hier](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/Documentatie/handleiding_handimatige_instalatie.md) onder `Configuring System Center 2012 R2 Configuration Manager` -> `Configuring Discovery and Boundaries`.
