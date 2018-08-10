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

# The user for which ZSH theme should not display name
DEFAULT_USER="moamoak"

# Sett the LC tot french if available
LANG=en_US.utf8
if locale -a | grep -q "fr_FR.utf8"; then
    LC_COMMON="fr_FR.utf8"
else
    LC_COMMON="en_US.utf8"
fi
LC_CTYPE=$LC_COMMON
LC_NUMERIC=$LC_COMMON
LC_TIME=$LC_COMMON
LC_COLLATE=$LC_COMMON
LC_MONETARY=$LC_COMMON
LC_MESSAGES=$LC_COMMON
LC_PAPER=$LC_COMMON
LC_NAME=$LC_COMMON
LC_ADDRESS=$LC_COMMON
LC_TELEPHONE=$LC_COMMON
LC_MEASUREMENT=$LC_COMMON
LC_IDENTIFICATION=$LC_COMMON

export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'


# ALIASES
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Alias for self-updating commands
live () {
    typeset REFRESH_TIME="1s"
    while true; do
        clear
        eval $@
        sleep "$REFRESH_TIME"
    done;
}

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

# Force LXC to change HOME upon attach
alias lxc-attach="lxc-attach --set-var HOME=/root"

# Alias for temporary directories
alias cdtmp="cd $(mktemp -d)"
cptmp () { typeset tmpdir="$(mktemp -d)/"; cp -R $@ "$tmpdir"; echo "$tmpdir" }
mvtmp () { typeset tmpdir="$(mktemp -d)/"; mv $@ "$tmpdir"; echo "$tmpdir" }
bak () {
    while [ "$#" -gt 0 ]; do
        typeset bak_dir="$1.bak"
        typeset counter=0
        while [ -f "$bak_dir" ]; do
            counter=$((counter+1))
            bak_dir="$1.bak_$counter"
        done
        cp -R $1 "$bak_dir"
        shift
    done
}

# Trigger sl for similar mistakes
alias gti="sl"

# MOTD
MOTD_SCRIPT="/no/exist"
#MOTD_SCRIPT="$HOME/dotfiles/utils/motd.sh"
if [ -f $MOTD_SCRIPT ]; then
    source $MOTD_SCRIPT
fi
