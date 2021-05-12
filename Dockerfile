FROM debian:stable-slim

RUN apt update && \
    apt install --no-install-recommends -y \
        git \
        openssh-server \
        python3-minimal \
        python3-pip \
        xvfb \
        x11vnc \
        x2goclient \
    && rm -rf /var/lib/apt/lists && \
    mkdir -p /run/sshd

RUN pip3 install \
        numpy \
    && rm -rf ~/.cache

RUN git clone --depth 1 https://github.com/novnc/noVNC.git && \
    rm -rf /noVNC/.git && \
    ln -s /noVNC/vnc.html /noVNC/index.html

COPY entrypoint.sh .

ENTRYPOINT ./entrypoint.sh

ENV DISPLAY=:0

EXPOSE 6080

VOLUME /config
