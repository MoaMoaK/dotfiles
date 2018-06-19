# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/games:/usr/local/games

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autopep8
  command-not-found
  common-aliases
  compleat
  django
  gitfast
  pep8
  pylint
  python
  screen
)

# Disable check of insecure directories to be able to perform sudo -Es
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration

DEFAULT_USER="moamoak"

export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'


# ALIASES
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Alias for gloga without pager
alias gloganop="git --no-pager log --oneline --graph --all --decorate --max-count=$(($(tput lines)-15))"

# Alias for sudo with preserv env
alias sudo="sudo -Es"

# Alias for controlling OpenVPN
ovpn () {
    typeset OVPN_DIR="/etc/openvpn/client/"
    if [ -f "$OVPN_DIR$1/$1.ovpn" ]; then
        sudo openvpn "$OVPN_DIR$1/$1.ovpn"
    else
        echo "$1 is not an available VPN in $OVPN_DIR"
    fi
}
alias ovpnstop="sudo killall -SIGTERM openvpn"
alias ovpnrestart="sudo killall -SIGHUP openvpn"


# MOTD
MOTD_SCRIPT="/no/exist"
#MOTD_SCRIPT="$HOME/dotfiles/utils/motd.sh"
if [ -f $MOTD_SCRIPT ]; then
    source $MOTD_SCRIPT
fi
