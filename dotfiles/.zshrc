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
    # eval "$(phantomenv init -)"
fi

# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

# source $ZSH/oh-my-zsh.sh
# source $ZSH/plugins/fasd/fasd.plugin.zsh

source $HOME/.aliases
source $HOME/.functions

# How to correctly install npm on Mac OS
# https://gist.github.com/DanHerbert/9520689
eval "$(rbenv init -)"
