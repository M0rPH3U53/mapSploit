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

# Cree le dossier pour fichiers SNMP
mkdir -p mapSploit

# Recupere adresse réseau + CIDR
IP=$(ip route show | grep -E '^[0-9]' | awk '{print $1}')

echo " "
echo -e "${VERT}[+]${RESET} ${BLANC}Réseau disponible${RESET} "
echo " "
echo "${IP}"
echo " "

# Interface réseau
echo -ne "${BLEU}[i]${RESET} ${BLANC}Network:${RESET} "
read CIDR

# Découverte réseau d'appareil SNMP
echo " "
echo -ne "🔍 ${BLANC}Scan SNMP${RESET}..."
hotes=$(nmap -sU -p 161 --open ${CIDR} -oG - | grep "161/" | awk '{print $2}')
echo -e "${JAUNE}100%${RESET}"

# Verifie si la variable est vide
if [ -z "${hotes}" ]; then
    echo "❌ Aucun appareil SNMP"
    exit 1
fi

# Chemin du fichier
dir=$(pwd)

echo " "
echo -e "${VERT}[+]${RESET} ${BLANC}Hotes${RESET}"
echo " "

# Recupere les info de l'appareil
for hote in ${hotes}; do
   	echo "📡 ${hote} --> ${hote}-snmp.txt"
   	msfconsole -q -x "use auxiliary/scanner/snmp/snmp_enum; set RHOSTS ${hote}; set verbose true; run; exit" > "${dir}/mapSploit/${hote}-snmp.txt"
done

echo " "
echo -e "${VERT}[+]${RESET} Sauvegardé --> "${dir}"/mapSploit"
