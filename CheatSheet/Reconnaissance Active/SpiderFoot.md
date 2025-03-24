Voici un modèle de "cheat sheet" pour SpiderFoot, inspiré de celui que vous avez partagé pour Dirb :

---

# SpiderFoot Cheat Sheet

## 1. Introduction

SpiderFoot est un outil d'OSINT (Open Source Intelligence) pour automatiser la collecte d'informations sur une cible via plus de 100 modules différents.

## 2. Lancer un scan de base

```bash
 python3 sf.py -l 127.0.0.1:5001
```

Accédez à l'interface web via `http://127.0.0.1:5001` et commencez un nouveau scan.

## 3. Démarrer un Scan via l'Interface Web

- Allez sur l'interface web `http://127.0.0.1:5001`.
- Créez un nouveau scan en entrant l'IP, le nom de domaine, ou l'email à analyser.
- Sélectionnez les modules à utiliser (comme DNS, WHOIS, Shodan, etc.).

## 4. Ajouter des Modules ou Sources Externes

- **Shodan API Key :** Ajoutez votre clé API Shodan pour étendre les résultats.
- **VirusTotal API Key :** Utilisez votre clé API pour obtenir plus d'informations sur les fichiers et les domaines.

## 5. Filtrage des Résultats

Vous pouvez filtrer les résultats dans l'interface web pour afficher uniquement certains types d'informations, comme les adresses IP ou les serveurs DNS associés à une cible.

## 6. Utiliser un Proxy pour le Scan

```bash
 python3 sf.py -l 127.0.0.1:5001 -P socks5://127.0.0.1:9050
```

Cela permet d'utiliser Tor pour anonymiser les scans.

## 7. Types de Scan Disponibles

- **Domain Name :** Recherche d'informations sur un nom de domaine.
- **IP Address :** Recherche d'informations sur une adresse IP.
- **Email Address :** Recherche d'informations sur une adresse e-mail.

## 8. Exporter les Résultats

Les résultats du scan peuvent être exportés au format JSON pour une analyse plus approfondie.

```bash
 python3 sf.py -l 127.0.0.1:5001 --output file.json
```

## 9. Lancer un Scan en Mode Verbeux

```bash
 python3 sf.py -l 127.0.0.1:5001 -v
```

Cela affiche les logs détaillés du scan en cours.

## 10. Consulter l'Aide

```bash
 python3 sf.py -h
```

Affiche toutes les options et la syntaxe des commandes.

---

Ce modèle simplifié vous permettra de vous référer rapidement aux commandes et fonctionnalités de SpiderFoot.
