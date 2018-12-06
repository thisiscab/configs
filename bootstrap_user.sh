#!/bin/bash

function setUp() {
    setShell

    setAsdfVersionManager
    setGem

    setPythonLibrary
    installCargo
    setAlacritty

    setDotFiles
}

function setShell() {
    case "$SHELL" in
    */zsh)
        if [ "$(command -v zsh)" != '/user/local/bin/zsh' ] ; then
        update_shell
        fi
        ;;
    *)
        update_shell
        ;;
    esac
}

function setPythonLibrary() {
    pip3 install --user --upgrade awscli
}

function setAsdfVersionManager() {
    fancy_echo "Configuring asdf version manager..."
    if [ ! -d "$HOME/.asdf" ]; then
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.0
    fi

    source "$HOME/.asdf/asdf.sh"
    install_asdf_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git"
    install_asdf_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"

    fancy_echo "Installing latest Ruby..."
    install_asdf_language "ruby"
    gem update --system

    fancy_echo "Installing latest Node..."
    bash "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring"
    install_asdf_language "nodejs"
}

function setGem() {
    gem_install_or_update 'bundler'
    number_of_cores=$(sysctl -n hw.ncpu)
    bundle config --global jobs $((number_of_cores - 1))

    gem_install_or_update 'tmuxinator'
}

function setAlacritty() {
    if [ ! -d "$HOME/src/alacritty" ]; then
	fancy_echo "Configuring alacritty"
        git clone https://github.com/jwilm/alacritty.git ~/src/alacritty
        make -C ~/src/alacritty app
        cp -r ~/src/alacritty/target/release/osx/Alacritty.app ~/Applications/
    fi
}

function installCargo() {
    if ! command -v cargo >/dev/null; then
        fancy_echo "Installing Cargo ..."
        curl https://sh.rustup.rs -sSf | sh
    fi
    source $HOME/.cargo/env
}

# Shell stuff

update_shell() {
  chsh -s "/bin/zsh" "$USER"
}

function setDotFiles() {
    fancy_echo "Configuring dotfiles..."

    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	linkFiles
	configureVim
        configureMac
    fi;
}

function linkFiles () {
  fancy_echo 'Linking all the dotfiles'

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '.*' -not -path '*.git')
  do
    dst="$HOME/$(basename "${src}")"
    linkFile "$src" "$dst"
  done
}

function configureMac() {
    sh ~/.macos_user
}

function configureVim() {
    if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    vim +PluginInstall +qall
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

        fancy_echo "File already exists: "$src"), what do you want to do?\n\
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
      fancy_echo "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      fancy_echo "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      fancy_echo "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    fancy_echo "linked $1 to $2"
  fi
}


# Prints

function fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@" $1
}

# Ruby stuff

function gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"
  else
    gem install --user-install "$@"
  fi
}

# Asdf stuff

install_asdf_plugin() {
  local name="$1"
  local url="$2"

  if ! asdf plugin-list | grep -Fq "$name"; then
    asdf plugin-add "$name" "$url"
  fi
}

install_asdf_language() {
  local language="$1"
  local version
  version="$(asdf list-all "$language" | grep -v "[a-z]" | tail -1)"

  if ! asdf list "$language" | grep -Fq "$version"; then
    asdf install "$language" "$version"
    asdf global "$language" "$version"
  fi
}

DOTFILES_ROOT=$(pwd -P)

set -e

setUp
