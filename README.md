# Idee de notre Projet : Commercialisation et répertoire de Serveur Minecraft ou autre dans l'avenir

## Membre : Enzo, Pierre, Matheo, Baptiste

---


## Prérequis choisit

- Nous avons louer une machine sur Contabo et notre machine est un Ubuntu 20.04.6 LTS avec une IP publique en prérequis.

- Créer tout nos utilisateur avec les droit Utilisation d'une clé SSH, nom personnalisé sur notre machine.

- Installation de fail2ban, de apache et installation de la dernière version de java pour pouvoir lancer la dernière version de minecraft.

##  Instructions d'installation

- Les instruction pour installé les prérequis sont présent dans ce fichier qui est un script voici le chemin d'[installation](/creation.bash)

- Créer un dossier avec mon user à la rascine pour stocker les serveurs minecraft ```sudo mkdir saveminecraft```

- Créer un autre dossier avec mon user à la rascine pour stocker les scripts qui lanceront la création de serveur ```sudo mkdir script```

- Dans le dossier script, ajout du script [create server](/createserver.sh) pour créer un serv et de [start](/start.sh) pour relancer un serveur

- Rendre éxécutable les deux dossiers ```chmod ug+x saveminecraft``` et ```chmod ug+x script```

## Utilisation 

- Désormais l'on peut éxécuté le script [create server](/createserver.sh) en étant au bon chemin et fesant la commande ```sudo ./createserver```qui nous demande comment appelé le serveur, ce qui vas créer un dossier avec le nom de server dans notre dossier save minecraft, dans le terminal l'on pourra suivre la création du serveur jusqu'à ce qu'il arrive a 100%. 

- Pour fermé le serveur il suffit d'un ```ctrl + c``` et pour le relancer exécuter le script [start](/start.sh) avec la commande ```sudo ./start.sh``` ce qui vas demande le nom du serveur, entrer le nom du serv et il se relancera avec toute les données du monde.

## Instructions d'accès :

- Ouvrir le jeu Minecraft et cliquer sur "Multiplayer".
- Cliquer sur "Add Server".
- Dans le champ "Server Name", saisir un nom pour le serveur.
- Dans le champ "Server Address", saisir l'adresse IP de la machine où le serveur qui est 84.21.171.238
- Cliquer sur "Done" pour enregistrer le serveur.
- Cliquer sur le serveur ajouté pour le rejoindre.
