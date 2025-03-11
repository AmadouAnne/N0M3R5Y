# Whois Cheat Sheet

# 📌 Cheat Sheet : Commande `whois`

## 🛠 Commande de base

```bash
whois exemple.com
```

📌 **Affiche les informations d'enregistrement du domaine `example.com`**

```bash
whois 8.8.8.8

```

📌 **Affiche les informations sur l'adresse IP `8.8.8.8`** (Google DNS)

---

## 🔍 **Requêtes spécifiques**

### 🌐 **Rechercher un domaine en précisant un serveur whois**

```bash
whois -h whois.verisign-grs.com example.com

```

📌 **Interroge un serveur whois spécifique (utile si `whois` ne retourne rien par défaut).**

### 📌 **Obtenir uniquement les dates d'expiration et de création**

```bash
whois example.com | grep -E 'Creation Date|Expiry Date'

```

📌 **Filtrer uniquement les dates d’enregistrement et d’expiration**

### 🌍 **Lister les serveurs de noms DNS (NS)**

```bash
whois example.com | grep -i 'Name Server'

```

📌 **Affiche les serveurs DNS utilisés par le domaine**

### 🔗 **Trouver le registrar d’un domaine**

```bash
whois example.com | grep -i 'Registrar'

```

📌 **Affiche le bureau d'enregistrement du domaine**

### 📧 **Extraire les emails liés au domaine**

```bash
whois example.com | grep -i 'Email'

```

📌 **Affiche les emails associés (si non protégés par un service comme WhoisGuard)**

### 🚀 **Rechercher les informations d’un propriétaire d’IP (ASN)**

```bash
whois 8.8.8.8 | grep -i 'OrgName\|NetRange'

```

📌 **Affiche l’organisation qui possède l’adresse IP et la plage IP associée**

---

## 🔧 **Options utiles**

| Commande | Description |
| --- | --- |
| `whois -h whois.iana.org example.com` | Interroger IANA (utile pour savoir quel registre gère le TLD) |
| `whois -h whois.arin.net 8.8.8.8` | Interroger ARIN pour des infos sur une IP en Amérique du Nord |
| `whois -h whois.ripe.net 193.51.24.1` | Interroger RIPE pour des IPs européennes |
| `whois -h whois.apnic.net 203.0.113.1` | Interroger APNIC pour des IPs en Asie-Pacifique |
| `whois -h whois.afrinic.net 196.10.1.1` | Interroger AFRINIC pour des IPs en Afrique |
| `whois -h whois.lacnic.net 200.3.13.1` | Interroger LACNIC pour des IPs en Amérique latine |

---

## 🚀 **Automatisations & Scripts**

🔹 **Exporter les infos d’un domaine dans un fichier texte**

```bash
whois example.com > whois-info.txt

```

🔹 **Lister les domaines expirant bientôt (à partir d’un fichier de domaines)**

```bash
while read domain; do whois "$domain" | grep 'Expiry Date'; done < domaines.txt

```

🔹 **Automatiser une vérification sur un domaine toutes les 24h**

Ajoute cette ligne à `crontab -e` :

```bash
0 0 * * * whois example.com | grep 'Expiry Date' >> whois-log.txt

```

📌 **Cela stocke la date d’expiration du domaine chaque jour.**

---

## 🚨 **Dépannage**

❓ **Whois ne fonctionne pas ou affiche peu d’informations ?**

✔ Vérifie si le paquet `whois` est installé :

```bash
whois --version

```

✔ Teste un autre serveur whois :

```bash
whois -h whois.verisign-grs.com example.com

```

✔ Si un domaine est protégé par un service comme WhoisGuard, utilise des outils comme :

- [**https://whois.domaintools.com/**](https://whois.domaintools.com/)
- [**https://who.is/**](https://who.is/)

---

🔥 **Ce cheat sheet te permet d'exploiter au maximum la commande `whois` pour récupérer un max d’infos !**

```

```
