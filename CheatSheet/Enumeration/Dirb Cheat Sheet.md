# Dirb Cheat Sheet

# DIRB Cheat Sheet

## 1. Introduction

DIRB est un outil de brute-force pour découvrir des répertoires et des fichiers cachés sur un serveur web.

## 2. Commande de Base

```bash
 dirb <URL>

```

Exemple :

```bash
 dirb <http://example.com>

```

## 3. Utilisation avec une Wordlist Personnalisée

```bash
 dirb <URL> <WORDLIST>

```

Exemple :

```bash
 dirb <http://example.com> /usr/share/wordlists/dirb/common.txt

```

## 4. Contourner les Codes de Réponse 403

```bash
 dirb <URL> -f

```

## 5. Scanner un Site en HTTPS

```bash
 dirb <https://example.com>

```

## 6. Scanner avec des Extensions Spécifiques

```bash
 dirb <URL> -X .php,.html,.txt

```

Exemple :

```bash
 dirb <http://example.com> -X .php,.html

```

## 7. Ignorer certains Codes de Réponse

```bash
 dirb <URL> -N 404

```

## 8. Définir un User-Agent Personnalisé

```bash
 dirb <URL> -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"

```

## 9. Scanner en Utilisant un Proxy

```bash
 dirb <URL> -p <PROXY>

```

Exemple :

```bash
 dirb <http://example.com> -p <http://127.0.0.1:8080>

```

## 10. Exporter les Résultats dans un Fichier

```bash
 dirb <URL> -o resultats.txt

```

## 11. Mode Verbeux (Affiche Toutes les Tentatives)

```bash
 dirb <URL> -v

```

## 12. Scanner Récursivement

```bash
 dirb <URL> -r

```

## 13. Filtrer les Résultats

```bash
 dirb <URL> | grep "CODE: 200"

```

## 14. Utilisation avec Tor

```bash
 dirb <URL> -p socks5://127.0.0.1:9050

```

## 15. Afficher l’Aide

```bash
 dirb -h

```