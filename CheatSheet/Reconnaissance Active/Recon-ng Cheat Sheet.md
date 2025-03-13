# Recon-ng Cheat Sheet

```markdown
# 📌 Cheat Sheet : Commande `Whois` & `Recon-ng`

## 🛠 **Installation de Whois**
```bash
sudo apt update && sudo apt install whois

```

📌 **Installe `Whois` sur un système Linux**

## 🛠 **Installation de Recon-ng**

```bash
sudo apt update && sudo apt install recon-ng

```

📌 **Installe `Recon-ng`, un outil puissant de reconnaissance active**

---

## 🔍 **Commandes de base Whois**

```bash
whois example.com

```

📌 **Affiche les informations WHOIS du domaine `example.com`**

```bash
whois 192.168.1.1

```

📌 **Affiche les informations WHOIS de l'adresse IP `192.168.1.1`**

---

## 🔍 **Commandes de base Recon-ng**

### **Lancer Recon-ng**

```bash
recon-ng

```

📌 **Ouvre l'interface de Recon-ng**

### **Créer un workspace**

```bash
workspace create test_workspace

```

📌 **Crée un environnement de travail `test_workspace`**

### **Lister les modules disponibles**

```bash
modules search

```

📌 **Affiche la liste des modules disponibles**

### **Charger un module**

```bash
modules load recon/domains-hosts/hackertarget

```

📌 **Charge le module `hackertarget` pour récupérer des informations sur un domaine**

### **Afficher les options du module**

```bash
show options

```

📌 **Affiche les options et paramètres requis du module chargé**

### **Définir une valeur pour une option**

```bash
set SOURCE example.com

```

📌 **Définit `example.com` comme source d'analyse**

### **Lancer le module**

```bash
run

```

📌 **Exécute le module sélectionné avec les paramètres définis**

---

## ⚡ **Reconnaissance avancée avec Whois**

### 🌐 **Récupération des informations de domaine**

```bash
whois google.com | grep 'Registrar'

```

📌 **Extrait uniquement les informations sur le registraire du domaine**

```bash
whois example.com | grep -E 'Registrant|Admin|Tech'

```

📌 **Affiche les informations du propriétaire et des contacts administratifs/techniques**

### 🔍 **Trouver les serveurs de noms (DNS)**

```bash
whois example.com | grep 'Name Server'

```

📌 **Affiche les serveurs DNS utilisés par un domaine**

---

## ⚡ **Reconnaissance avancée avec Recon-ng**

### 📌 **Ajout de clés API pour des services avancés**

```bash
keys add shodan_api <API_KEY>

```

📌 **Ajoute une clé API pour Shodan afin d'effectuer des recherches avancées**

### 🔗 **Utilisation des modules populaires**

```bash
modules load recon/domains-contacts/whois_pocs
set SOURCE example.com
run

```

📌 **Extrait les contacts administratifs et techniques du domaine**

```bash
modules load discovery/info_disclosure/github_miner
set SOURCE example.com
run

```

📌 **Cherche des informations sensibles exposées sur GitHub**

### 🕵 **Exfiltration des résultats**

```bash
show schema

```

📌 **Affiche la structure des bases de données internes**

```bash
select * from hosts;

```

📌 **Liste toutes les adresses trouvées dans la base de données**

```bash
export csv output.csv

```

📌 **Exporte les résultats en format CSV**

---

## 🚨 **Dépannage & Conseils**

❓ **Besoin de plus d'informations ?**
✔ Essayez `whois -h whois.arin.net 8.8.8.8` pour les IPs américaines.
✔ Expérimentez différents modules Recon-ng avec `modules search`
✔ Testez différents serveurs WHOIS avec `whois -h whois.ripe.net example.com`.

🔥 **Ce cheat sheet est essentiel pour la reconnaissance active en pentest !** 🚀