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
alias bzr=cobzr

parse_hg_branch_with_brackets() {
  hg branch 2> /dev/null | awk '{print "("$1")"}'
}

# go paths
export GOROOT="${HOME}/go"
export GOBIN="${GOROOT}/bin"
export GOPATH="${HOME}/projects/go"
export GOLIBSBIN="${GOPATH}/bin"
PATH="${PATH}:${GOBIN}:${GOLIBSBIN}"
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
    local GIT_PS1='$(__git_ps1)'
    PS1="\[\033[01;34m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[00m\]${PURPLE}[\W]${CYAN}${GIT_PS1}${BLUE}\$${WHITE} "
}
prompt

source ~/git-completion.bash

export VIRTUALENVWRAPPER_PYTHON=`which python2.7`
source `which virtualenvwrapper.sh`

# tsuru client completion
# source $GOPATH/src/github.com/globocom/tsuru/misc/bash-completion.d/tsuru
# crane client completion
# source $GOPATH/src/github.com/globocom/tsuru/misc/bash-completion.d/crane

# login stuff
# source $HOME/.login_stuff

# tsuru project specific
function cd_tsuru {
    cd $GOPATH/src/github.com/globocom/tsuru
}

# amazon ec2 creds (labs)
export EC2_ACCESS_KEY=[filtered]
export EC2_SECRET_KEY=[filtered]
export EC2_URL=ec2.us-east-1.amazonaws.com

# orquestra creds
# EC2_SECRET_KEY=[filtered]
# EC2_URL=[filtered]
# EC2_ACCESS_KEY=[filtered]

# amazon auto scaling client conf
export AWS_AUTO_SCALING_HOME=~/AutoScaling-1.0.61.2
export PATH="${PATH}:${AWS_AUTO_SCALING_HOME}/bin"
export AWS_CREDENTIAL_FILE=${AWS_AUTO_SCALING_HOME}/credentials
export JAVA_HOME=/opt/java/64/jre1.7.0_07

# amazon ELB stuff
export AWS_ELB_HOME=~/ElasticLoadBalancing-1.0.17.0
export PATH="${PATH}:${AWS_ELB_HOME}/bin"

# amazon CloudWatch stuff
export AWS_CLOUDWATCH_HOME=~/CloudWatch-1.0.13.4
export PATH="${PATH}:${AWS_CLOUDWATCH_HOME}/bin"
export AWS_CREDENTIAL_FILE=${AWS_CLOUDWATCH_HOME}/credential-file-path

# goamz testing login
export AWS_ACCESS_KEY_ID=[filtered]
export AWS_SECRET_ACCESS_KEY=[filtered]
