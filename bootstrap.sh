#!/usr/bin/env sh

function setUp() {
    setShell

    setDotFiles

    setRuby
    setBrew
    setGem
    setCask
}

function setShell() {
    case "$SHELL" in
    */zsh)
        if [ "$(which zsh)" != '/bin/zsh' ] ; then
        update_shell
        fi
        ;;
    *)
        update_shell
        ;;
    esac
}

function setRuby() {
    find_latest_ruby() {
        rbenv install -l | grep -v - | tail -1 | sed -e 's/^ *//'
    }

    ruby_version="$(find_latest_ruby)"
    eval "$(rbenv init -)"

    if ! rbenv versions | grep -Fq "$ruby_version"; then
        RUBY_CONFIGURE_OPTS=--with-openssl-dir=/usr/local/opt/openssl rbenv install -s "$ruby_version"
    fi

    rbenv global "$ruby_version"
    rbenv shell "$ruby_version"
    gem update --system
}

function setBrew() {
    fancy_echo "Updating Homebrew formulae ..."
    brew update
    brew bundle --file=- <<EOF
    tap "thoughtbot/formulae"
    tap "homebrew/services"

    # Unix
    brew "ctags"
    brew "git"
    brew "openssl"
    brew "reattach-to-user-namespace"
    brew "the_silver_searcher"
    brew "tmux"
    brew "vim"
    brew "zsh"

    # Heroku
    brew "heroku-toolbelt"
    brew "parity"

    # GitHub
    brew "hub"

    # Image manipulation
    brew "imagemagick"

    # Testing
    brew "qt"

    # Programming languages
    brew "libyaml" # should come after openssl
    brew "node"
    brew "rbenv"
    brew "ruby-build"

    # Databases
    brew "postgres", restart_service: true
    brew "redis", restart_service: true
EOF
}

function setCask() {
    if brew list | grep -Fq brew-cask; then
        fancy_echo "Uninstalling old Homebrew-Cask ..."
        brew uninstall --force brew-cask
    fi

    brew cask install alfred
    brew cask install vlc
    brew cask install google-chrome
    brew cask install slack
    brew cask install spectacle
    brew cask install iterm2
    brew cask install macvim
    brew cask install spotify
    brew cask install screenhero 
    brew cask install cloud # cloudApp 
    brew cask install navicat-for-postgresql
    brew cask install virtualbox
    brew cask install karabiner
}

function setGem() {
    gem_install_or_update 'bundler'
    number_of_cores=$(sysctl -n hw.ncpu)
    bundle config --global jobs $((number_of_cores - 1))

    gem_install_or_update 'tmuxinator'
}

# Shell stuff

update_shell() {
  local shell_path;
  shell_path="$(which zsh)"

  fancy_echo "Changing your shell to zsh ..."
  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    fancy_echo "Adding '$shell_path' to /etc/shells"
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  chsh -s "$shell_path"
}

function setDotFiles() {
    if [ "$1" == "--force" -o "$1" == "-f" ]; then
            doIt;
    else
            read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
            echo "";
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                linkFiles
                configureVim
                configureMac
            fi;
    fi;
    unset doIt;
}

function linkFiles () {
  info 'Linking all the dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '.*' -not -path '*.git')
  do
    dst="$HOME/$(basename "${src}")"
    linkFile "$src" "$dst"
  done
}

function configureMac() {
    sh ~/.macos
}

function configureVim() {
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall
        cd  ~/.vim/bundle/YouCompleteMe
        ./install.sh
}

# Helpers

function linkFile () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}


# Prints

function fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

function info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

function user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

function success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

function fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# Brew stuff

function brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

function brew_is_installed() {
  local name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

function brew_is_upgradable() {
  local name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$name" >/dev/null
}

function brew_tap() {
  brew tap "$1" 2> /dev/null
}

function brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

function brew_launchctl_restart() {
  local name="$(brew_expand_alias "$1")"
  local domain="homebrew.mxcl.$name"
  local plist="$domain.plist"

  fancy_echo "Restarting %s ..." "$1"
  mkdir -p "$HOME/Library/LaunchAgents"
  ln -sfv "/usr/local/opt/$name/$plist" "$HOME/Library/LaunchAgents"

  if launchctl list | grep -Fq "$domain"; then
    launchctl unload "$HOME/Library/LaunchAgents/$plist" >/dev/null
  fi
  launchctl load "$HOME/Library/LaunchAgents/$plist" >/dev/null
}

# Ruby stuff

function gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"
  else
    gem install "$@"
    rbenv rehash
  fi
}

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

git pull origin master;

HOMEBREW_PREFIX="/usr/local"
DOTFILES_ROOT=$(pwd -P)

if ! command -v brew >/dev/null; then
    fancy_echo "Installing Homebrew ..."
    curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

if [ -d "$HOMEBREW_PREFIX" ]; then
  if ! [ -r "$HOMEBREW_PREFIX" ]; then
    sudo chown -R "$LOGNAME:admin" /usr/local
  fi
else
  sudo mkdir "$HOMEBREW_PREFIX"
  sudo chflags norestricted "$HOMEBREW_PREFIX"
  sudo chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
fi

cd "$(dirname "$0")/.."
set -e

setUp
