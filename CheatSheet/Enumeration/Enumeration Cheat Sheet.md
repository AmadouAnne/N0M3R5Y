# Enumeration Cheat Sheet

---

# 🛠️ **Pentest Enumeration Cheat Sheet** 🚀

L'**énumération** est une étape **critique** du pentest. Elle permet d’identifier des **utilisateurs, services, ports, répertoires, sous-domaines et configurations sensibles** sur une cible.

## 🎯 **1. Énumération des Ports & Services**

👉 **Objectif** : Identifier les ports ouverts et les services en écoute.

### 🔍 **Scan des ports avec Nmap**

```bash
nmap -p- -sV -sC -oN scan.txt target.com

```

✅ **-p-** : Scan **tous** les ports (1-65535)

✅ **-sV** : Détecte la version des services

✅ **-sC** : Utilise les scripts par défaut pour plus d’infos

✅ **-oN** : Sauvegarde le scan dans un fichier

### 🚀 **Scan furtif (bypass pare-feu)**

```bash
nmap -Pn -sS -T4 --min-rate=1000 -oN stealth_scan.txt target.com

```

✅ **-Pn** : Désactive la détection des hôtes (utile si la cible bloque les pings)

✅ **-sS** : Scan TCP SYN (furtif)

✅ **-T4** : Accélère le scan

✅ **--min-rate=1000** : Définit un taux minimal de paquets envoyés

---

## 🎯 **2. Énumération des DNS & Sous-Domaines**

👉 **Objectif** : Trouver des sous-domaines et serveurs cachés.

### 🔍 **Bruteforce des sous-domaines avec Gobuster**

```bash
gobuster dns -d target.com -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt

```

✅ **-d** : Domaine cible

✅ **-w** : Wordlist des sous-domaines

### 🚀 **Découverte des sous-domaines avec Amass**

```bash
amass enum -passive -d target.com

```

✅ **-passive** : Utilisation de bases de données OSINT pour éviter de détecter l’énumération

### 🔥 **Scan DNS avec Fierce**

```bash
fierce --domain target.com

```

✅ **Recherche des sous-domaines + serveurs DNS cachés**

---

## 🎯 **3. Énumération des Répertoires & Fichiers Cachés**

👉 **Objectif** : Trouver des fichiers sensibles et points d’entrée potentiels.

### 🔍 **Bruteforce des répertoires avec Gobuster**

```bash
gobuster dir -u http://target.com -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,html,txt

```

✅ **-x** : Recherche des extensions spécifiques (php, html, txt)

### 🚀 **Détection des fichiers vulnérables avec FFUF**

```bash
ffuf -u http://target.com/FUZZ -w /usr/share/seclists/Discovery/Web-Content/common.txt

```

✅ **FFUF** est ultra-rapide pour la détection de fichiers cachés

---

## 🎯 **4. Énumération des Utilisateurs & Partages SMB**

👉 **Objectif** : Trouver des utilisateurs et fichiers partagés sur un réseau interne.

### 🔍 **Lister les utilisateurs avec Kerbrute**

```bash
kerbrute userenum --dc target.com -d target.com users.txt

```

✅ **Recherche des utilisateurs AD sur Windows**

### 🚀 **Lister les partages SMB accessibles**

```bash
smbclient -L //target.com -U ""

```

✅ **Affiche les partages disponibles même sans authentification**

---

## 🎯 **5. Énumération des Services Web & API**

👉 **Objectif** : Identifier les endpoints d’API et les technologies web utilisées.

### 🔍 **Scan technologique avec WhatWeb**

```bash
whatweb -a 3 http://target.com

```

✅ **Détecte les CMS, serveurs, langages utilisés (PHP, ASP, etc.)**

### 🚀 **Lister les endpoints d’API avec Kiterunner**

```bash
kiterunner fuzz -w wordlists/routes-large.kite -u http://target.com

```

✅ **Découvre des endpoints cachés sur les API REST**

---

## 🎯 **6. Énumération des Machines Windows (Active Directory)**

👉 **Objectif** : Identifier les ressources et les utilisateurs sous Windows AD.

### 🔍 **Récupérer les utilisateurs avec LDAP**

```bash
ldapsearch -x -h target.com -s base namingcontexts

```

✅ **Lister les noms de domaine AD**

### 🚀 **Chercher les partages et utilisateurs**

```bash
enum4linux -a target.com

```

✅ **Recherche des utilisateurs, partages SMB, groupes AD**

---

## 🎯 **7. Énumération des Bases de Données**

👉 **Objectif** : Trouver des bases SQL accessibles.

### 🔍 **Scan des bases MySQL**

```bash
mysql -h target.com -u root -p

```

✅ **Tente de se connecter sans mot de passe**

### 🚀 **Énumération des tables avec SQLmap**

```bash
sqlmap -u "http://target.com/page.php?id=1" --dbs

```

✅ **Cherche les bases accessibles via injection SQL**

---

## 🎯 **8. Énumération des Buckets AWS S3 (Cloud Storage)**

👉 **Objectif** : Trouver des stockages exposés.

### 🔍 **Lister les fichiers S3 accessibles**

```bash
aws s3 ls s3://target-bucket --no-sign-request

```

✅ **Test des accès publics sur les buckets AWS**

---

## 🎯 **9. Énumération des Emails & Credentials Exposés**

👉 **Objectif** : Trouver des emails et mots de passe fuités.

### 🔍 **Chercher des emails avec theHarvester**

```bash
theHarvester -d target.com -b google

```

✅ **Récupère des emails trouvés sur le web**

### 🚀 **Recherche de credentials fuités avec LeakCheck**

```bash
leakcheck target@email.com

```

✅ **Vérifie si l’email a été exposé dans des leaks de bases de données**

---

# 🚀 **Conclusion : Top 5 Techniques d’Énumération**

🔥 **1. Ports & Services** → `nmap -p- -sV -sC target.com`

🔥 **2. Sous-Domaines** → `gobuster dns -d target.com -w subdomains.txt`

🔥 **3. Répertoires Web** → `gobuster dir -u http://target.com -w wordlist.txt`

🔥 **4. Partages Windows** → `enum4linux -a target.com`

🔥 **5. Bases de Données** → `sqlmap -u "http://target.com/page.php?id=1" --dbs`

---

💡 **Avec ce cheat sheet, tu as toutes les techniques pour l’énumération dans un pentest !**

Si tu veux des **exemples pratiques** ou une **démo sur un lab**, dis-moi 😃 🔥