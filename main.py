import os
import requests
import logging
logging.basicConfig(level=logging.DEBUG)

from flask import Flask, render_template, request

# URL du fichier à télécharger
url = "https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar"

# Emplacement de stockage du fichier téléchargé
file_path = "server.jar"

# Lancer le serveur web Flask
app = Flask(__name__)

# Route pour servir la page HTML
app = Flask(__name__, template_folder="tmpl")

@app.route("/")
def index():
    return render_template("index.html")

# Route pour télécharger et installer le serveur
@app.route("/install-server", methods=["POST"])
def install_server():
    if request.method == "POST":
        # Télécharger le fichier depuis l'URL donnée
        response = requests.get(url)

        # Vérifier si la requête a réussi
        if response.status_code == 200:
            # Écrire le contenu de la réponse dans le fichier
            with open(file_path, "wb") as file:
                file.write(response.content)

        return "Serveur Minecraft installé avec succès !"

# Route pour lancer le serveur Minecraft
@app.route("/launch-server", methods=["POST"])
def launch_server():
    if request.method == "POST":
         # Vérifier si le fichier eula.txt existe et le créer avec la valeur "eula=true" si nécessaire
        eula_file_path = os.path.join(os.getcwd(), "eula.txt")
        if not os.path.isfile(eula_file_path):
            with open(eula_file_path, "w") as eula_file:
                eula_file.write("eula=true")
        # Lancer le serveur Minecraft
        os.system(f"java -Xmx1024M -Xms1024M -jar {file_path} nogui")

    return "Serveur Minecraft lancé avec succès !"

if __name__ == "__main__":
    app.run()
