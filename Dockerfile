FROM ubuntu:16.04
MAINTAINER martin@mfoot.com

RUN apt-get update && apt-get install -y emacs \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expects my dotfiles repository to be mounted at /dotfiles
ENV HOME /dotfiles
ENTRYPOINT emacs --batch -l ~/.emacs
