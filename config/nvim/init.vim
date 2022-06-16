set runtimepath^=~/.vim runtimepath+=~/.vim/after
set runtimepath^=~/.vim/lua
let &packpath = &runtimepath
source ~/.vimrc
lua require('init')
