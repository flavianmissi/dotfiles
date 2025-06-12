#!/usr/bin/env bash

# install oh my zsh
# see https://github.com/ohmyzsh/ohmyzsh/wiki for details
command -v zsh >/dev/null 2>&1 || { echo >&2 "zsh is not installed or not in PATH, install it before proceeding. aborting"; exit 1; }
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install antigen
curl -L git.io/antigen > antigen.zsh
chmod +x antigen.zsh

# copy rc/init files, backing up existing ones
cp ~/.zshrc ~/.zshrc.backup.$(date +"%Y%m%d_%H%M%S") 2>&/dev/null || true
cp .zshrc ~/.zshrc

cp ~/.gitconfig ~/.gitconfig.backup.$(date +"%Y%m%d_%H%M%S") 2>&/dev/null || true
cp .gitconfig ~/.gitconfig

mkdir -p ~/.config/nvim
cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup.$(date +"%Y%m%d_%H%M%S") 2>&/dev/null || true
cp init.vim ~/.config/nvim/init.vim

python -m venv "${venv_dir}"
source "${venv_dir}/bin/activate"
pip install -U pip
pip install -r requirements-nvim.txt

if [ "{$OS_TYPE}" == "darwin" ]; then
	command -v brew >/dev/null 2>&1 || { echo >&2 "didn't find brew executable, install it and try again. aborting"; exit 1; }
	brew install fzf
	brew install golang
elif  [ "{$OS_TYPE}" == "linux-gnu" ]; then
	command -v dnf >/dev/null 2>&1 || { echo >&2 "can only run on fedora (didn't find dnf executable). aborting"; exit 1; }
	sudo dnf install -y fzf golang
else
	echo "unsupported OS ${OS_TYPE}. aborting."
	exit 1
fi
