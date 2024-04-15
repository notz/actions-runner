FROM ghcr.io/actions/actions-runner:latest

RUN sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
    binutils \
    openssh-client \
    git \
    wget \
    xz-utils \
    && sudo rm -rf /var/lib/apt/lists/*
