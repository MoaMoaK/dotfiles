# vim:ft=zsh ts=2 sw=2 sts=2

virtualenv_info() {
  if [[ $VIRTUAL_ENV ]]; then
    print -n "%{$fg_bold[red]%}($(basename $VIRTUAL_ENV))%{$reset_color%}"
  fi
}

context_info() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" ]]; then
    print -n "%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})$user%{$reset_color%}"
  fi
  if [[ -n "$container" ]]; then
    print -n "@%{$fg_bold[yellow]%}lxc(%m)%{$reset_color%}"
  elif [[ -n "$SSH_CONNECTION" ]]; then
    print -n "@%{$fg_bold[yellow]%}%m%{$reset_color%}"
  fi
}

path_info() {
  if [[ -w "${PWD}" ]]; then
    print -n "%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}"
  else
    print -n "%{$fg_bold[red]%}${PWD/#$HOME/~}%{$reset_color%}"
  fi
}

time_info() {
  print -n "%{$fg_bold[yellow]%}[%*]%{$reset_color%}"
}

execcode_info() {
  print -n "%(?..%{$fg_bold[red]%}(%?%)%{$reset_color%})"
}


PROMPT='
$(context_info)%{$fg_bold[blue]%}➤ %{$reset_color%}$(path_info)$(git_prompt_info) $(time_info) $(execcode_info)
%(!.%{$fg_bold[red]%}#%{$reset_color%}.%{$fg_bold[green]%}$%{$reset_color%}) '

# Git decoration based on OMZ base git functions.
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}<%{$reset_color%}$(git_prompt_remote)%{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"
ZSH_THEME_GIT_PROMPT_REMOTE_EXISTS="%{$fg[green]%}\uE0A0%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_REMOTE_MISSING="%{$fg[red]%}\uE0A0%{$reset_color%}"

# Deactivate default virtualenv prompt
VIRTUAL_ENV_DISABLE_PROMPT=True

if type "virtualenv_prompt_info" > /dev/null; then
  RPROMPT='$(virtualenv_info)'
fi
