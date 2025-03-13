#!/bin/bash

# Vérifier si les outils nécessaires sont installés
check_tools() {
    tools=("nmap" "nikto" "gobuster" "hydra" "masscan" "wpscan" "sqlmap")
    for tool in "${tools[@]}"; do
        if ! command -v $tool &> /dev/null; then
            echo "❌ Outil manquant : $tool. Installe-le avec : sudo apt install $tool"
        fi
    done
}

check_tools

# Demander à l'utilisateur de renseigner la cible
echo "Donne l'IP ou le nom de domaine cible :"
read cible

# Vérifier si la cible est vide
if [ -z "$cible" ]; then
    echo "❌ Pas de cible."
    exit 1
fi

echo "🚀 Démarrage de la reconnaissance active sur $cible"

# Création d'un dossier pour stocker les résultats
mkdir -p active_$cible
cd active_$cible || exit

#---------------------
# Nmap Scan (Scan avancé des ports)
#---------------------
echo "🔍 1. Scan avancé avec Nmap (Détection des services, OS et scripts)"
nmap -sC -sV -O -A -p- --min-rate=500 --open -T4 -oN nmap_advanced_scan.txt $cible
echo "✅ Scan avancé Nmap terminé. Résultats dans nmap_advanced_scan.txt"

#---------------------
# Nmap Scan UDP
#---------------------
echo "🔍 2. Scan UDP avec Nmap"
nmap -sU --top-ports 50 --min-rate=500 -T4 -oN nmap_udp_scan.txt $cible
echo "✅ Scan UDP Nmap terminé."

#---------------------
# Nmap Vulnérabilités (NSE Scripts)
#---------------------
echo "🔍 3. Scan des vulnérabilités avec Nmap"
nmap --script=vuln -p- -T4 -oN nmap_vuln_scan.txt $cible
echo "✅ Scan des vulnérabilités terminé."

#---------------------
# Masscan (Scan des ports ultra-rapide)
#---------------------
echo "🔍 4. Scan rapide de ports avec Masscan"
masscan $cible -p1-65535 --rate=10000 -oG masscan_results.txt
echo "✅ Scan Masscan terminé."

#---------------------
# Nikto Scan (Scan des vulnérabilités web)
#---------------------
echo "🔍 5. Nikto Scan (Vulnérabilités web)"
nikto -h $cible -o nikto_results.txt
echo "✅ Scan Nikto terminé."

#---------------------
# Gobuster (Scan des répertoires cachés avancé)
#---------------------
echo "🔍 6. Gobuster (Scan avancé des répertoires)"
gobuster dir -u http://$cible -w /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt -t 50 -x php,html,txt,asp -o gobuster_results.txt
echo "✅ Gobuster terminé."

#---------------------
# Gobuster (Scan des sous-domaines)
#---------------------
echo "🔍 7. Gobuster (Scan des sous-domaines)"
gobuster dns -d $cible -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -t 50 -o gobuster_subdomains.txt
echo "✅ Gobuster sous-domaines terminé."

#---------------------
# WPScan (Scan des sites WordPress)
#---------------------
echo "🔍 8. WPScan (Scan WordPress)"
wpscan --url https://$cible --enumerate p,u,t --no-banner --random-user-agent --disable-tls-checks -o wpscan_results.txt
echo "✅ Scan WPScan terminé."

#---------------------
# Hydra (Attaque par brute force)
#---------------------
echo "🔍 9. Hydra (Attaque brute-force sur SSH)"
hydra -L /usr/share/wordlists/usernames.txt -P /usr/share/wordlists/rockyou.txt ssh://$cible -o hydra_ssh_results.txt
echo "✅ Attaque Hydra (SSH) terminée."

#---------------------
# SQLmap (Scan des vulnérabilités SQLi)
#---------------------
echo "🔍 10. SQLmap (Test des injections SQL)"
sqlmap -u "http://$cible/vuln_page?id=1" --dbs --batch --output-dir=sqlmap_results
echo "✅ Scan SQLmap terminé."

# Résumé final
echo "🎯 Scan actif terminé ! Les résultats sont enregistrés dans active_$cible"

