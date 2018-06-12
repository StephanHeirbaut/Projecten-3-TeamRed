# Troubleshooting connectiviteit
## IP-configuratie

**Probleem + oplossing:**
- PC2: Default gateway moet `172.16.129.13` zijn ipv `172.16.129.1`
- PC3: Default gateway moet `172.18.0.1` zijn ipv `0.0.0.0`

## Routering

- Na het corrigeren van de IP-instellingen werd de ping doorgelaten naar `172.16.129.14` maar het kwam vast te zitten tussen R3 en R4. R3 had geen  statische route naar het `172.18.0.0/24`-netwerk en dus nam het de default route `ip route 0.0.0.0 0.0.0.0 192.168.0.1`, hierdoor zat er dus een loop tussen R3 en R4 (R4 routeerde wel juist).

**Oplossing:** we voegen volgend commando toe bij R3: `ip route 172.18.0.0 255.255.255.0 192.168.4.2`

