FROM jlesage/baseimage-gui:ubuntu-24.04-v4

ENV LANG=en_US.UTF-8
ENV KEEP_APP_RUNNING=1
RUN set-cont-env APP_NAME "TDM"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gir1.2-dbusmenu-gtk3-0.4 \
    libgtk-3-0 \
    locales \
    unzip \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tdm \
    && chmod -R 777 /tdm \
    && ln -s /cookies.jar /tdm/cookies.jar \
    && ln -s /settings.json /tdm/settings.json \
    && ln -s /config /tdm/cache

COPY startapp.sh /startapp.sh
RUN chmod +x /startapp.sh
