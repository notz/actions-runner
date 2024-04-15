FROM ghcr.io/actions/actions-runner:latest

RUN apt-get update && apt-get install -y \
    openssh-client \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*