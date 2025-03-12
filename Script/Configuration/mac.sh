#!/bin/bash

# Vérifier si l'utilisateur est root
if [ "$EUID" -ne 0 ]; then
    echo "Veuillez exécuter ce script en tant que root (sudo ./change_mac.sh)"
    exit 1
fi

# Vérifier si macchanger est installé
if ! command -v macchanger &> /dev/null; then
    echo "macchanger n'est pas installé. Installation en cours..."
    apt update && apt install macchanger -y
fi

# Demander l'interface réseau à l'utilisateur
read -p "Entrez le nom de l'interface réseau (ex: wlan0, eth0) : " interface

# Vérifier si l'interface existe
if ! ip link show "$interface" &> /dev/null; then
    echo "L'interface $interface n'existe pas. Vérifiez avec 'ip link show'."
    exit 1
fi

# Désactiver l'interface réseau
echo "[+] Désactivation de l'interface $interface..."
ip link set "$interface" down

# Changer l'adresse MAC aléatoirement
echo "[+] Modification de l'adresse MAC..."
macchanger -r "$interface"

# Réactiver l'interface réseau
echo "[+] Réactivation de l'interface $interface..."
ip link set "$interface" up

# Afficher la nouvelle adresse MAC
new_mac=$(ip link show "$interface" | grep ether | awk '{print $2}')
echo "[+] Nouvelle adresse MAC : $new_mac"

echo "[+] Changement terminé !"
