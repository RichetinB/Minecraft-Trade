#!/bin/bash

# Nom du serveur Minecraft
read -p "Entrez le nom du serveur Minecraft : " server_name

# Emplacement de stockage du dossier du serveur Minecraft
dir_path="/saveMinecraft/$server_name"

# Vérifier si le dossier existe
if [ ! -d "$dir_path" ]; then
  echo "Le dossier $dir_path n'existe pas. Veuillez installer le serveur Minecraft avant de le relancer."
  exit 1
fi

# Emplacement de stockage du fichier jar
file_path="$dir_path/server.jar"

# Vérifier si le fichier jar existe
if [ ! -f "$file_path" ]; then
  echo "Le fichier $file_path n'existe pas. Veuillez installer le serveur Minecraft avant de le relancer."
  exit 1
fi

# Lancer le serveur Minecraft
echo "Lancement du serveur Minecraft ..."
cd "$dir_path"
java -Xmx1024M -Xms1024M -jar "$file_path" nogui