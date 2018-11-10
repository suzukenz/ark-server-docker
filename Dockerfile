FROM ubuntu:14.04
LABEL maintainer="suzukenz"

ENV USER steam
ENV HOME /home/${USER}
ENV STEAMCMD_ROOT ${HOME}/steamcmd
# You need to create and mount the volume on this path to persist game data
ENV APP_ROOT /ark

# Setup dependencies
RUN apt-get update && apt-get install -y \
  perl-modules  \
  curl  \
  lsof \
  libc6-i386 \
  lib32gcc1 \
  bzip2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m ${USER}

# Install ark server manager
RUN curl -sL http://git.io/vtf5N | bash -s ${USER}
COPY instance.global.cfg /etc/arkmanager/instances/main.cfg
COPY arkmanager.global.cfg /etc/arkmanager/arkmanager.cfg

# Create ARK root dir
RUN mkdir -p ${APP_ROOT} && chown ${USER}:${USER} ${APP_ROOT}

# Switch to user steam
USER ${USER}

# Install steamcmd
RUN mkdir -p ${STEAMCMD_ROOT} && cd ${STEAMCMD_ROOT} && \
  curl -o steamcmd_linux.tar.gz "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" && \
  tar zxf steamcmd_linux.tar.gz && \
  rm steamcmd_linux.tar.gz

WORKDIR ${HOME}
# Add ARK server settings
COPY arkmanager.server.cfg ${HOME}/.arkmanager.cfg
COPY run.sh run.sh
COPY ark.Game.ini ark.Game.ini

# Change the ports according to the ones set in your arkmanager.cfg file.
EXPOSE 27015/udp 7777/udp 7778/udp
# RCON for remote console server access (optional)
# EXPOSE 27020

ENTRYPOINT ["./run.sh"]
