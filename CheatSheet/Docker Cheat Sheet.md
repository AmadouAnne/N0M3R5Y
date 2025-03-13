# Docker Cheat Sheet

Voici un **cheat sheet complet sur Docker**, incluant les **commandes essentielles, la gestion des conteneurs, les volumes, les réseaux et la sécurité**. 🚀

---

# 🐳 **Docker Cheat Sheet**

## 📌 **1. Installation & Configuration**

### **📥 Vérifier l'installation de Docker**

```bash
docker --version

```

### **🔧 Démarrer et arrêter Docker**

```bash
sudo systemctl start docker      # Démarrer Docker
sudo systemctl stop docker       # Arrêter Docker
sudo systemctl restart docker    # Redémarrer Docker
sudo systemctl status docker     # Vérifier l'état

```

### **👤 Ajouter un utilisateur à Docker (pour éviter sudo)**

```bash
sudo usermod -aG docker $USER

```

ℹ️ **Déconnexion/Reconnexion requise après cette commande !**

---

## 📌 **2. Gestion des Conteneurs 🛠️**

### **📃 Lister les conteneurs**

```bash
docker ps                      # Conteneurs actifs
docker ps -a                   # Tous les conteneurs (même stoppés)

```

### **🚀 Lancer un conteneur**

```bash
docker run -d -p 8080:80 --name monconteneur nginx

```

🔹 **Options utiles :**

- `d` : Détaché (background)
- `p 8080:80` : Port hôte:conteneur
- `-name monconteneur` : Nommer le conteneur

### **⏸️ Stopper & Reprendre un conteneur**

```bash
docker stop monconteneur     # Arrêter un conteneur
docker start monconteneur    # Redémarrer un conteneur
docker restart monconteneur  # Redémarrer

```

### **🗑️ Supprimer un conteneur**

```bash
docker rm monconteneur
docker rm $(docker ps -aq)  # Supprimer tous les conteneurs

```

### **📊 Voir les logs d’un conteneur**

```bash
docker logs monconteneur
docker logs -f monconteneur  # Mode live (suivi en temps réel)

```

### **💻 Accéder à un conteneur en cours d’exécution**

```bash
docker exec -it monconteneur bash

```

Ou si l’image utilise `sh` au lieu de `bash` :

```bash
docker exec -it monconteneur sh

```

---

## 📌 **3. Gestion des Images 📦**

### **🔍 Rechercher une image Docker sur Docker Hub**

```bash
docker search nginx

```

### **📥 Télécharger (Pull) une image Docker**

```bash
docker pull nginx

```

### **🗑️ Supprimer une image**

```bash
docker rmi nginx
docker rmi $(docker images -q)  # Supprimer toutes les images

```

### **📃 Lister les images Docker**

```bash
docker images

```

---

## 📌 **4. Gestion des Volumes 🗄️**

### **📃 Lister les volumes Docker**

```bash
docker volume ls

```

### **🔧 Créer un volume**

```bash
docker volume create monvolume

```

### **🔗 Monter un volume dans un conteneur**

```bash
docker run -d -v monvolume:/data --name test nginx

```

### **🗑️ Supprimer un volume**

```bash
docker volume rm monvolume
docker volume rm $(docker volume ls -q)  # Supprimer tous les volumes

```

---

## 📌 **5. Réseau Docker 🌐**

### **📃 Lister les réseaux Docker**

```bash
docker network ls

```

### **🔧 Créer un réseau**

```bash
docker network create monreseau

```

### **🔗 Connecter un conteneur à un réseau**

```bash
docker network connect monreseau monconteneur

```

### **🛑 Déconnecter un conteneur d'un réseau**

```bash
docker network disconnect monreseau monconteneur

```

### **🗑️ Supprimer un réseau**

```bash
docker network rm monreseau
docker network rm $(docker network ls -q)  # Supprimer tous les réseaux

```

---

## 📌 **6. Docker Compose 🏗️**

### **📜 Exemple de `docker-compose.yml`**

```yaml
version: '3'
services:
  web:
    image: nginx
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html
  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword

```

### **📥 Lancer un projet Docker Compose**

```bash
docker-compose up -d

```

### **🛑 Arrêter un projet**

```bash
docker-compose down

```

---

## 📌 **7. Sécurité & Optimisation 🔐**

### **🔍 Vérifier la configuration Docker**

```bash
docker info
docker inspect monconteneur

```

### **🔒 Exécuter un conteneur en mode lecture seule**

```bash
docker run --read-only nginx

```

### **📃 Limiter l’utilisation des ressources CPU & RAM**

```bash
docker run --memory="512m" --cpus="1" nginx

```

### **🔒 Éviter d’exécuter un conteneur en root**

```bash
docker run -u 1000:1000 nginx

```

---

## 📌 **8. Nettoyage Docker 🧹**

### **🚀 Nettoyer les conteneurs, images et volumes inutilisés**

```bash
docker system prune -a

```

### **🗑️ Supprimer toutes les images non utilisées**

```bash
docker image prune -a

```

### **🗑️ Supprimer tous les conteneurs arrêtés**

```bash
docker container prune

```

### **🗑️ Supprimer tous les volumes inutilisés**

```bash
docker volume prune

```

---

## 🚀 **Résumé rapide**

| Commande | Description |
| --- | --- |
| `docker ps -a` | Voir tous les conteneurs |
| `docker images` | Voir les images disponibles |
| `docker run -d -p 80:80 nginx` | Lancer un conteneur Nginx |
| `docker exec -it monconteneur bash` | Accéder au shell d’un conteneur |
| `docker logs -f monconteneur` | Voir les logs d’un conteneur |
| `docker network ls` | Lister les réseaux Docker |
| `docker volume ls` | Lister les volumes Docker |
| `docker-compose up -d` | Lancer un projet avec Docker Compose |
| `docker system prune -a` | Nettoyer Docker (conteneurs, images, volumes) |

---

## 🎯 **Conclusion**

Avec ce **cheat sheet**, tu as toutes les **commandes essentielles** pour **gérer Docker efficacement**. 🚀

👉 **Besoin d’un exemple plus poussé sur un cas précis (Pentest, DevOps, Kubernetes) ?** 😈