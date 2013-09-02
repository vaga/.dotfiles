# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
export PS1='\[\033[00;37m\]\u@\h \W \$ \[\033[00m\]'

# some more ls aliases

# Auto completions
complete -cf man

# Add aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias l='ls -lh'
alias lock='i3lock -c 000000'
alias vi='vim'
alias tree='tree -C'
alias ack='ack-grep --color'
