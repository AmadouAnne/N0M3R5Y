#!/bin/bash

# Vérifier si les outils nécessaires sont installés
check_tools() {
    tools=("whois" "spiderfoot" "nslookup" "dig" "host" "theHarvester" "sublist3r" "amass" "curl" "shodan" "waybackurls" "wget")
    for tool in "${tools[@]}"; do
        if ! command -v $tool &> /dev/null; then
            echo "❌ Outil manquant : $tool. Installe-le avec : sudo apt install $tool"
        fi
    done
}

check_tools

# Demande à l'utilisateur de renseigner la cible
echo "Donne l'IP ou le nom de domaine cible :"
read cible

# Vérifier si la cible est vide
if [ -z "$cible" ]; then
    echo "❌ Pas de cible."
    exit 1
fi

# Création du dossier de stockage des résultats
mkdir -p reconnaissance_$cible
cd reconnaissance_$cible || exit

echo "🚀 Démarrage de la reconnaissance passive et active sur $cible"

#=======================
# 🔥 RECONNAISSANCE PASSIVE
#=======================

echo "🔍 1. WHOIS Lookup"
whois $cible > whois_results.txt
echo "✅ WHOIS terminé."

echo "🔍 2. Recherche DNS (Subdomain Enumeration)"
dig $cible any > dig_results.txt
nslookup $cible > nslookup_results.txt
subfinder -d $cible -o subfinder_results.txt
amass enum -passive -d $cible > amass_results.txt
echo "✅ Recherche DNS terminée."

echo "🔍 3. Recherche de certificats (crt.sh)"
curl -s "https://crt.sh/?q=$cible&output=json" | jq . > crtsh_results.json
echo "✅ Recherche de certificats terminée."

echo "🔍 4. Recherche Shodan"
shodan host $cible > shodan_results.txt
echo "✅ Recherche Shodan terminée."

echo "🔍 5. Recherche sur Wayback Machine"
waybackurls $cible > wayback_results.txt
echo "✅ Wayback Machine terminé."

echo "🔍 6. OSINT (Emails, réseaux sociaux, fuites de données)"
theHarvester -d $cible -b all -f theHarvester_results.txt
echo "✅ OSINT terminé."
