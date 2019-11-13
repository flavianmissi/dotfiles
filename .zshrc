# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Applications/Postgres.app/Contents/Versions/9.6/bin/:/usr/local/opt/node@8/bin:$(go env GOPATH)/bin:$PATH"
alias kwatch='watch kubectl get pods --field-selector=status.phase!=Failed,status.phase!=Succeeded'

# avoid locale related warnings
export LC_ALL=en_US.UTF-8

export EDITOR=nvim

# do not share history
unsetopt share_history

# Path to your oh-my-zsh installation.
export ZSH="/Users/flavia/.oh-my-zsh"

# docker compose postgres stuffs
export PGHOST=localhost
export PGUSER=evard_test

# helm without tiller stuff:
export TILLER_NAMESPACE=tiller
export HELM_HOST=localhost:44134

# use gnumake as make (see brew info make)
# run `brew install make` first!
PATH="/usr/local/opt/make/libexec/gnubin:$PATH"


autoload -U colors && colors

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mh"
#ZSH_THEME="sunrise"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    #git
    brew
    npm
    go
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. `brew --prefix`/etc/profile.d/z.sh
source ~/.oh-my-zsh/zsh-kubectl-prompt/kubectl.zsh
source /usr/local/opt/kube-ps1/share/kube-ps1.sh
RPROMPT=$RPROMPT'$(kube_ps1)'

# google cloud sdk gcloud

source '/Users/flavia/google-cloud-sdk/path.zsh.inc'

# mindoktor/docly specific
source ~/go/src/mindoktor.io/mindoktor/config/mindoktor.bash.inc
source <(kubectl completion zsh)


# custom functions
end_feature_branch() {
    BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
    echo "switching to and pulling 'develop'..."
    git checkout develop
    git pull origin develop
    echo "deleting local '${BRANCH_NAME}'..."
    git branch -D ${BRANCH_NAME}
    echo "done."
}
