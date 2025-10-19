FROM debian:stable-slim

# Installer les dépendances
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    python3 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Télécharger youtube-dl
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl

# Vérifier les versions
RUN python3 --version && youtube-dl --version && ffmpeg -version

ENTRYPOINT ["youtube-dl"]
