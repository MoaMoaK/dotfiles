# vim:ft=zsh ts=2 sw=2 sts=2

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
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
else
  if [ -e ~/.rvm/bin/rvm-prompt ]; then
    RPROMPT='%{$fg_bold[red]%}‹$(rvm_current)›%{$reset_color%}'
  else
    if which rbenv &> /dev/null; then
      RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
    fi
  fi
fi