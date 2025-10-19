# youtube-dl (container)

Présentation
------------
Outil Docker pour télécharger des vidéos et extraire l'audio (mp3) depuis YouTube en s'appuyant sur youtube-dl / forks compatibles. Fournit des images et des exemples d'utilisation via Docker / docker-compose.

Caractéristiques
---------------
- Téléchargement de vidéos YouTube et listes de lecture.
- Extraction audio en MP3 (ou autres formats pris en charge).
- Écriture de miniatures (--write-thumbnail).
- Utilisation simple via Docker CLI ou docker-compose.
- Montage de volumes pour persistance des fichiers téléchargés.

Prérequis
---------
- Docker (Windows) installé et configuré.
- Optionnel : docker-compose (si vous utilisez docker-compose up/run).

Installation
------------
1. Construire l'image locale (optionnel si vous utilisez une image publique) :
```bash
docker build -t youtube-dl .
```

2. Démarrer avec docker-compose :
```bash
docker compose up
```
ou (ancienne syntaxe) :
```bash
docker-compose up
```

Utilisation (exemples)
----------------------
- Télécharger une vidéo (via docker-compose) :
```bash
docker-compose run --rm youtube-dl "https://www.youtube.com/watch?v=IYkf_JBroZ4"
```

- Télécharger et enregistrer dans un dossier local :
```bash
docker run --rm -v C:\chemin\local\videos:/videos qmcgaw/youtube-dl-alpine \
  -o /videos/%(title)s.%(ext)s "https://www.youtube.com/watch?v=ID_VIDEO"
```

- Extraire l'audio et nommer le fichier "toto.mp3" :
```bash
docker run --rm -v downloads:/downloads qmcgaw/youtube-dl-alpine \
  -o "toto.mp3" "https://www.youtube.com/watch?v=IYkf_JBroZ4"
```

- Extraire audio en MP3, meilleure piste audio et télécharger la miniature :
```bash
docker run --rm -v "%cd%/downloads:/downloads" qmcgaw/youtube-dl-alpine \
  --write-thumbnail --extract-audio -f bestaudio --audio-format mp3 \
  -o "/downloads/toto3.mp3" "https://www.youtube.com/watch?v=beKvST9nP8c&list=PL..."
```
Remarques :
- Sous Windows PowerShell utilisez ${PWD} ou %cd% pour le chemin courant selon le shell.
- Remplacez les URLs et noms de sortie par ceux souhaités.

Options courantes utiles
-----------------------
- -o, --output TEMPLATE : modèle de nom de fichier (ex. "/downloads/%(title)s.%(ext)s").
- --extract-audio : extraire l'audio d'une vidéo.
- --audio-format mp3 : convertir en MP3.
- -f, --format : sélectionner le format (ex. bestaudio).
- --write-thumbnail : télécharger la miniature.
- --yes-playlist / --no-playlist : inclure ou exclure les playlists.

Bonnes pratiques
----------------
- Monter un volume local pour préserver les téléchargements (-v host_path:container_path).
- Mettre à jour régulièrement l'image / youtube-dl (ou fork) pour gérer les changements de YouTube.
- Gérer les quotas et limites en cas de téléchargement massif (attendre entre les requêtes).

Nettoyage d'images
------------------
Supprimer une image locale (exemple) :
```bash
docker image rm qmcgaw/youtube-dl-alpine
```

Projet d'origine et références
------------------------------
Projet d'origine : https://github.com/ytdl-org/youtube-dl

Contribuer
----------
- Proposer des améliorations via des issues / PR si dépôt disponible.
- Tester les commandes sur votre environnement (Windows : adapter les chemins).

Dépannage rapide
----------------
- Erreur "This video is unavailable" : vérifier l'URL et les restrictions géographiques.
- Problèmes de conversion audio : installer ffmpeg dans l'image si absent.
- Problèmes SSL/connexion : vérifier la configuration réseau / proxy Docker.

Licence
-------
Se conformer aux licences des projets utilisés (youtube-dl, ffmpeg, etc.) et aux conditions d'utilisation de YouTube.
