#!/bin/bash

cd ~/.vim
git submodule init
git submodule update
git submodule foreach git pull origin master

for s in `git submodule  --quiet foreach 'echo $name'` ; do git config submodule.$s.ignore untracked ; done
if [ -f ~/.vimrc ] ; then mv ~/.vimrc ~/.vimrc_bak ; fi
ln -s ~/.vim/vimrc ~/.vimrc 
if [ -d ~/.oh-my-zsh/ ] ; then rm -fr ~/.oh-my-zsh ; fi
if [ -f ~/.vim/oh-my-zsh/themes/louiswang.zsh-theme ] ; then rm -fr ~/.vim/oh-my-zsh/themes/louiswang.zsh-theme; fi
ln -s ~/.vim/louiswang.zsh-theme ~/.vim/oh-my-zsh/themes/
ln -s ~/.vim/oh-my-zsh/ ~/.oh-my-zsh
if [ -f ~/.zshrc ] ; then mv ~/.zshrc ~/.zhsrc_bak ; fi
ln -s ~/.vim/zshrc ~/.zshrc

