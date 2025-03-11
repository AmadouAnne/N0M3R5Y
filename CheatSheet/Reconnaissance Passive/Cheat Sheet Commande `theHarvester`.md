# Cheat Sheet : Commande `theHarvester`

## 🪅Description

`theHarvester` est un outil de reconnaissance passive qui collecte des informations sur une cible à partir de source publiques(moteurs de recherche, réseaux sociaux,bases de données, etc.)

## 🚀 Commandes de base

### 🔍 Collecter des emails et des hôtes

```jsx
theHarvester -d example.com -b all
```

📌 **Collecte des emails, sous-domaines et hôtes associés à `example.com` en utilisant toutes les sources disponibles (`-b all`)**

### 🌐 **Utiliser une source spécifique**

```
theHarvester -d example.com -b google
```

📌 **Utilise uniquement Google pour collecter des informations**

### 📂 **Sauvegarder les résultats dans un fichier**

```
theHarvester -d example.com -b all -f output.txt
```

📌 **Sauvegarde les résultats dans `output.txt`**

---

## 🔧 **Options avancées**

### 🔎 **Limiter le nombre de résultats**

```
theHarvester -d example.com -b all -l 100
```

📌 **Limite la collecte à 100 résultats**

### 🕵️ **Rechercher des sous-domaines**

```
theHarvester -d example.com -b bing
```

📌 **Utilise Bing pour trouver des sous-domaines**

### 🛡 **Utiliser un proxy**

```
theHarvester -d example.com -b all --proxy 127.0.0.1:8080
```

📌 **Passe les requêtes via un proxy (ex: Burp Suite)**

### 🔗 **Rechercher des liens sur les réseaux sociaux**

```
theHarvester -d example.com -b linkedin
```

📌 **Recherche des informations sur LinkedIn**

---

## 🛠 **Sources disponibles**

Voici quelques sources populaires que vous pouvez utiliser avec `-b` :

- `google` : Recherche via Google.
- `bing` : Recherche via Bing.
- `linkedin` : Recherche sur LinkedIn.
- `twitter` : Recherche sur Twitter.
- `shodan` : Recherche via Shodan (nécessite une clé API).
- `all` : Utilise toutes les sources disponibles.

---

## 🚀 **Exemples pratiques**

### 🔍 **Collecter des emails et des hôtes**

```
theHarvester -d example.com -b google,bing -f results.txt
```

📌 **Collecte des emails et hôtes via Google et Bing, puis sauvegarde les résultats dans `results.txt`**

### 🌐 **Rechercher des sous-domaines avec Shodan**

```
theHarvester -d example.com -b shodan --shodan-key YOUR_API_KEY
```

📌 **Utilise Shodan pour trouver des sous-domaines (nécessite une clé API)**

### 🕵️ **Rechercher des informations sur LinkedIn**

```
theHarvester -d example.com -b linkedin
```

📌 **Recherche des employés ou des pages associées à `example.com` sur LinkedIn**

---

## 🚨 **Dépannage**

❓ **`theHarvester` ne fonctionne pas ou renvoie une erreur ?**

✔ Vérifie si l'outil est installé :

```
theHarvester --help
```

✔ Assure-toi d'avoir Python 3 installé :

```
python3 --version
```

✔ Si une source ne fonctionne pas, essaie une autre source (`-b google` au lieu de `-b all`).

---

## 🛠 **Automatisations & Scripts**

### 🔄 **Automatiser la collecte pour plusieurs domaines**

```
for domain in $(cat domains.txt); do
  theHarvester -d $domain -b all -f $domain-results.txt;
done
```

📌 **Collecte des informations pour chaque domaine listé dans `domains.txt`**

### 📅 **Planifier une collecte quotidienne**

Ajoute cette ligne à `crontab -e` :

```
0 0 * * * theHarvester -d example.com -b all -f daily-results.txt
```

📌 **Exécute `theHarvester` tous les jours à minuit et sauvegarde les résultats dans `daily-results.txt`**

---

## 🔥 **Conseils pour les pentesteurs**

- Utilise `b all` pour maximiser la collecte d'informations, mais sois patient, car cela peut prendre du temps.
- Combine `theHarvester` avec d'autres outils comme `sublist3r` ou `Amass` pour une reconnaissance complète.
- Si tu utilises Shodan, assure-toi d'avoir une clé API valide pour accéder à toutes les fonctionnalités.

---

🔥 **Ce cheat sheet t’aide à exploiter `theHarvester` pour une reconnaissance passive efficace !**

