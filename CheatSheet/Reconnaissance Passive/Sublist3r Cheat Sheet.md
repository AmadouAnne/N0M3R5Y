# Sublist3r Cheat Sheet

```markdown
# 📌 Cheat Sheet : Commande `Sublist3r`

## 🛠 **Installation**
```bash
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip install -r requirements.txt

```

📌 **Installe `Sublist3r` et ses dépendances**

---

## 🔍 **Commandes de base**

```bash
python sublist3r.py -d example.com

```

📌 **Effectue une énumération passive des sous-domaines du domaine `example.com`**

```bash
python sublist3r.py -d example.com -o subdomains.txt

```

📌 **Enregistre les résultats dans le fichier `subdomains.txt`**

```bash
python sublist3r.py -d example.com -v

```

📌 **Affiche les sous-domaines trouvés en temps réel**

---

## ⚡ **Reconnaissance avancée**

### 🌎 **Utilisation de moteurs de recherche spécifiques**

```bash
python sublist3r.py -d example.com --engine Bing,Google,Yahoo

```

📌 **Spécifie les moteurs de recherche utilisés**

```bash
python sublist3r.py -d example.com --ports 80,443,8080

```

📌 **Teste la connectivité des sous-domaines sur les ports spécifiés**

### 🏗 **Utilisation combinée avec d'autres outils**

```bash
python sublist3r.py -d example.com | tee subdomains.txt

```

📌 **Affiche et enregistre simultanément les résultats**

```bash
cat subdomains.txt | sort -u > unique_subdomains.txt

```

📌 **Supprime les doublons des résultats**

---

## 🚀 **Automatisation & Scripts**

🔹 **Énumérer et utiliser avec d'autres outils**

```bash
python sublist3r.py -d example.com -o subdomains.txt && cat subdomains.txt | xargs -I {} curl -I {}

```

📌 **Utilise `curl` pour tester les sous-domaines trouvés**

🔹 **Comparer avec un précédent scan**

```bash
diff -u old_scan.txt new_scan.txt

```

📌 **Détecte les changements entre deux scans**

🔹 **Exécuter en tâche de fond avec logs**

```bash
nohup python sublist3r.py -d example.com -o result.txt &> scan.log &

```

📌 **Lance `Sublist3r` en arrière-plan et stocke les logs**

---

## 🚨 **Dépannage & Conseils**

❓ **Problèmes d'exécution ?**

✔ Assure-toi que `pip install -r requirements.txt` a bien été exécuté

✔ Vérifie la connexion aux moteurs de recherche :

```bash
curl -I https://www.google.com

```

❓ **Résultats insuffisants ?**

✔ Ajoute plus de moteurs de recherche avec `--engine`
✔ Teste différents ports avec `--ports`

---

🔥 **Ce cheat sheet t’aide à tirer le meilleur de `Sublist3r` pour la reconnaissance passive !**

```

```
