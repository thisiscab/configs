# ############################## #
#       Generic Aliases
# ############################## #

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

# ############################## #
#       Cygwin Aliases
# ############################## #

# if [[ "$OSTYPE" == "cygwin" ]]; then
# fi

# ############################## #
#       MacOS Aliases
# ############################## #


if [[ "$OSTYPE" == "darwin"* ]]; then
    DISABLE_AUTO_TITLE=true
    plugins=(git golang gibo brew npm rails rake ruby bundler tmux tmuxinator fasd)

    # gibo usage: gibo Python TextMate >> .gitignore

    export PATH="$HOME/.bin:$PATH"
    export PATH="$HOME/.rbenv/bin:$PATH"
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

    export MYVIMRC='~/.vimrc'
    export EDITOR='mvim -fv'
    export VISUAL='mvim -fv'
    export GOPATH=$HOME/Documents/Projects/go

    export PATH=/usr/local/bin:$PATH
    export PATH=/usr/local/sbin:$PATH
    export PATH=$HOME/.node/bin:$PATH
    export PATH=$HOME/dotfiles/bin:$PATH
    export PATH=$GOPATH/bin:$PATH
    export PATH=$HOME/Library/Haskell/bin:$PATH
    export PATH="$HOME/.phantomenv/bin:$PATH"

    ## startup virtualenv-burrito
    if [ -f $HOME/.venvburrito/startup.sh ]; then
        . $HOME/.venvburrito/startup.sh
    fi

    ## startup rbenv
    eval "$(rbenv init -)"

    ## startup direnv
    eval "$(direnv hook zsh)"

    # eval "$(phantomenv init -)"
fi

# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

# source $ZSH/oh-my-zsh.sh
# source $ZSH/plugins/fasd/fasd.plugin.zsh

source $HOME/.aliases
source $HOME/.functions
#
# Antigen stuff
source $HOME/src/antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv
antigen bundle git
antigen bundle pip
antigen bundle pip
antigen bundle clvv/fasd fasd
# antigen theme arrow
antigen apply


# How to correctly install npm on Mac OS
# https://gist.github.com/DanHerbert/9520689
