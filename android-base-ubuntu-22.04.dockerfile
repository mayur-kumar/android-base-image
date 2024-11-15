FROM ubuntu:22.04
LABEL maintianer="Mayur Kumar" \
email="mayur.kumar03@gmail.com"

ARG RUNNER_UID=1001
ARG USER=runner
ARG GROUP=runner
ARG GID=1001

ENV DEBIAN_FRONTEND=noninteractive
RUN groupadd -g ${GID} ${GROUP}
RUN useradd -c "Runner user" -d /home/${USER} -u ${RUNNER_UID} -g ${GID} -m ${USER}

RUN apt-get update -y \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    git \
    git-lfs \
    jq \
    unzip \
    zip \
    less \
    openssl \
    vim-tiny \
    wget \
    maven \
    nodejs \
    npm \
    python3-pip \
    openjdk-17-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
RUN npm install -g appcenter-cli@2.14.0

RUN pip3 install PyGithub requests
# RUN echo "dash dash/sh boolean false" | debconfig-set-selections
# RUN dpkg-reconfigure dash
USER runner
