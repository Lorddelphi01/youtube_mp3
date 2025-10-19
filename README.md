Présentation

Projet permettant de télécharger des vidéos/mp3 présent sur youtube




Installation

docker compose up


Projet d'origine

https://github.com/ytdl-org/youtube-dl/tree/master


Exemple d'utilisation

docker-compose run --rm youtube-dl "https://www.youtube.com/watch?v=IYkf_JBroZ4"


docker run --rm -v /chemin/local/videos:/videos qmcgaw/youtube-dl-alpine \
    -o /videos/%(title)s.%(ext)s https://www.youtube.com/watch?v=ID_VIDEO


docker run --rm -v downloads:/downloads qmcgaw/youtube-dl-alpine \
    -o "toto.mp3" "https://www.youtube.com/watch?v=IYkf_JBroZ4"