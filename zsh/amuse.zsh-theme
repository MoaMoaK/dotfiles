# vim:ft=zsh ts=2 sw=2 sts=2

virtualenv_info() {
  if [[ $VIRTUAL_ENV ]]; then
    echo "%{$fg_bold[red]%}($(basename $VIRTUAL_ENV))%{$reset_color%}"
  fi
}

}

}

PROMPT='
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) ⌚ %{$fg_bold[red]%}%*%{$reset_color%}
%(!.%{$fg_bold[red]%}#%{$reset_color%}.%{$fg_bold[green]%}$%{$reset_color%}) '

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Deactivate default virtualenv prompt
VIRTUAL_ENV_DISABLE_PROMPT=True

if type "virtualenv_prompt_info" > /dev/null; then
  RPROMPT='%{$fg_bold[red]%}$(virtualenv_info)%{$reset_color%}'
fi
