FROM node:8
LABEL  maintainer "tumayouzi <tumayouzi@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y apt-utils locales && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=ja_JP.UTF-8
    
ENV LC_ALL ja_JP.UTF-8

RUN apt-get update && \
    apt-get install -y vim && \
    git clone https://github.com/c9/core.git /cloud9 && \
    cd /cloud9 && ./scripts/install-sdk.sh

RUN npm install hexo -g && \
    npm install hexo-cli -g && \
    mkdir /workspace

WORKDIR /workspace

