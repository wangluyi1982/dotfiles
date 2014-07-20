# Vim dot file

## Installation Guide:
```
git clone https://github.com/wangluyi1982/dotfiles .vim

cd .vim
git submodule init
git submodule update
git submodule foreach git pull origin master (optional)

for s in `git submodule  --quiet foreach 'echo $name'` ; do git config submodule.$s.ignore untracked ; done
ln -s .vim/vimrc ~/.vimrc
```
