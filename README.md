# TwitchDropsMiner_docker

Provide docker image for the popular [TwitchDropsMiner](https://github.com/DevilXD/TwitchDropsMiner) based on the [docker image for GUI tools](https://github.com/jlesage/docker-baseimage-gui).

## Usage (Docker)

**Build**

```shell
docker build -t tdm .
```

**Run**

Replace paths with your paths for the settings and cookies. It will download the newest development version on container start.

```shell
docker run \
    --name tdm \
    --restart unless-stopped \
    -p 5800:5800/tcp \
    -v //Users/user/TDM/settings.json:/settings.json \
    -v //Users/user/TDM/cookies.jar:/cookies.jar \
    tdm
```

## Usage (Docker Compose)

```shell
docker compose up -d
```
