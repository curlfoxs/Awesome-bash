#!/bin/bash
# .bashrc

##
# Helper function
##
function parse_git_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

function pclip() {
    pbcopy $@
}

function h() {
    if [ -z "$1" ]; then
        history | sed '1!G;h;$!d' | percol | sed -n 's/^ *[0-9][0-9]* *\(.*\)$/\1/p'| tr -d '\n' | pclip
    else
        history | grep "$1" | sed '1!G;h;$!d' | percol | sed -n 's/^ *[0-9][0-9]* *\(.*\)$/\1/p'| tr -d '\n' | pclip
    fi
}
##
# Global variable
##
export HISTSIZE=32768

##
# Custom color
##
#enables colorin the terminal bash shell export
export CLICOLOR=1
#setsup thecolor scheme for list export
export LSCOLORS=gxfxcxdxbxegedabagacad
#export LSCOLORS=fxfxaxdxcxegedabagacad
#enables colorfor iTerm
export TERM=xterm-256color

#sets up theprompt color (currently a green similar to linux terminal)
# {{ Define some colors first:
# infocmp xterm-256color >/dev/null 2>&1 && export TERM=xterm-256color
export MAGENTA="\033[1;31m"
export ORANGE="\033[1;33m"
export GREEN="\033[1;32m"
export PURPLE="\033[1;35m"
export WHITE="\033[1;37m"
export BOLD=""
export RESET="\033[m"
# }}
# Colored manual pages
# Gentoo has some issue, @see http://unix.stackexchangm.com/questions/6010/colored-man-pages-not-working-on-gentoo
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin standout-mode - info box (search result highlight)
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export GROFF_NO_SGR=1
# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
#export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ --> '
export PS1="\[${BOLD}${MAGENTA}\]\u\[$RESET\]@\[$ORANGE\]\h\[$RESET\]:\[$GREEN\]\w\[$RESET\]\$(echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$RESET\]\n\[$RESET\]\$ "
export PS2="\[$ORANE\]->\[$RESET\]"

##
# Alias
##
alias cs="cd -"
alias ls="ls -F"
alias la="ls -al -F"

alias en="emacs -nw"
alias grep="grep --color=auto"
