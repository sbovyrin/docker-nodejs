FROM alpine:3.11
LABEL author="Sergey Bovyrin <s.bovyrin@icloud.com>" \
    version="2.0.0" \
    alpine_version="3.11" \
    nodejs_version="13.8" \
    description="Lightweight docker image based on Alpine with nodejs environment inside." \
    user="node" \
    workdir="/home/node/app"

ENV USER=node
ENV UID=1000
ENV GID=1000

RUN apk --no-cache add curl libstdc++ \
    && curl -fsSLO --compressed https://unofficial-builds.nodejs.org/download/release/v13.8.0/node-v13.8.0-linux-x64-musl.tar.xz \
    && tar -xJf node-v13.8.0-linux-x64-musl.tar.xz \
    && mkdir /usr/local/lib/nodejs \
    && mv node-v13.8.0-linux-x64-musl/* /usr/local/lib/nodejs \
    && rm -rf node-v13.8.0-linux-x64-musl.tar.xz node-v13.8.0-linux-x64-musl \
    && ln -s /usr/local/lib/nodejs/bin/node /usr/local/bin/node \
    && ln -s /usr/local/lib/nodejs/bin/npm /usr/local/bin/npm \
    && ln -s /usr/local/lib/nodejs/bin/npx /usr/local/bin/npx \
    && npm i -g yarn \
    && ln -s /usr/local/lib/nodejs/lib/node_modules/yarn/bin/yarn /usr/local/bin/yarn \
    && apk del curl \
    && addgroup -g $GID -S $USER \
    && adduser -G $USER -u $UID -S $USER

USER $USER

WORKDIR /home/$USER/app

CMD tail -f /dev/null
