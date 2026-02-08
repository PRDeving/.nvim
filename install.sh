#!/bin/sh
set -eu

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing dependency: $1"
    exit 1
  }
}

need_cmd git
need_cmd uname

OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS" in
  Linux)
    need_cmd sudo
    need_cmd apt
    need_cmd curl
	BIN=nvim-linux-$ARCH.appimage
    curl -LO https://github.com/neovim/neovim/releases/latest/download/$BIN
    chmod +x $BIN
    sudo mv $BIN /usr/bin/vim
    ;;
  Darwin)
    need_cmd brew
    brew update
    brew install neovim
    ;;
  *)
    echo "Unsupported system: $OS"
    exit 1
    ;;
esac
need_cmd vim

rm -rf $HOME/.config/nvim $HOME/.vim $HOME/.vimrc
git clone https://github.com/PRDeving/.nvim.git $HOME/.config/nvim

vim --headless "+Lazy! sync" +qa
echo "READY!!!"

