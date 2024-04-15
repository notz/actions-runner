FROM ghcr.io/actions/actions-runner:latest

RUN sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
    openssh-client \
    git \
    wget \
    && sudo rm -rf /var/lib/apt/lists/*
