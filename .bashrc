# General settings
set bell-style none
set -o vi

# Aliases
alias ..="cd ..";
alias cl="clear";
alias ls="ls --color=auto"
alias gst="git status";
alias grep="grep --color=auto";
alias reboot="systemctl soft-reboot";
alias poweroff="systemctl poweroff";

# Environment variables;
export GPG_TTY=$(tty)
export PATH=$HOME/.local/bin:$HOME/.brew/bin/:$PATH
