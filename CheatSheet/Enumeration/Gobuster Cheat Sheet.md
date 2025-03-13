# Gobuster Cheat Sheet

### 📌 **Gobuster Cheatsheet – Pentesting avec Gobuster**

Gobuster est un outil en ligne de commande utilisé pour le **bruteforce de répertoires** et la **découverte de sous-domaines** sur des sites web. Il est rapide et efficace grâce à l’utilisation de requêtes HTTP et de threads multiples.

---

## 🛠️ **Installation de Gobuster**

Si vous utilisez **Kali Linux**, Gobuster est préinstallé. Sinon, installez-le avec :

```bash
sudo apt install gobuster  # Debian/Ubuntu
brew install gobuster      # macOS (Homebrew)
go install github.com/OJ/gobuster/v3@latest  # Go

```

---

## 🔎 **1. Scan de Répertoires (Directory Busting)**

Cherche des dossiers cachés sur un site :

```bash
gobuster dir -u http://site.com -w /usr/share/wordlists/dirb/common.txt

```

📌 **Options utiles** :

- `u http://site.com` → URL cible
- `w wordlist.txt` → Wordlist utilisée
- `x php,html,txt` → Recherche des extensions spécifiques
- `t 50` → Nombre de threads (par défaut 10)
- `-wildcard` → Ignore les réponses en erreur

👉 **Exemple avancé** (avec extensions et statut HTTP filtré) :

```bash
gobuster dir -u http://site.com -w common.txt -x php,html -t 50 --status-codes-blacklist 403,404

```

---

## 🌍 **2. Scan de Sous-Domaines (DNS Busting)**

Recherche des sous-domaines cachés :

```bash
gobuster dns -d site.com -w subdomains.txt

```

📌 **Options utiles** :

- `d site.com` → Domaine cible
- `w wordlist.txt` → Liste de sous-domaines
- `t 50` → Threads

---

## 🔒 **3. Scan d’Objets S3 (Amazon Buckets)**

Trouve des buckets AWS publics :

```bash
gobuster s3 -w bucket-names.txt

```

---

## 🚀 **4. Bruteforce de Virtual Hosts (VHOST)**

Utilisé pour trouver des hôtes virtuels sur un serveur :

```bash
gobuster vhost -u http://site.com -w vhosts.txt

```

---

## 📋 **5. Résultats en Fichier**

Sauvegarde les résultats dans un fichier :

```bash
gobuster dir -u http://site.com -w common.txt -o result.txt

```

---

### 🔥 **Tips & Tricks**

- **Augmentez le nombre de threads (-t 50 ou plus) pour accélérer le scan**
- **Filtrez les réponses HTTP inutiles avec --status-codes-blacklist**
- **Utilisez des wordlists adaptées (ex: `SecLists`) pour de meilleurs résultats**

---

Besoin d’aide ? 📖 Tapez :

```bash
gobuster -h

```