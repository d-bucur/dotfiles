typeset +H _current_dir="%{$fg_bold[blue]%}%4~%{$reset_color%} "

function _user_host() {
  local me
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USERNAME ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}

# Git prompt settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

PROMPT='
${_current_dir}
%(?,%{%F{white}%},%{%F{red}%})>%{$reset_color%} '

PROMPT2='%{%(!.${fg[red]}.${fg[white]})%}◀%{$reset_color%} '

RPROMPT=' %{$(echotc UP 1)%}$(git_prompt_info) $(_user_host)%{$(echotc DO 1)%}'

