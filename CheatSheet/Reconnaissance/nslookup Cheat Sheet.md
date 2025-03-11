# nslookup Cheat Sheet

# # 📌 Cheat Sheet : Commande `nslookup`

## 🛠 Commande de base

📌 **Affiche l'adresse IP associée au domaine `example.com`**

```bash
nslookup 8.8.8.8

```

📌 **Affiche le nom de domaine associé à l'adresse IP `8.8.8.8`** (Google DNS)

---

## 🔍 **Requêtes spécifiques**

### 🌐 **Rechercher les enregistrements DNS d'un domaine**

```bash
nslookup -type=A example.com

```

📌 **Affiche les enregistrements A (adresses IPv4) du domaine**

```bash
nslookup -type=AAAA example.com

```

📌 **Affiche les enregistrements AAAA (adresses IPv6) du domaine**

```bash
nslookup -type=MX example.com

```

📌 **Affiche les serveurs de messagerie du domaine**

```bash
nslookup -type=NS example.com

```

📌 **Affiche les serveurs de noms (Name Servers) du domaine**

```bash
nslookup -type=TXT example.com

```

📌 **Affiche les enregistrements TXT du domaine (SPF, DKIM, etc.)**

---

## 🔧 **Utilisation avancée**

### 🏗 **Utiliser un serveur DNS spécifique**

```bash
nslookup example.com 8.8.8.8

```

📌 **Effectue une requête en utilisant le serveur DNS Google (8.8.8.8)**

```bash
nslookup -type=SOA example.com

```

📌 **Affiche l’enregistrement SOA (Start of Authority) du domaine**

### 🛠 **Mode interactif pour des requêtes multiples**

```bash
nslookup
> server 8.8.8.8
> example.com
> set type=MX
> example.com

```

📌 **Permet d'effectuer plusieurs requêtes sans relancer la commande à chaque fois**

---

## 🚀 **Automatisations & Scripts**

🔹 **Récupérer tous les enregistrements DNS d’un domaine**

```bash
for type in A AAAA MX NS TXT SOA; do
  echo "=== $type RECORD ===";
  nslookup -type=$type example.com;
done

```

🔹 **Vérifier plusieurs domaines stockés dans un fichier**

```bash
while read domain; do
  echo "Résolution DNS pour $domain :";
  nslookup $domain;
done < domaines.txt

```

🔹 **Automatiser une vérification quotidienne des enregistrements MX**

Ajoute cette ligne à `crontab -e` :

```bash
0 0 * * * nslookup -type=MX example.com >> mx-log.txt

```

📌 **Cela enregistre quotidiennement l’état des enregistrements MX du domaine**

---

## 🚨 **Dépannage**

❓ **NSLookup ne fonctionne pas ou renvoie une erreur ?**

✔ Vérifie si la commande est installée :

```bash
nslookup --version

```

✔ Essaye un autre serveur DNS :

```bash
nslookup example.com 1.1.1.1

```

✔ Vérifie la connectivité réseau :

```bash
ping 8.8.8.8

```

---

🔥 **Ce cheat sheet t’aide à tirer le maximum de `nslookup` pour récupérer des infos DNS !**

Tu veux automatiser encore plus de tests ou intégrer ça dans un script avancé ? 🚀