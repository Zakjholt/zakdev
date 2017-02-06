FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y

# Git Install and config
RUN apt-get install -y git
RUN git config --global user.name "Zak"
RUN git config --global user.email "zak.j.holt@gmail.com"
RUN git config --global credential.helper cache

# Need curl for node and vimplug installs
RUN apt-get install -y curl

# Vim setup
RUN apt-get install -y vim

# VimPlug install
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY .vimrc /root/

# NodeJS & NPM install and config
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

# Set default git editor to vim
RUN git config --global core.editor vim

# Ready to go
RUN mkdir /root/dev
WORKDIR /root/dev

# 8080 and 9090 ports exposed for server and database stuff
EXPOSE 3000-10000
