# 🛠️ Cheat Sheet : Déverrouiller un fichier PDF sous Linux

## 📌 1. Vérifier si le fichier est protégé
Avant de tenter un déverrouillage, vérifie le type de protection :  
```bash
pdfinfo fichier.pdf
```
Si la sortie indique **"Encrypted: yes"**, continue avec les étapes suivantes.

---

## 🔓 2. Supprimer un mot de passe utilisateur
Si tu connais le mot de passe :
```bash
qpdf --decrypt --password="mot_de_passe" fichier.pdf fichier_deverrouille.pdf
```
Si le mot de passe est vide (comme dans ton cas) :
```bash
qpdf --decrypt fichier.pdf fichier_deverrouille.pdf
```

---

## 🔐 3. Supprimer les restrictions sans connaître le mot de passe
Si le PDF est protégé contre l'édition ou l'impression mais **pas par un mot de passe utilisateur**, utilise **qpdf** :
```bash
qpdf --decrypt fichier.pdf --replace-input
```
Ou avec **Ghostscript** :
```bash
gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=fichier_deverrouille.pdf fichier.pdf
```

---

## 🔍 4. Trouver un mot de passe perdu
Si le fichier PDF est protégé par un mot de passe et que tu ne le connais pas, utilise **pdfcrack** :
```bash
pdfcrack -f fichier.pdf
```
Pour tester un dictionnaire de mots de passe :
```bash
pdfcrack -f fichier.pdf -w liste_de_mots.txt
```

---

## 🚀 5. Convertir le PDF en un autre format pour contourner la protection
Si les méthodes ci-dessus ne fonctionnent pas, tu peux essayer d'ouvrir le fichier avec **LibreOffice Draw** et de l'enregistrer sous un autre format :
```bash
libreoffice --invisible --convert-to pdf fichier.pdf
```
Ou d’imprimer le PDF en image puis le reconvertir :
```bash
pdftoppm -jpeg fichier.pdf output
convert output-*.jpg fichier_deverrouille.pdf
```

---

### 🎯 Cas spécifiques
| Problème | Solution |
|----------|----------|
| Supprimer un mot de passe utilisateur | `qpdf --decrypt --password="mot_de_passe" fichier.pdf fichier_deverrouille.pdf` |
| Supprimer les restrictions | `qpdf --decrypt fichier.pdf --replace-input` |
| Trouver un mot de passe perdu | `pdfcrack -f fichier.pdf` |
| Échec des méthodes classiques | `gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=fichier_deverrouille.pdf fichier.pdf` |
| Convertir en image puis en PDF | `pdftoppm -jpeg fichier.pdf output && convert output-*.jpg fichier_deverrouille.pdf` |

---

💡 **Remarque** : Certaines méthodes peuvent ne pas fonctionner sur des fichiers très sécurisés (ex. PDF avec chiffrement AES-256). Dans ce cas, il faudra essayer un brute-force plus avancé ou trouver le mot de passe par d'autres moyens.

Si une méthode ne marche pas, dis-moi ce que ça affiche et on ajustera ! 🚀
