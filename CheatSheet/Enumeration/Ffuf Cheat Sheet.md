# Ffuf Cheat Sheet

# FFUF Cheat Sheet

## 1. Introduction

FFUF (Fuzz Faster U Fool) est un outil rapide pour le fuzzing de répertoires, fichiers et paramètres HTTP.

## 2. Commande de Base

```bash
ffuf -u <URL>/FUZZ -w <WORDLIST>

```

Exemple :

```bash
ffuf -u <http://example.com/FUZZ> -w /usr/share/wordlists/dirb/common.txt

```

## 3. Scanner avec une Extension Spécifique

```bash
ffuf -u <URL>/FUZZ -w <WORDLIST> -e .php,.html,.txt

```

Exemple :

```bash
ffuf -u <http://example.com/FUZZ> -w /usr/share/wordlists/dirb/common.txt -e .php,.html

```

## 4. Ignorer certains Codes de Réponse

```bash
ffuf -u <URL>/FUZZ -w <WORDLIST> -mc all -fc 403,404

```

## 5. Scanner un Paramètre GET

```bash
ffuf -u "<http://example.com/page.php?param=FUZZ>" -w <WORDLIST>

```

## 6. Scanner un Paramètre POST

```bash
ffuf -u "<http://example.com/login.php>" -w <WORDLIST> -X POST -d "username=FUZZ&password=test"

```

## 7. Scanner avec Plusieurs Threads (Accélération)

```bash
ffuf -u <URL>/FUZZ -w <WORDLIST> -t 100

```

## 8. Scanner avec un Proxy (ex: Burp Suite)

```bash
ffuf -u <URL>/FUZZ -w <WORDLIST> -x <http://127.0.0.1:8080>

```

## 9. Exporter les Résultats dans un Fichier

```bash
ffuf -u <URL>/FUZZ -w <WORDLIST> -o resultats.json -of json

```

## 10. Filtrer les Résultats par Longueur de Réponse

```bash
ffuf -u <URL>/FUZZ -w <WORDLIST> -fs 0

```

## 11. Scanner Récursivement

```bash
ffuf -u <URL>/FUZZ -w <WORDLIST> -recursion

```

## 12. Définir un User-Agent Personnalisé

```bash
ffuf -u <URL>/FUZZ -w <WORDLIST> -H "User-Agent: Mozilla/5.0"

```

## 13. Scanner une API REST avec JSON

```bash
ffuf -u "<http://example.com/api>" -w <WORDLIST> -X POST -H "Content-Type: application/json" -d '{"param": "FUZZ"}'

```

## 14. Scanner une Cible avec Autorisation Basic

```bash
ffuf -u <URL>/FUZZ -w <WORDLIST> -H "Authorization: Basic base64encodedcredentials"

```

## 15. Afficher l’Aide

```bash
ffuf -h

```