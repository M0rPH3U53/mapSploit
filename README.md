# <img width="1364" height="2048" alt="merlin" src="https://github.com/user-attachments/assets/db55c98a-d786-4299-bd5d-164a024beb7c" />







Automatisation de la decouverte des appareil SNMP

| Outils | URLs |
| --- | --- |
| <span style="color: #dddddd;">👁️</span> Nmap | https://nmap.org |
| <span style="color: #dddddd;">🛡️</span> Metasploit | https://www.metasploit.com |

## 🚀 Installation

```
┌─[m0rph3u5@parrot]─[~]  
└──╼ $sudo apt install nmap metasploit-framework fonts-noto-color-emoji
```
## 👁️ Demo

```
┌─[m0rph3u5@parrot]─[~/Desktop]
└──╼ $sudo ./mapSploit.sh
  
eee......eee..eeeeee..eeeeeee...eeeeee.eeeeeee..eee.....eeeeee..eee.eeeeeeeee.
@@@@::::@@@@:@@@@@@@@:@@@@@@@@:@@@@@@@:@@@@@@@@:@@@::::@@@@@@@@:@@@:@@@@@@@@@:
%%%%%--%%%%%-%%%--%%%-%%%--%%%-%%%-----%%%--%%%-%%%----%%%--%%%-%%%----%%%----
&&&&&&&&&&&&+&&&&&&&&+&&&&&&&&+&&&&&&++&&&&&&&&+&&&++++&&&++&&&+&&&++++&&&++++
|||*||||*|||*||||||||*|||||||***||||||*|||||||**|||****|||**|||*|||****|||****
!!!==!!==!!!=!!!==!!!=!!!==========!!!=!!!======!!!====!!!==!!!=!!!====!!!====
:::######:::#:::##:::#:::######:::::::#:::######::::::#::::::::#:::####:::####
...@@@@@@...@...@@...@...@@@@@@......@@...@@@@@@......@@......@@...@@@@...@@@@
                                                                                                                  

by M0rPH3U53
      
[+] Réseau 
 
10.0.3.0/24
192.168.56.0/24
 
[i] Network: 192.168.56.0/24

🔍 Scan SNMP...100%
 
[+] Hotes
 
🛰️ 192.168.56.1 --> 192.168.56.1-snmp.txt
🛰️ 192.168.56.254 --> 192.168.56.254-snmp.txt
 
[+] Sauvegardé --> /home/m0rph3u5/Desktop/mapSploit
```
## ℹ️ Info recupéré
```
┌─[m0rph3u5@parrot]─[~/Desktop/mapSploit]
└──╼ $cat 192.168.56.254-snmp.txt
[+] 192.168.56.254, Connected.

[*] System information:

Host IP                       : 192.168.56.254
Hostname                      : BRWACF23CF77BE1
Description                   : Brother NC-9200w, Firmware Ver.1.46  ,MID 8CE-95BFID 2
Contact                       : -
Location                      : -
Uptime snmp                   : 1 day, 00:17:24.44
Uptime system                 : 5 days, 06:15:40.40
System date                   : 2026-6-10 17:13:20.0

[*] Network information:

IP forwarding enabled         : no
Default TTL                   : 64
TCP segments received         : 117603
TCP segments sent             : 62641
TCP segments retrans          : 198
Input datagrams               : 378859
Delivered datagrams           : 378787
Output datagrams              : 158485

[*] Network interfaces:

Interface                     : [ up ] NC-9200w
Id                            : 1
Mac Address                   : ac:f2:3c:f7:7b:e1
Type                          : iso88023-csmacd
Speed                         : 72 Mbps
MTU                           : 1500
In octets                     : 117414714
Out octets                    : 23997067

Interface                     : [ down ] NC-9700h
Id                            : 2
Mac Address                   : 94:dd:f8:7e:38:6d
Type                          : iso88023-csmacd
Speed                         : 100 Mbps
MTU                           : 1500
In octets                     : 45057
Out octets                    : 67017

Interface                     : [ down ] NC-9200w
Id                            : 3
Mac Address                   : ae:f2:3c:f7:fb:e1
Type                          : iso88023-csmacd
Speed                         : 72 Mbps
MTU                           : 1500
In octets                     : 0
Out octets                    : 0

Interface                     : [ up ] SoftwareLoopBack
Id                            : 4
Mac Address                   : :::::
Type                          : softwareLoopback
Speed                         : 0 Mbps
MTU                           : 1500
In octets                     : 3783954
Out octets                    : 3783954


[*] Network IP:

Id                  IP Address          Netmask             Broadcast           
2                   192.168.56.254      255.255.255.0       1                   

[*] TCP connections and listening ports:

Local address       Local port          Remote address      Remote port         State               
0.0.0.0             80                  0.0.0.0             0                   listen              
0.0.0.0             443                 0.0.0.0             0                   listen              
0.0.0.0             515                 0.0.0.0             0                   listen              
0.0.0.0             631                 0.0.0.0             0                   listen              
0.0.0.0             9100                0.0.0.0             0                   listen              
0.0.0.0             54921               0.0.0.0             0                   listen              
192.168.56.254      41401               44.228.121.117      443                 established         
192.168.56.254      60296               44.232.210.132      443                 established         

[*] Listening UDP ports:

Local address       Local port          
0.0.0.0             137                 
0.0.0.0             3702                
0.0.0.0             5353                
0.0.0.0             38045               
0.0.0.0             48229               
0.0.0.0             55743               
127.0.0.1           1011                
127.0.0.1           1012                
127.0.0.1           32819               
127.0.0.1           32871               
127.0.0.1           32974               
127.0.0.1           36067               
127.0.0.1           38688               
127.0.0.1           39366               
127.0.0.1           40032               
127.0.0.1           42222               
127.0.0.1           45964               
127.0.0.1           52112               
127.0.0.1           52141               
127.0.0.1           52784               
127.0.0.1           59160               

[*] Storage information:

Description                   : ["Random Access Memory"]
Device id                     : [#<SNMP::Integer:0x00000078faa96258 @value=1>]
Filesystem type               : ["Ram"]
Device unit                   : [#<SNMP::Integer:0x00000078faa94520 @value=1>]
Memory size                   : 512.00 MB
Memory used                   : 295.34 KB


[*] Device information:

Id                  Type                Status              Descr               
1                   Printer             running             Brother MFC-L3760CDW series


[*] Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
