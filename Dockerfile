FROM ghcr.io/actions/actions-runner:2.315.0

RUN sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    openssh-client \
    git \
    wget \
    xz-utils \
    && sudo rm -rf /var/lib/apt/lists/*
