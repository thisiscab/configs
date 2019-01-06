#!/bin/sh

function setUp() {
    setBrewFormulae
    setCask
    configureMac
}

function setBrewFormulae() {
    fancy_echo "Updating Homebrew formulae ..."
    brew update --force # https://github.com/Homebrew/brew/issues/1151
    brew bundle --file=- <<EOF
    tap "heroku/brew"

    # Unix
    brew "git"
    brew "openssl"
    brew "reattach-to-user-namespace"
    brew "the_silver_searcher"
    brew "tmux"
    brew "zsh"
    brew "macvim", args: ['with-python3']
    brew "antigen"

    # Heroku
    brew "heroku"

    # GitHub
    brew "hub"

    # Python
    brew "python3"

    # Other
    brew "libyaml" # should come after openssl

    # Managements
    brew "direnv"

    # GPG stuff
    brew "gpg2"

    # Databases
    brew "postgres", restart_service: :changed
EOF

    fancy_echo "Update heroku binary..."
    brew unlink heroku
    brew link --force heroku
}

function setCask() {
    if brew list | grep -Fq brew-cask; then
        fancy_echo "Uninstalling old Homebrew-Cask ..."
        brew uninstall --force brew-cask
    fi

    brew update --force # https://github.com/Homebrew/brew/issues/1151
    brew bundle --file=- <<EOF
    tap "caskroom/cask"

    cask "alfred"
    cask "datagrip"
    cask "1password"
    cask "vlc"
    cask "google-chrome"
    cask "slack"
    cask "spectacle"
    cask "spotify"
    cask "google-backup-and-sync"
    cask "docker"
    cask "cloudapp"
    cask "alacritty"
EOF
}

function configureMac() {
    sh ~/src/configs/dotfiles/.macos_sudo
}

HOMEBREW_PREFIX="/usr/local"

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

if [ ! -d "$HOME/.bin/" ]; then
  mkdir "$HOME/.bin"
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

if ! command -v brew >/dev/null; then
    fancy_echo "Installing Homebrew ..."
    curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

setUp
