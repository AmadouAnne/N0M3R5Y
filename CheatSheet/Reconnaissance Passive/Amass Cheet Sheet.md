# Amass Cheet Sheet

```markdown
# 📌 Cheat Sheet : Commande `amass`

## 🛠 **Installation**
```bash
sudo apt install amass  # Sur Debian/Ubuntu
brew install amass      # Sur macOS
go install -v github.com/OWASP/Amass/v3/...@latest  # Via Go

```

📌 **Installe `amass` selon ton environnement**

---

## 🔍 **Commandes de base**

```bash
amass enum -d example.com

```

📌 **Effectue une énumération passive des sous-domaines du domaine `example.com`**

```bash
amass intel -whois -d example.com

```

📌 **Récupère des informations sur le domaine `example.com` via WHOIS**

```bash
amass db -list

```

📌 **Affiche les résultats stockés dans la base de données locale `amass`**

---

## ⚡ **Reconnaissance avancée**

### 🌎 **Énumération avec sources multiples**

```bash
amass enum -active -d example.com

```

📌 **Active l’énumération avec des requêtes directes aux serveurs DNS**

```bash
amass enum -brute -d example.com

```

📌 **Effectue une énumération brute-force des sous-domaines**

```bash
amass enum -ip -d example.com

```

📌 **Affiche les adresses IP associées aux sous-domaines trouvés**

### 🏗 **Utilisation de plusieurs sources DNS**

```bash
amass enum -src -d example.com

```

📌 **Affiche les sources des données utilisées**

```bash
amass enum -r 8.8.8.8,1.1.1.1 -d example.com

```

📌 **Utilise les serveurs DNS spécifiques (Google et Cloudflare)**

---

## 🚀 **Automatisation & Scripts**

🔹 **Énumérer et sauvegarder les résultats dans un fichier**

```bash
amass enum -d example.com -o example-subdomains.txt

```

📌 **Enregistre les sous-domaines trouvés dans `example-subdomains.txt`**

🔹 **Comparer avec un précédent scan**

```bash
diff -u old_scan.txt new_scan.txt

```

📌 **Détecte les changements entre deux scans**

🔹 **Lancer un scan en arrière-plan avec logs**

```bash
amass enum -d example.com -o result.txt &> scan.log &

```

📌 **Exécute `amass` en tâche de fond et stocke les logs**

---

## 🚨 **Dépannage & Conseils**

❓ **Problèmes de résolution DNS ?**

✔ Essaye un autre serveur DNS :

```bash
amass enum -d example.com -r 8.8.8.8

```

✔ Vérifie si `amass` a bien accès aux sources en ligne :

```bash
curl -I https://www.example.com

```

❓ **Résultats insuffisants ?**

✔ Active le mode `-active` pour obtenir plus d’infos

✔ Augmente le timeout avec `-timeout 60`

---

🔥 **Ce cheat sheet t’aide à tirer le meilleur d’`amass` pour la reconnaissance passive !**


```

```
