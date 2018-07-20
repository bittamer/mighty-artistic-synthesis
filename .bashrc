# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR=vim
export VISUAL=vim

export work="/home/hubbi/Documents/Work"
export itb=$work"/ITB"
export res="/home/hubbi/Documents/Postgraduate/Research"
export alfa=$work"/AlfaLC"
export GPGKEY=A62014E0616D71ECACD762F38AF2E1186BB1D4C9
export DIGITALOCEAN_TOKEN=62329ce9e4d6e751f86c9e50c4336e11cca6113be76821c51f186ec44da00a84

source ~/.bin/myaliases
source ~/.bin/myfunctions
source ~/.bin/mysoftwares

#color_reset='\[\e[m\]'
#color_brackets='\[\e[1;38;5;015m\]' #white
#color_user='\[\e[1;38;5;010m\]' #green
#color_host='\[\e[1;38;5;005m\]' #purple
#color_wd='\[\e[1;38;5;222m\]' #yellow
#PS1=$color_brackets'['$color_reset''$color_user'\u'$color_reset''$color_brackets']['$color_reset''$color_host'\h'$color_reset''$color_brackets']'$color_reset''$color_wd' \w \$ '$color_reset

color_reset='\[\e[m\]'
color_brackets='\[\e[1;48;5;214;38;5;015m\]' # white bold on orange
color_user='\[\e[1;48;5;010;38;5;015m\]' # white on green
color_host='\[\e[1;48;5;214;38;5;105m\]' # blue on orange
color_wd='\[\e[1;48;5;105;38;5;222m\]' # yellow on blue
PS1=$color_user' \u '$color_reset''$color_brackets' ['$color_reset''$color_host'\h'$color_reset''$color_brackets'] '$color_reset''$color_wd' \w > '$color_reset' '
