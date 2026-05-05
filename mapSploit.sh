#!/bin/bash

cat <<"EOF"
  
eee......eee..eeeeee..eeeeeee...eeeeee.eeeeeee..eee.....eeeeee..eee.eeeeeeeee.
@@@@::::@@@@:@@@@@@@@:@@@@@@@@:@@@@@@@:@@@@@@@@:@@@::::@@@@@@@@:@@@:@@@@@@@@@:
%%%%%--%%%%%-%%%--%%%-%%%--%%%-%%%-----%%%--%%%-%%%----%%%--%%%-%%%----%%%----
&&&&&&&&&&&&+&&&&&&&&+&&&&&&&&+&&&&&&++&&&&&&&&+&&&++++&&&++&&&+&&&++++&&&++++
|||*||||*|||*||||||||*|||||||***||||||*|||||||**|||****|||**|||*|||****|||****
!!!==!!==!!!=!!!==!!!=!!!==========!!!=!!!======!!!====!!!==!!!=!!!====!!!====
:::######:::#:::##:::#:::######:::::::#:::######::::::#::::::::#:::####:::####
...@@@@@@...@...@@...@...@@@@@@......@@...@@@@@@......@@......@@...@@@@...@@@@
                                                                                                                  

by M0rPH3U53
      
EOF

# Couleur ASSCI
BLEU='\033[34m'
ROUGE='\033[0;31m'
VERT='\033[0;32m'
GRIS='\033[0;90m'
RESET='\033[0m'
BLANC='\033[1;37m'
JAUNE='\033[0;33m'

# Cree le dossier pourfichiers SNMP
mkdir -p mapSploit

# Recupere adresse réseau + CIDR
#IP=$(ip route show | grep -E '^[0-9]' | head -1 | awk '{print $1}')

IP=$(ip route show | grep -E '^[0-9]' |sed -n '2p' | awk '{print $1}')

# Découverte réseau d'appareil SNMP
echo -ne "🔍 ${BLANC}Scan SNMP${RESET}..."
hotes=$(nmap -sU -p 161 --open ${IP} -oG - | grep "161/" | awk '{print $2}')
echo -e "${JAUNE}100%${RESET}"

# Verifie si la variable est vide
if [ -z "${hotes}" ]; then
    echo "❌ Aucun appareil SNMP"
    exit 1
fi

# Chemin du fichier
dir=$(pwd)

echo " "
# Recupere les info de l'appareil
for hote in ${hotes}; do
   	echo "📡 ${hote}"
   	msfconsole -q -x "use auxiliary/scanner/snmp/snmp_enum; set RHOSTS ${hote}; set verbose true; run; exit" > "${dir}/mapSploit/${hote}-snmp.txt"
done

echo " "
echo -e "${VERT}[+]${RESET} Info SNMP --> "${dir}"/mapSploit"
