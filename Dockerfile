FROM ghcr.io/actions/actions-runner:2.321.0

RUN sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
    build-essential \
    openssh-client \
    wget \
    xz-utils \
    # Install chrome dependencies
    libgconf-2-4 libatk1.0-0 libatk-bridge2.0-0 libgdk-pixbuf2.0-0 libgtk-3-0 libgbm-dev libnss3-dev libxss-dev libasound2 xvfb fonts-liberation libu2f-udev xdg-utils \
    && sudo rm -rf /var/lib/apt/lists/*
