vim file

Installation Guide:

git clone https://github.com/wangluyi1982/dotfiles .vim
cd .vim
git submodule init
git submodule update
git submodule foreach git pull origin master
ln -s .vim/vimrc ~/.vimrc
