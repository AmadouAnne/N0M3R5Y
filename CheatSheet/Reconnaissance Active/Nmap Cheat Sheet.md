# Nmap Cheat Sheet

```markdown
# 📌 Cheat Sheet : Commande `Nmap`
```markdown
# 📌 Cheat Sheet : Commande `Nmap`

## 🛠 **Installation**
```bash
sudo apt update && sudo apt install nmap

```

📌 **Installe `Nmap` sur un système Linux**

---

## 🔍 **Commandes de base**

```bash
nmap example.com

```

📌 **Effectue un scan par défaut du domaine `example.com`**

```bash
nmap -p 80,443 192.168.1.1

```

📌 **Scanne uniquement les ports 80 et 443 de l'hôte `192.168.1.1`**

```bash
nmap -p- 192.168.1.1

```

📌 **Scanne tous les ports (1-65535) de l'hôte `192.168.1.1`**

```bash
nmap -sS 192.168.1.1

```

📌 **Effectue un scan SYN furtif**

```bash
nmap -sV example.com

```

📌 **Détecte les versions des services sur les ports ouverts**

---

## ⚡ **Reconnaissance avancée**

### 📡 **Détection du système d’exploitation**

```bash
nmap -O 192.168.1.1

```

📌 **Tente d’identifier le système d’exploitation**

### 🌐 **Scan de réseau complet**

```bash
nmap -sn 192.168.1.0/24

```

📌 **Effectue un scan ping pour détecter les hôtes actifs dans le réseau**

```bash
nmap -A 192.168.1.1

```

📌 **Effectue un scan agressif (OS, services, scripts, traceroute)**

### 🚀 **Scan furtif**

```bash
nmap -sN 192.168.1.1

```

📌 **Scan NULL (peut contourner certains pare-feux)**

```bash
nmap -sX 192.168.1.1

```

📌 **Scan Xmas (peut être utile contre certains systèmes)**

```bash
nmap -sF 192.168.1.1

```

📌 **Scan FIN (peut contourner certaines règles de filtrage)**

---

## 🔗 **Automatisation & Scripts Nmap Scripting Engine (NSE)**

### 📜 **Utilisation de scripts intégrés**

```bash
nmap --script=vuln 192.168.1.1

```

📌 **Recherche de vulnérabilités connues**

```bash
nmap --script=http-enum 192.168.1.1

```

📌 **Énumération des répertoires web sur l’hôte**

```bash
nmap --script=smb-os-discovery 192.168.1.1

```

📌 **Récupère des informations sur le partage SMB**

---

## 🚨 **Dépannage & Conseils**

❓ **Le scan est trop lent ?**

✔ Augmente la vitesse avec `-T4` ou `-T5`

```bash
nmap -T4 192.168.1.1

```

❓ **Besoin d’un scan discret ?**

✔ Active le mode furtif avec `-sS`
✔ Désactive l’enregistrement DNS avec `-n`

❓ **Envie d’exporter les résultats ?**

✔ Enregistre en format normal, XML ou greppable :

```bash
nmap -oN scan.txt -oX scan.xml -oG scan.gnmap 192.168.1.1

```

---

---

## 🔍 **Scans de base**

```bash
nmap -p- --open 192.168.1.1

```

📌 **Scanne tous les ports ouverts sur une cible**

```bash
nmap -sS -Pn 192.168.1.1

```

📌 **Scan SYN furtif sans ping**

```bash
nmap -sV -sC 192.168.1.1

```

📌 **Détecte les services et utilise les scripts par défaut**

```bash
nmap -A example.com

```

📌 **Scan agressif avec détection OS, services et traceroute**

---

## ⚡ **Scans furtifs et évasion**

```bash
nmap -sN 192.168.1.1

```

📌 **Scan NULL (peut contourner certains pare-feux)**

```bash
nmap -sX 192.168.1.1

```

📌 **Scan Xmas (utile contre certains IDS)**

```bash
nmap -sF 192.168.1.1

```

📌 **Scan FIN (peut contourner certaines règles de filtrage)**

```bash
nmap --data-length 20 -D RND:10 192.168.1.1

```

📌 **Ajoute du padding et utilise des adresses IP zombies pour masquer la source**

---

## 🕵 **Énumération avancée et exploitation**

### 🌐 **Découverte de services et failles**

```bash
nmap -p 21,22,80,443 --script=banner 192.168.1.1

```

📌 **Récupère les bannières des services sur les ports courants**

```bash
nmap --script=http-title 192.168.1.1

```

📌 **Récupère le titre des pages web hébergées**

```bash
nmap --script=vuln 192.168.1.1

```

📌 **Recherche des vulnérabilités connues sur la cible**

### 🔑 **Attaques spécifiques**

```bash
nmap --script=smb-enum-shares,smb-os-discovery 192.168.1.1

```

📌 **Énumération des partages et de l’OS via SMB**

```bash
nmap --script=ftp-anon 192.168.1.1

```

📌 **Teste l’accès anonyme aux serveurs FTP**

```bash
nmap --script=mysql-empty-password 192.168.1.1

```

📌 **Vérifie si MySQL est accessible sans mot de passe**

---

## 🚨 **Scans intensifs et automatiques**

```bash
nmap -T4 -A -v 192.168.1.1

```

📌 **Scan intensif avec détection avancée et niveau de rapidité élevé**

```bash
nmap -p- -T4 -A -v 192.168.1.1

```

📌 **Scan complet de tous les ports avec détection avancée et vitesse optimisée**

```bash
nmap -sS -p- -A -T4 192.168.1.1

```

📌 **Scan SYN furtif intensif avec analyse approfondie**

```bash
nmap -sU -T4 -A -v 192.168.1.1

```

📌 **Scan complet des ports UDP**

---

🔥 **Ce cheat sheet contient les commandes les plus utilisées pour les tests d'intrusion avec `Nmap`. Utilisation à des fins légales uniquement !** 🚀

```

```

🔥 **Ce cheat sheet optimise tes scans avec `Nmap` pour une reconnaissance active efficace !** 🚀

```

```
## 🛠 **Installation**
```bash
sudo apt update && sudo apt install nmap

```

📌 **Installe `Nmap` sur un système Linux**

---

## 🔍 **Commandes de base**

```bash
nmap example.com

```

📌 **Effectue un scan par défaut du domaine `example.com`**

```bash
nmap -p 80,443 192.168.1.1

```

📌 **Scanne uniquement les ports 80 et 443 de l'hôte `192.168.1.1`**

```bash
nmap -p- 192.168.1.1

```

📌 **Scanne tous les ports (1-65535) de l'hôte `192.168.1.1`**

```bash
nmap -sS 192.168.1.1

```

📌 **Effectue un scan SYN furtif**

```bash
nmap -sV example.com

```

📌 **Détecte les versions des services sur les ports ouverts**

---

## ⚡ **Reconnaissance avancée**

### 📡 **Détection du système d’exploitation**

```bash
nmap -O 192.168.1.1

```

📌 **Tente d’identifier le système d’exploitation**

### 🌐 **Scan de réseau complet**

```bash
nmap -sn 192.168.1.0/24

```

📌 **Effectue un scan ping pour détecter les hôtes actifs dans le réseau**

```bash
nmap -A 192.168.1.1

```

📌 **Effectue un scan agressif (OS, services, scripts, traceroute)**

### 🚀 **Scan furtif**

```bash
nmap -sN 192.168.1.1

```

📌 **Scan NULL (peut contourner certains pare-feux)**

```bash
nmap -sX 192.168.1.1

```

📌 **Scan Xmas (peut être utile contre certains systèmes)**

```bash
nmap -sF 192.168.1.1

```

📌 **Scan FIN (peut contourner certaines règles de filtrage)**

---

---

---

## 🔍 **Scans de base**

```bash
nmap -p- --open 192.168.1.1

```

📌 **Scanne tous les ports ouverts sur une cible**

```bash
nmap -sS -Pn 192.168.1.1

```

📌 **Scan SYN furtif sans ping**

```bash
nmap -sV -sC 192.168.1.1

```

📌 **Détecte les services et utilise les scripts par défaut**

```bash
nmap -A example.com

```

📌 **Scan agressif avec détection OS, services et traceroute**

---

## ⚡ **Scans furtifs et évasion**

```bash
nmap -sN 192.168.1.1

```

📌 **Scan NULL (peut contourner certains pare-feux)**

```bash
nmap -sX 192.168.1.1

```

📌 **Scan Xmas (utile contre certains IDS)**

```bash
nmap -sF 192.168.1.1

```

📌 **Scan FIN (peut contourner certaines règles de filtrage)**

```bash
nmap --data-length 20 -D RND:10 192.168.1.1

```

📌 **Ajoute du padding et utilise des adresses IP zombies pour masquer la source**

---

## 🕵 **Énumération avancée et exploitation**

### 🌐 **Découverte de services et failles**

```bash
nmap -p 21,22,80,443 --script=banner 192.168.1.1

```

📌 **Récupère les bannières des services sur les ports courants**

```bash
nmap --script=http-title 192.168.1.1

```

📌 **Récupère le titre des pages web hébergées**

```bash
nmap --script=vuln 192.168.1.1

```

📌 **Recherche des vulnérabilités connues sur la cible**

### 🔑 **Attaques spécifiques**

```bash
nmap --script=smb-enum-shares,smb-os-discovery 192.168.1.1

```

📌 **Énumération des partages et de l’OS via SMB**

```bash
nmap --script=ftp-anon 192.168.1.1

```

📌 **Teste l’accès anonyme aux serveurs FTP**

```bash
nmap --script=mysql-empty-password 192.168.1.1

```

📌 **Vérifie si MySQL est accessible sans mot de passe**

## 🔗 **Automatisation & Scripts Nmap Scripting Engine (NSE)**

### 📜 **Utilisation de scripts intégrés**

```bash
nmap --script=vuln 192.168.1.1

```

📌 **Recherche de vulnérabilités connues**

```bash
nmap --script=http-enum 192.168.1.1

```

📌 **Énumération des répertoires web sur l’hôte**

```bash
nmap --script=smb-os-discovery 192.168.1.1

```

📌 **Récupère des informations sur le partage SMB**

---

## 🚨 **Scans intensifs et automatiques**

```bash
nmap -T4 -A -v 192.168.1.1

```

📌 **Scan intensif avec détection avancée et niveau de rapidité élevé**

```bash
nmap -p- -T4 -A -v 192.168.1.1

```

📌 **Scan complet de tous les ports avec détection avancée et vitesse optimisée**

```bash
nmap -sS -p- -A -T4 192.168.1.1

```

📌 **Scan SYN furtif intensif avec analyse approfondie**

```bash
nmap -sU -T4 -A -v 192.168.1.1

```

📌 **Scan complet des ports UDP**

---

🔥 **Ce cheat sheet contient les commandes les plus utilisées pour les tests d'intrusion avec `Nmap`. Utilisation à des fins légales uniquement !** 🚀