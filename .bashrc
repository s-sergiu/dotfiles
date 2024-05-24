
#functions
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[ \1]/'
}

parse_untracked() {
	if [[ $(git status --short 2> /dev/null | grep ?? | wc -l) -gt 0 ]]
		then
			git status --short 2> /dev/null | grep ?? | wc -l | sed 's/$/]/' | sed 's/^/[ /'
	fi 
}

parse_unstaged() {
	if [[ $(git ls-files -m 2> /dev/null | wc -l) -gt 0 ]]
		then
			git ls-files -m 2> /dev/null | wc -l | sed 's/$/]/' | sed 's/^/[ /'
	fi 
}

parse_staged() {
	if [[ $(git diff --name-only --cached 2> /dev/null | wc -l) -gt 0 ]]
		then
			git diff --name-only --cached 2> /dev/null | wc -l | sed 's/$/]/' | sed 's/^/[ /'
	fi 
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
export PS1="\u@\h \[\e[32m\]\W \[\e[91m\]\$(parse_git_branch)\e[90m\$(parse_untracked)\e[91m\$(parse_unstaged)\e[32m\$(parse_staged)\[\e[00m\]$ "
