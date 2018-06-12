# Testrapport (Netwerk-red-local)

* Verantwoordelijke uitvoering testrapport: Pieter

## Testen

## Overeenkomst Packet-tracer met brochure:

Opstelling brochure:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/red%20local%20brochure.PNG)

Opstelling Packet-tracer:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/red%20local%20packet%20tracer.PNG)

- Opstellingen komen overeen

## Nagaan fouten PDF VLSM

Subnet-table VLSM red-local:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/vlsm%20table.PNG)

- Overeenkomst met Packet-tracer / geen fouten teruggevonden / toewijzingen in orde


## Nagaan servers Packet-tracer 

VLAN 500 : Gateway 172.18.2.65

- Alfa2: 

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/alfa2.PNG)

- Bravo2: 

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/bravo.PNG)

- Charlie2: 

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/charlie.PNG)

- Delta2: 

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/delta2.PNG)

VLAN 300: Gateway 172.18.2.1

- Kilo2: 

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/kilo.PNG)

- Lima2:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/lima.PNG)

- Mike2:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/mike.PNG)

- November2:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/november.PNG)

- Oscar2:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/oscar.PNG)

- Papa2:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/papa.PNG)

## Packet-tracer tabel 


| Apparaten 	| Poorten            | IP-adres 		| Subnetmask 		| 
| :---      	|    ---:            |     ---: 		|       ---: 		|            
| Router1   	| Gig0/1  	         | 172.18.2.113     | 255.255.255.240   |				 
| Firewall      | Fa0                | 172.18.2.114     | 255.255.255.240   |				
|				| Fa1                | 172.18.2.98      | 255.255.255.240   |				  
| RouterSwitch6 | G0/0.400           | 172.18.2.33      | 255.255.255.224   |				  
| 				| G0/0.500           | 172.18.2.65      | 255.255.255.224   |				  
| 				| G0/0.600           | 172.18.2.97      | 255.255.255.240   |				  
| RouterSwitch5 | G0/0.400           | 172.18.2.34      | 255.255.255.224   |				  
| 				| G0/0.300           | 172.18.2.1       | 255.255.255.224   |				  
| 				| G0/0.200           | 172.18.0.1       | 255.255.254.0     |				  
| Switch6       | Fa0/1              | 172.18.2.110     | 255.255.255.240   |				  	
| 				| Fa0/20 , Fa0/21    | 172.18.2.94      | 255.255.255.224   |					  
| Switch5       | Fa0/22 , Fa0/23    | 172.18.2.62      | 255.255.255.240   |				  
| 				| Fa0/20 , Fa0/21    | 172.18.1.254     | 255.255.254.0     |	
| Switch7       | Fa0/20 , Fa0/21    | 172.18.2.66      | 255.255.255.224   |	
| Switch4       | Fa0/20 , Fa0/21    | 172.18.0.2       | 255.255.254.0     |					  
| PC5           | Fa0                | 169.254.18 .35   | 255.255.0.0       |
| PC6           | Fa0                | 169.254.26.155   | 255.255.0.0       |
| PC7           | Fa0                | 169.254.217.90   | 255.255.0.0       |
| PC8           | Fa0                | 169.254.69.228   | 255.255.0.0       |
| PC9           | Fa0                | 169.254.110.35   | 255.255.0.0       |

