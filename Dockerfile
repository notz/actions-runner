FROM ghcr.io/actions/actions-runner:2.331.0

RUN sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
    build-essential \
    openssh-client \
    wget \
    xz-utils \
    # Install chrome dependencies on ubuntu - see https://github.com/browser-actions/setup-chrome/blob/master/src/dependencies.ts \
    libasound2t64 libatk-bridge2.0-0t64 libatk1.0-0t64 libcairo2 libcups2t64 libdbus-1-3 libexpat1 libgbm1 libglib2.0-0t64 libnss3 libpango-1.0-0 libxcomposite1 libxdamage1 libxfixes3 libxkbcommon0 libxrandr2 \
    && sudo rm -rf /var/lib/apt/lists/*
