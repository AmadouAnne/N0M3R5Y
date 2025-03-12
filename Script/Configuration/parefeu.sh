#!/bin/bash

echo "🔒 Configuration du pare-feu avec iptables..."

# Réinitialiser les règles existantes
sudo iptables -F
sudo iptables -X
sudo iptables -Z
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X

# 🔥 Définir les politiques par défaut
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT

# ✅ Autoriser les connexions déjà établies et le loopback
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -i lo -j ACCEPT

# 🛡️ Protection contre le spoofing, scanning et DoS
sudo iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
sudo iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

# 🔓 Autoriser les services essentiels (modifie selon tes besoins)
# SSH (limité à une IP spécifique si besoin)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# HTTP et HTTPS
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# DNS (si ton serveur a besoin de faire des requêtes DNS)
sudo iptables -A INPUT -p udp --dport 53 -j ACCEPT

# ICMP (Ping) - Facultatif
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# 🚢 Gestion de Docker (restreint l'accès)
sudo iptables -A FORWARD -i eth0 -o docker0 -j DROP

# 📜 Journaux des paquets rejetés (surveille les accès bloqués)
sudo iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables-dropped: " --log-level 4

# 📝 Sauvegarde des règles pour persistance après reboot
sudo iptables-save | sudo tee /etc/iptables/rules.v4

echo "✅ Pare-feu configuré avec succès !"

