# Script to benchmark speed:
# for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done

zmodload zsh/complist
DISABLE_AUTO_TITLE=true

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey '^k' up-line-or-history
bindkey '^j' down-line-or-history

export GPG_TTY=$(tty)
export DIRSTACKSIZE=8
export HISTSIZE=1000               # number of lines kept in history
export SAVEHIST=1000               # number of lines saved in the history after logout
export HISTFILE=~/.zsh_history     # location of history
setopt inc_append_history          # append command to history file once executed
setopt histignoredups
setopt histreduceblanks
setopt promptsubst                 # enable colors to be displayed
setopt share_history # share hist between sessions

# try to Fuzzy-match
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle ':completion:*:cd:*' ignore-parents parent pwd # cd will never select the parent directory (e.g.: cd ../<TAB>)

zstyle ':completion:*' menu select=2 # Highly selection in menu if nb items > 2
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Ignore case
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'   # Display the type of menu selection
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b' # Convenient error message if can do nothing

setopt autocd               # automatically cd to a directory if not cmd
setopt braceccl             # {a-d} expands to a b c d
setopt always_to_end        # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word     # allow completion from within a word/phrase
setopt autopushd            # automatically pushd directories on dirstack
setopt nopushdsilent        # print dirstack after each cd/pushd
setopt pushdminus           # pushd -N goes to Nth dir in stack
setopt pushdignoredups      # don't push dups on stack
setopt cdablevars           # blah=~/media/movies; cd blah; pwd => ~/media/movies
setopt correct              # try to correct spelling...
setopt no_correctall        # ...only for commands, not filenames
setopt listpacked           # variable col widths (takes up less space)
setopt auto_resume
setopt auto_cd

# Antigen stuff
source /usr/local/share/antigen/antigen.zsh

# antigen bundle zsh-users/zsh-history-substring-search
antigen bundle git
antigen bundle tmuxinator

autoload -Uz colors && colors
source $HOME/.zsh-theme

antigen apply

source $HOME/.aliases
source $HOME/.functions
source $HOME/.asdf/asdf.sh

export PATH=$HOME/Library/Python/3.7/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin::$PATH

export EDITOR=vim

eval "$(direnv hook zsh)"

if [ "$TMUX" = "" ]; then
    tmuxinator default
fi
