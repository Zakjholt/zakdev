FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y

# Git Install and config
RUN apt-get install -y git
RUN git config --global user.name "Zak"
RUN git config --global user.email "zak.j.holt@gmail.com"
RUN git config --global credential.helper cache

# Prerequisites for other things
RUN apt-get install -y curl
RUN apt-get install -y build-essential cmake
RUN apt-get install -y python-dev python3-dev

# NodeJS & NPM install and config
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

# Vim setup
RUN apt-get install -y vim
COPY .vimrc /root/

# VimPlug install
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN vim +PlugInstall +qall
WORKDIR /root/.vim/plugged/YouCompleteMe/
RUN ./install.py --tern-completer

# Set default git editor to vim
RUN git config --global core.editor vim

# Install and config TMUX
RUN apt-get install -y tmux
COPY .tmux.conf /root/

# Ready to go
RUN mkdir /root/dev
WORKDIR /root/dev

# Ports exposed
EXPOSE 1000-10000
