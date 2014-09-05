#!/bin/bash

cd ~/.vim
git submodule init
git submodule update
git submodule foreach git pull origin master

for s in `git submodule  --quiet foreach 'echo $name'` ; do git config submodule.$s.ignore untracked ; done
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/louiswang.zsh-theme ~/.vim/oh-my-zsh/themes/
ln -s ~/.vim/oh-my-zsh/ ~/.oh-my-zsh
ln -s ~/.vim/zshrc ~/.zshrc

