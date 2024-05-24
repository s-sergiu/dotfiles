
#functions
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

MAC_LS="ls -G -l"
LINUX_LS="ls --color=auto -l"

# Aliases;
if [[ $OSTYPE == darwin* ]]
	then
		alias ls=$MAC_LS
	else
		alias ls=$LINUX_LS
fi

alias ..="cd ..";
alias la="ls -la";
alias cl="clear";
alias gst="git status";
alias reboot="systemctl soft-reboot";

# Environment variables;
export GPG_TTY=$(tty)
export PATH=$HOME/.local/bin:$HOME/.brew/bin/:$PATH
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export DOCKER_BUILDKIT=1
set -o vi
set bell-style none
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
