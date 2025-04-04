# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="louiswang"
setopt NO_SHARE_HISTORY
setopt APPEND_HISTORY

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="/home/louis/sources/pydev/bin:/home/louis/.rvm/gems/ruby-1.9.3-p429/bin:/home/louis/.rvm/gems/ruby-1.9.3-p429@global/bin:/home/louis/.rvm/rubies/ruby-1.9.3-p429/bin:/home/louis/.rvm/bin:/opt/smcl-package-scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/louis/android-sdks/platform-tools"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias open="xdg-open"
setopt +o nomatch

command_exists () {
  command "$1" &> /dev/null ;
}

if [ -d "$HOME/.nvm" ] 
then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion`
fi

if [ -d "/usr/local/opt/ruby/" ] 
then
    export PATH="/usr/local/opt/ruby/bin:$PATH"
    export CPPFLAGS="-I/usr/local/opt/ruby/include"
    export LDFLAGS="-L/usr/local/opt/ruby/lib"
    export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
fi

if [ -f "/home/louis/.local/share/bob/v0.10.3/bin/nvim" ] 
then 
    alias vi='nvim'
    alias vim='nvim'
fi

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/linuxbrew/.linuxbrew/Cellar/gcc@11/11.5.0/lib/gcc/11
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/gcc/x86_64-redhat-linux/14/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/louis/anaconda3/include/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/louis/sources/test_cutlass/bundle/cutlass/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/louis/sources/test_cutlass/bundle/cutlass/tools
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/louis/sources/rooagi/accel/include/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/louis/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/louis/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/louis/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/louis/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export TERM=xterm-256color
export PATH=$HOME/data/android_sdk/cmdline-tools/bin:$PATH
export PATH=$HOME/data/android-studio/bin:$PATH
export PATH=/usr/lib64/openmpi/bin/:$PATH
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export LC_CTYPE=en_US.UTF-8
export PATH=/home/louis/.local/share/bob/v0.10.3/bin/:$PATH
export PATH=/usr/local/cuda/bin/:$PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export JAVA_HOME=/usr/lib/jvm/java-21-zulu-openjdk-ca/
export PATH=$JAVA_HOME/bin:$PATH
alias nvcci='/usr/local/cuda/bin/nvcc -ccbin=/home/linuxbrew/.linuxbrew/bin/g++-11  -O3 -std=c++17 -ftemplate-backtrace-limit=0 -arch sm_89 -uumn --expt-extended-lambda --expt-relaxed-constexpr --use_fast_math -Xptxas -v --compiler-options "-O3 -std=c++17 -ftemplate-backtrace-limit=0 -Wall -Wno-unused-local-typedefs -Wno-strict-aliasing -Wno-unused-function -Wno-format-security -Wno-unknown-pragmas -Wno-psabi" -I. -I/usr/local/cuda/include -I/home/louis/sources/test_cutlass/bundle/cutlass/include -I/home/louis/sources/test_cutlass/bundle/cutlass/tools/util/include -I/home/louis/sources/test_cutlass/bundle/cutlass/test -I/home/louis/sources/test_cutlass/bundle/cutlass/examples ' 
