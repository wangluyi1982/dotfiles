" ==========================================================
" Plugins included
" ==========================================================

" Switching from pathogen to vim-plug.
" This will load and install vim-plug if it isn't already installed.
" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/bundle')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter',{'do':'TSUpdate'}
"Plug 'nvim-treesitter/playground'
"Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
"Plug 'hrsh7th/nvim-compe'
Plug 'rust-lang/rust.vim'
"Plug 'xolox/vim-misc'
Plug 'folke/tokyonight.nvim'
"Plug 'navarasu/onedark.nvim'
Plug 'EdenEast/nightfox.nvim'
"Plug 'moll/vim-bbye'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'vim-syntastic/syntastic'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'folke/trouble.nvim'
Plug 'lkemitchll/vim-kitty-runner'
Plug 'vim-test/vim-test'
Plug 'APZelos/blamer.nvim'
""lsp configuration
Plug 'williamboman/mason.nvim',  { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'hedyhli/outline.nvim'
call plug#end()

set encoding=utf-8
set hidden
set cmdheight=2
set updatetime=300

" map leader from \ to ,
"
let mapleader = ','


" Toggle the tasklist
map <leader>td <Plug>TaskList

" Airline Setting
                                                                                                                                          
"TABLINE:                                                                                                                                 
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type= 1     " disables the weird ornage arrow on the tabline

" ############# KEYBINDING################
" split control

nnoremap vs :vs<CR>
nnoremap sp :sp<CR> 
nnoremap on :on<CR>

" Tab navigation 
nnoremap th :bprev<CR>
nnoremap tj :bnext<CR>

" Remap Esc 
inoremap jj <ESC>

" Buffer "
nnoremap c :Bp\|Bd #<CR>
"
" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


" Close Buffer
nnoremap c :bp\|bd #<CR>
" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>



"##############PLUG IN  SETTING#####################
"
" Open NerdTree
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeMapOpenInTab='\r'
let g:NERDTreeChDirMode=2

" Quit NerdTree if it is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Rust Binding
let g:rust_cargo_use_clippy = 1
let g:rustfmt_autosave = 1

" ==========================================================
" Basic Settings
" ==========================================================
syntax enable                 "syntax enable
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set nofoldenable
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 spacAe) while possible

set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
" set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack
" showing the line break and blank space
set nolist 

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set textwidth=80
set colorcolumn=-1

" don't outdent hashes
inoremap # #


"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
" set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
"set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex


" Paste from clipboard
set clipboard+=unnamedplus
nnoremap <leader>p "+p<CR>
nnoremap <leader>y "+y<CR>
" Quit window on <leader>q
nnoremap <leader>q :q<CR>

nnoremap <silent> <F2> :make b<CR>
nnoremap <silent> <F4> :TestNearest -- --nocapture<CR>
nnoremap <silent> <F2> :make r<CR>
nnoremap <silent> <F3> :make t -- --nocapture<CR>
nnoremap <silent> <F8> :!CRITERION_DEBUG=1 cargo bench<CR>
nnoremap <silent> <F10> :make c<CR>


" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Use tab to scroll through autocomplete menus
autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"

let g:acp_completeoptPreview=1


"" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif



" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <Leader>pp <cmd>lua require'telescope.builtin'.grep_string{"<cword>"}<cr>

set guifont=Monaco:h20
let g:onedark_config = {
  \ 'style': 'warm',
  \ 'toggle_style_key': '<leader>ts',
  \ 'ending_tildes': v:false,
  \ 'diagnostics': {
    \ 'darker': v:false,
    \ 'background': v:false,
  \ },
\ }
"colorscheme onedark
colorscheme tokyonight
" Example config in VimScript
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }
let test#strategy = "kitty"

let NERDTreeShowHidden=1
let g:blamer_enabled = 1
runtime macros/matchit.vim
let g:asyncrun_open = 6

noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>

"OSC Yank
nmap <leader>y <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>cy <Plug>OSCYankVisual

"ClangFORMAT
if has('python')
  map <C-K> :pyf /home/louis/.config/nvim/clang-format.py<cr>
  imap <C-K> <c-o>:pyf /home/louis/.config/nvim/clang-format.py<cr>
elseif has('python3')
  map <C-K> :py3f /home/louis/.config/nvim/clang-format.py<cr>
  imap <C-K> <c-o>:py3f /home/louis/.config/nvim/clang-format.py<cr>
endif
function! Formatonsave()
  let l:formatdiff = 1
  execute "py3f /home/louis/.config/nvim/clang-format.py"
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

" change the current window width
map <c-,> :vertical resize +10
map <c-.> :vertical resize -10
set formatoptions+=r
