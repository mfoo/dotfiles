FROM ubuntu:16.04
MAINTAINER martin@mfoot.com

RUN apt-get update \
      && DEBIAN_FRONTENT=noninteractive apt-get upgrade -y \
      && DEBIAN_FRONTEND=noninteractive apt-get install -y \
           build-essential curl \
      && DEBIAN_FRONTEND=noninteractive apt-get build-dep -y emacs24 \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
      && curl http://ftp.gnu.org/gnu/emacs/emacs-25.1.tar.gz | tar xz \
      && cd emacs-25.1 \
      && ./configure && make -j4 && make install

# Expects my dotfiles repository to be mounted at /dotfiles
ENV HOME /dotfiles
ENTRYPOINT emacs --batch -l ~/.emacs