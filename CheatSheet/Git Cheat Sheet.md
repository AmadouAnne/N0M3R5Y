# Git Cheat Sheet


## 📌 Configuration de Git

```bash
# Configurer l'utilisateur et l'email
git config --global user.name "Ton Nom"
git config --global user.email "tonemail@example.com"

# Vérifier la configuration
git config --list

📁 Initialisation d’un dépôt Git

# Initialiser un dépôt Git dans un dossier
git init

# Cloner un dépôt distant
git clone <URL_du_dépôt>

📄 Gestion des fichiers

# Vérifier le statut des fichiers
git status

# Ajouter tous les fichiers modifiés
git add .

# Ajouter un fichier spécifique
git add fichier.txt

# Annuler un `git add`
git reset fichier.txt

# Créer un commit avec un message
git commit -m "Message du commit"

# Modifier le dernier commit (sans changer l'historique)
git commit --amend -m "Nouveau message du commit"

🔄 Synchronisation avec un dépôt distant

# Lier un dépôt distant
git remote add origin <URL_du_dépôt>

# Vérifier les dépôts distants
git remote -v

# Récupérer les modifications du dépôt distant
git pull origin main  # (ou master)

# Envoyer les modifications locales vers le dépôt distant
git push origin main  # (ou master)

# Pousser en forçant si nécessaire (⚠️ dangereux)
git push --force origin main

🌿 Gestion des branches

# Lister les branches locales
git branch

# Créer une nouvelle branche
git branch nom_branche

# Changer de branche
git checkout nom_branche

# Créer une branche et y basculer
git checkout -b nom_branche

# Fusionner une branche dans la branche actuelle
git merge nom_branche

# Supprimer une branche locale
git branch -d nom_branche

# Supprimer une branche distante
git push origin --delete nom_branche

⏳ Historique et Recherches

# Afficher l’historique des commits
git log

# Afficher l’historique en mode compact
git log --oneline --graph --decorate --all

# Voir les différences entre les versions
git diff

# Voir les différences d'un fichier spécifique
git diff fichier.txt

🛠️ Annulations et corrections

# Revenir à un commit précédent sans supprimer les modifications locales
git checkout <commit_id>

# Revenir à un commit précédent en supprimant les modifications locales
git reset --hard <commit_id>

# Annuler un commit tout en conservant les modifications
git reset --soft HEAD~1

# Revenir à l'état précédent en supprimant les modifications non commit
git checkout -- fichier.txt

# Supprimer tous les fichiers non suivis
git clean -f

🎭 Gestion des Tags

# Ajouter un tag
git tag -a v1.0 -m "Version 1.0"

# Lister les tags
git tag

# Supprimer un tag
git tag -d v1.0

# Envoyer les tags vers le dépôt distant
git push origin --tags

🔄 Rebasing (Réorganisation de l'historique)

# Faire un rebase de la branche actuelle sur une autre
git rebase main

# Interrompre un rebase en cas d'erreur
git rebase --abort

# Passer un commit interactif
git rebase -i HEAD~3  # Modifier les 3 derniers commits

📌 Stashing (Sauvegarde temporaire)

# Sauvegarder les modifications en attente
git stash

# Lister les stashs
git stash list

# Appliquer le dernier stash
git stash apply

# Appliquer et supprimer le dernier stash
git stash pop

# Supprimer un stash spécifique
git stash drop stash@{0}

# Supprimer tous les stashs
git stash clear

📦 Git Submodules (Gestion de sous-modules)

# Ajouter un sous-module
git submodule add <URL_du_dépôt>

# Mettre à jour les sous-modules
git submodule update --init --recursive

---

Avec ce cheat sheet, tu as tout ce qu'il faut pour maîtriser Git efficacement ! 🚀
Si tu veux plus de détails sur une commande, n’hésite pas ! 😊

```
