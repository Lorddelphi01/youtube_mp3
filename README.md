Présentation

Projet permettant de télécharger des vidéos/mp3 présent sur youtube




Installation

docker build -t youtube-dl .

docker compose up


Projet d'origine

https://github.com/ytdl-org/youtube-dl/tree/master


Exemple d'utilisation

docker-compose run --rm youtube-dl "https://www.youtube.com/watch?v=IYkf_JBroZ4"


docker run --rm -v /chemin/local/videos:/videos qmcgaw/youtube-dl-alpine \
    -o /videos/%(title)s.%(ext)s https://www.youtube.com/watch?v=ID_VIDEO


docker run --rm -v downloads:/downloads qmcgaw/youtube-dl-alpine \
    -o "toto.mp3" "https://www.youtube.com/watch?v=IYkf_JBroZ4"


docker run --rm -v "./downloads:/downloads" qmcgaw/youtube-dl-alpine --write-thumbnail --extract-audio -f bestaudio --audio-format mp3 -o "/downloads/toto3.mp3" "https://www.youtube.com/watch?v=beKvST9nP8c&list=PLNAVjD5Ur8ONj8ESkUY-v4fMup7rbB_WN"    


docker build -t youtube-dl .

 docker image rm qmcgaw/youtube-dl-alpine

