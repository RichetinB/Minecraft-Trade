#!/bin/bash

### Création des utilisateurs avec les droits sudo
adduser baptiste
usermod -aG sudo baptiste

adduser pierre
usermod -aG sudo pierre

adduser enzo
usermod -aG sudo enzo

adduser matheo
usermod -aG sudo matheo

### Changer le nom de la machine
echo "Minecraft-Server" > /etc/hostname
hostname -F /etc/hostname

### Installer le serveur web Apache
apt update
apt install apache2

### Configurer le serveur web
Chemin 
 /var/www/html/index.html

### Installer la dernière version de Java
apt install openjdk-17-jdk

### Ouvrir le port 25565 pour Minecraft
ufw allow 25565

### Installer Fail2Ban
apt install fail2ban

### Configurer Fail2Ban pour Apache et SSH
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sed -i 's/ignoreip = 127.0.0.1\/8 ::1/ignoreip = 127.0.0.1\/8 ::1 84.21.171.238/g' /etc/fail2ban/jail.local
sed -i 's/bantime = 10m/bantime = 1h/g' /etc/fail2ban/jail.local
sed -i 's/maxretry = 5/maxretry = 3/g' /etc/fail2ban/jail.local
echo -e "\n[apache]\nenabled = true\nport = http,https\nfilter = apache-auth\nlogpath = /var/log/apache*/*error.log\nmaxretry = 6\nbantime = 1h" >> /etc/fail2ban/jail.local
echo -e "\n[sshd]\nenabled = true\nport = ssh\nfilter = sshd\nlogpath = /var/log/auth.log\nmaxretry = 3\nbantime = 1h" >> /etc/fail2ban/jail.local

### Ouvrir les ports pour Apache et SSH
ufw allow 80
ufw allow 22

