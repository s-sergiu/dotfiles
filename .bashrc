

#functions
parse_git_branch() {
			if [[ $OSTYPE == darwin* ]]
				then
					git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
				else
					git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
			fi
}

parse_changes() {
	if [[ $(git status -uno 2> /dev/null | grep behind | awk '{print $7}') -gt 0 ]]
		then
			if [[ $OSTYPE == darwin* ]]
				then
					git status -uno 2> /dev/null | grep behind | awk '{print $7}' | xargs | sed 's/$/]/' | sed 's/s/[/'
				else
					git status -uno 2> /dev/null | grep behind | awk '{print $7}' | sed 's/$/]/' | sed 's/^/[/'
			fi
	fi 
}

parse_untracked() {
	if [[ $(git status --short 2> /dev/null | grep ?? | wc -l) -gt 0 ]]
		then
			if [[ $OSTYPE == darwin* ]]
				then
					git status --short 2> /dev/null | grep ?? | wc -l | xargs | sed 's/$/]/' | sed 's/^/[/'
				else
					git status --short 2> /dev/null | grep ?? | wc -l | sed 's/$/]/' | sed 's/^/[/'
			fi
	fi 
}

parse_unstaged() {
	if [[ $(git ls-files -m 2> /dev/null | wc -l) -gt 0 ]]
		then
			if [[ $OSTYPE == darwin* ]]
				then
					git ls-files -m 2> /dev/null | wc -l | xargs | sed 's/$/]/' | sed 's/^/[/'
				else
					git ls-files -m 2> /dev/null | wc -l | sed 's/$/]/' | sed 's/^/[/'
			fi
	fi 
}

parse_staged() {
	if [[ $(git diff --name-only --cached 2> /dev/null | wc -l) -gt 0 ]]
		then
			if [[ $OSTYPE == darwin* ]]
				then
					git diff --name-only --cached 2> /dev/null | wc -l | xargs | sed 's/$/]/' | sed 's/^/[/'
				else
					git diff --name-only --cached 2> /dev/null | wc -l | sed 's/$/]/' | sed 's/^/[/'
			fi
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
alias la="ls -lah";
alias cl="clear";
alias gst="git status";
alias reboot="systemctl soft-reboot";
alias poweroff="systemctl poweroff";
alias tmux="export TERM=linux-16color; tmux"

# Environment variables;
export GPG_TTY=$(tty)
export PATH=$HOME/.local/bin:$HOME/.brew/bin/:$PATH
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export DOCKER_BUILDKIT=1
set -o vi

set bell-style none
export PS1="\u@\h \[\e[32m\]\W \[\e[91m\]\$(parse_changes)\$(parse_git_branch)\e[90m\$(parse_untracked)\e[91m\$(parse_unstaged)\e[32m\$(parse_staged)\[\e[00m\]$ "
export PATH=$HOME/.brew/bin:$PATH
