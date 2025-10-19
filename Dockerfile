# Utilisation d'une image de base légère
FROM debian:stable-slim

# Mise à jour et installation des dépendances
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Téléchargement de youtube-dl et attribution des droits
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl

# Vérification des installations
RUN youtube-dl --version && ffmpeg -version

# Définir youtube-dl comme commande par défaut
ENTRYPOINT ["youtube-dl"]
