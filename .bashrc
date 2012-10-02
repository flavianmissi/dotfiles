# Make bash check its window size after a process completes
shopt -s checkwinsize

# LS COLORS
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# ENVIRONMENT

# GREP
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;37'
alias grep='grep --color=auto' # Always highlight grep search term

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

parse_git_branch_with_brackets() {
  typeset current_branch=$(parse_git_branch)
  if [ "$current_branch" != "" ]
  then
      echo "($current_branch)"
  fi
}

parse_hg_branch_with_brackets() {
  hg branch 2> /dev/null | awk '{print "("$1")"}'
}

# go paths
export GOROOT="${HOME}/go"
export GOBIN="${GOROOT}/bin"
export GOPATH="${HOME}/projects/go"
export GOLIBSBIN="${GOPATH}/bin"
PATH="${PATH}:${GOBIN}:${GOLIBSBIN}:${GETTEXT}"
PATH="/usr/local/sbin:${PATH}"

export PATH

# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# Everything else is green...
# 0 - Normal
# 1 - Bold
# 2 - 
function prompt {
	local BLACK="\[\033[0;30m\]"
	local RED="\[\033[0;31m\]"
	local GREEN="\[\033[0;32m\]"
	local YELLOW="\[\033[0;33m\]"
	local BLUE="\[\033[0;34m\]"
	local PURPLE="\[\033[0;35m\]"
	local CYAN="\[\033[0;36m\]"
	local WHITE="\[\033[0;37m\]"
	local WHITEBOLD="\[\033[1;37m\]"
	export PS1="\[\033[01;34m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[00m\]${PURPLE}[\W]${CYAN}$(parse_git_branch_with_brackets)${BLUE}\$${WHITE} "
}
prompt

export PYTHONPATH=$HOME/projects/publicacao-core/publicacao:$HOME/projects/dynamo:$HOME/lib/python:$PYTHONPATH

source ~/git-completion.bash

export VIRTUALENVWRAPPER_PYTHON=`which python2.7`
source `which virtualenvwrapper.sh`
