# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Autocomplete
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# CLI Prefix: [Hostname:Path(magenta)]$
export PS1="[\u@\h:\[$(tput setaf 5)\]\W\[$(tput sgr 0)\]]\\$ "

alias ls="ls --color=auto -AFh"
alias lso="\ls --color=auto -Fh"
alias ..="cd .."
alias ...="cd ../.."
alias startnbserver="jupyter-notebook --no-browser --port=3333"

# Add manually build libs and binaries
export PATH="$HOME/misc/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/misc/lib:$LD_LIBRARY_PATH"

# added by Miniconda3 4.3.11 installer
export PATH="/home/tmenne/miniconda3/bin:$PATH"
