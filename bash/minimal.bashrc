# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#history options
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
shopt -s histappend

#update LINES and COLUMNS if windwo size change
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# add bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#enable bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#bash colors
reset="\[\033[0m\]"
black="\[\033[1;30m\]"
red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
blue="\[\033[1;34m\]"
cyan="\[\033[0;36m\]"

#PS1 customization
PS1="\n$blue┌─────($red\u$blue)─────($green\w$blue)\n└>$cyan\$$reset"

#vim mode
set -o vi
bind '"jk":vi-movement-mode'

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#2 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
