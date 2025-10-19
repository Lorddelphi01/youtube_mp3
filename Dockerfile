# Utilisation d'une image de base légère
FROM python:3-alpine

RUN apk add --no-cache ffmpeg curl && \
    curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl

VOLUME /downloads
WORKDIR /downloads
ENTRYPOINT ["youtube-dl", "https://www.youtube.com/watch?v=IYkf_JBroZ4"]
