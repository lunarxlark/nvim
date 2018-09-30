FROM alpine:3.8

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    gcc \
    musl-dev \
    make \
    git \
    neovim \
    neovim-doc \
    python2 \
    python2-dev \
    py2-pip \
    python3 \
    python3-dev \
    nodejs \
    npm \
    ruby \
    ruby-dev \
    ruby-rdoc \
    ruby-bundler && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /root/.config/nvim /root/.cache/ && \
    git clone https://github.com/Shougo/dein.vim /tmp/dein && \
    sh /tmp/dein/bin/installer.sh /root/.cache/dein && \
    rm -rf /tmp/*

RUN pip2 install --upgrade pip && \
    pip2 install neovim && \
    pip3 install --upgrade pip && \
    pip3 install neovim && \
    rm -rf ~/.cache/* && \
    gem install neovim && \
    gem update neovim && \
    npm install -g neovim && \
    nvim +UpdateRemotePlugins +qa

ENV XDG_CONFIG_HOME /root/.config
ENV XDG_CACHE_HOME /root/.cache
ENV XDG_DATA_HOME /root/.local/share

ENTRYPOINT ["nvim"]
