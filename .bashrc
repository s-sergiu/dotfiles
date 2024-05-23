
# Aliases;
alias ls="ls --color=auto";
alias ..="cd ..";
alias ll="ls -l";
alias la="ls -la";
alias cl="clear";
alias reboot="systemctl reboot";
alias poweroff="systemctl poweroff";
alias suspend="systemctl suspend";
alias gst="git status";

# Environment variables;
export GPG_TTY=$(tty)
export PATH=$HOME/.local/bin:$HOME/.brew/bin/:$PATH
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export DOCKER_BUILDKIT=1
set -o vi
set bell-style none
export PS1="[\u@\h \W]\$ "
