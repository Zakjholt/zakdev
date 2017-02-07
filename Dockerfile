FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y \
            apt-utils \
            git \
            curl \
            build-essential \
            cmake \
            python-dev \
            python3-dev \
            vim \
            tmux

# Git config
RUN git config --global user.name "Zak"
RUN git config --global user.email "zak.j.holt@gmail.com"
RUN git config --global credential.helper cache
RUN git config --global core.editor vim

# Node Install and setup
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

# VIM setup
COPY .vimrc /root/
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN vim +PlugInstall +qall
WORKDIR /root/.vim/plugged/YouCompleteMe/
RUN ./install.py --tern-completer

# tmux config
COPY .tmux.conf /root/

#directory setup
RUN mkdir /root/dev
WORKDIR /root/dev

# Ports exposed
EXPOSE 1000-10000
