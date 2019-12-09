#
# .bashrc
#

# Shell options
shopt -s globstar # Enable pattern '**' used in a filename expansion context

# Prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose"
__prompt_command() {
    case $? in
        0) exit_status=`echo -e "\001\e[92m\002\u2714"` ;;
        *) exit_status=`echo -e "\001\e[91m\002\u2718"` ;;
    esac
    arrow=`echo -e "\001\e[96m\002\u2794\001\e[39m\002"`
}
PROMPT_COMMAND="__prompt_command"
PS1='$exit_status \[\e[94m\]\t \[\e[93m\]\W $(__git_ps1 "\[\e[94m\]git[\[\e[95m\]%s\[\e[94m\]] ")$arrow '

# Environment
export CLICOLOR=1
export EDITOR="vim"
export LSCOLORS="ExGx"

export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin"

# Aliases
alias ls='ls -Fh'

# Bash completion
if which brew > /dev/null && [[ -f `brew --prefix`/etc/bash_completion ]]; then
    source `brew --prefix`/etc/bash_completion;
elif [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion;
fi
