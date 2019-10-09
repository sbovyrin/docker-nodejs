FROM alpine:3.10
LABEL author="Sergey Bovyrin <s.bovyrin@icloud.com>" \
  version="1.1.0" \
  description="Lightweight docker image based on Alpine v3.10 with nodejs environment inside." \
  user="node" \
  workdir="/home/node/app"

ENV USER=node
ENV UID=1000
ENV GID=1000

RUN apk --no-cache add curl nodejs-current \
  && curl -L https://www.npmjs.com/install.sh | sh \
  && npm i -g yarn \
  && apk del curl \
  && addgroup --gid $GID $USER \
    && adduser --disabled-password \
        --ingroup $USER \
        --uid $UID \
        $USER

USER $USER

WORKDIR /home/$USER/app

CMD ["node"]
