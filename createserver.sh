#!/bin/bash

# Nom du serveur Minecraft
read -p "Entrez le nom du serveur Minecraft : " server_name

# Emplacement de stockage du dossier du serveur Minecraft
dir_path="/saveMinecraft/$server_name"

# Vérifier si le dossier de destination existe et le créer si nécessaire
if [ ! -d "$dir_path" ]; then
  echo "Création du dossier $dir_path ..."
  mkdir -p "$dir_path"
else
  echo "Le dossier $dir_path existe déjà."
fi

# Emplacement de stockage du fichier téléchargé
file_path="$dir_path/server.jar"

# URL du fichier à télécharger
url="https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar"

# Télécharger le fichier depuis l'URL donnée
echo "Téléchargement du fichier depuis l'URL : $url"
wget -O "$file_path" "$url"

# Vérifier si le téléchargement a réussi
if [ $? -eq 0 ]; then
  echo "Serveur Minecraft installé avec succès dans le dossier $dir_path !"
else
  echo "Erreur lors du téléchargement du serveur Minecraft"
fi

# Vérifier si le fichier eula.txt existe et le créer avec la valeur "eula=true" si nécessaire
eula_file_path="$dir_path/eula.txt"
if [ ! -f "$eula_file_path" ]; then
  echo "Création du fichier $eula_file_path avec la valeur 'eula=true'"
  echo "eula=true" > "$eula_file_path"
fi

# Lancer le serveur Minecraft
echo "Lancement du serveur Minecraft ..."
cd "$dir_path"
java -Xmx1024M -Xms1024M -jar "$file_path" nogui