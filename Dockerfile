# python2 removed in 3.16+
FROM docker.io/alpine:3.15

RUN set -exu \
  && apk add --no-cache \
      asciidoc \
      bash \
      bc \
      binutils \
      bzip2 \
      cdrkit \
      coreutils \
      diffutils \
      findutils \
      flex \
      fts-dev \
      g++ \
      gawk \
      gcc \
      gettext \
      git \
      grep \
      intltool \
      libxslt \
      linux-headers \
      make \
      musl-libintl \
      musl-obstack-dev \
      ncurses-dev \
      openssl-dev \
      patch perl \
      python2-dev \
      python3-dev \
      rsync \
      tar \
      unzip \
      util-linux \
      wget \
      zlib-dev \
      zsh

RUN set -exu \
  && mkdir -p /opt/openwrt \
  && addgroup -g 1000 -S builder \
  && adduser -u 1000 -S builder -G builder -s /bin/zsh

USER builder

COPY zshrc /home/builder/.zshrc

RUN set -exu \
  && cd /home/builder \
  && git clone https://github.com/ohmyzsh/ohmyzsh.git .oh-my-zsh

WORKDIR /opt/openwrt

CMD /bin/zsh
