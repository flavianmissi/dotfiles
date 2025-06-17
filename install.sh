#!/usr/bin/env bash
set -eu
source ~/dev/dotfiles/environ

os=$(uname)

if [ "${os}" == "Darwin" ]; then
	command -v brew &> /dev/null || { echo >&2 "didn't find brew executable, install it and try again. aborting"; exit 1; }
	brew install fzf
	brew install golang
elif  [ "${os}" == "Linux" ]; then
	command -v dnf &> /dev/null || { echo >&2 "can only run on fedora (didn't find dnf executable). aborting"; exit 1; }
	sudo dnf install -y fzf golang yq

	# make zsh default shell in fedora, this must happen on a fedora CSB
	sudo sss_override user-add $USER -s $(which zsh)
	service sssd restart
else
	echo "unsupported OS ${os}, wants macOS or Fedora. Aborting."
	exit 1
fi

# install oh my zsh
# see https://github.com/ohmyzsh/ohmyzsh/wiki for details
if [ ! -x $(which zsh) ]; then
	command -v zsh >/dev/null 2>&1 || { echo >&2 "zsh is not installed or not in PATH, install it before proceeding. aborting"; exit 1; }
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install antigen, plugin manager for zsh
curl -L git.io/antigen > antigen.zsh
chmod +x antigen.zsh

# copy rc/init files, backing up existing ones
cp ~/.zshrc ~/.zshrc.backup.$(date +"%Y%m%d_%H%M%S") &> /dev/null || true
ln -s "${PWD}/.zshrc" "${HOME}/.zshrc" &> /dev/null || true

cp ~/.gitconfig ~/.gitconfig.backup.$(date +"%Y%m%d_%H%M%S") &> /dev/null || true
ln -s "${PWD}/.gitconfig" "${HOME}/.gitconfig" &> /dev/null || true

mkdir -p ~/.config/nvim
cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup.$(date +"%Y%m%d_%H%M%S") &> /dev/null || true
# do NOT use a symlink! doing so will cause neovim to lag a LOT when saving files.
# ln -s "${PWD}/init.vim" "${HOME}/.config/nvim/init.vim" &> /dev/null || true
cp "${PWD}/init.vim" "${HOME}/.config/nvim/init.vim" &> /dev/null || true

python -m venv "${venv_dir}"
source "${venv_dir}/bin/activate"
pip install -U pip
pip install -r requirements-nvim.txt

# reload config just in case
zsh -ic "omz reload"
