# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Autocomplete
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# CLI Prefix: Hostname:Path$
export PS1='\[\033k\033\\\][\u@\h:\[\e[35m\]\W\[\e[0m\]\]]\$ '

alias ls="ls --color=auto -AFh"
alias lso="\ls --color=auto -Fh"
alias ..="cd .."
alias ...="cd ../.."
alias startnbserver="jupyter-notebook --no-browser --port=3333"

# Add manually build nvim
export PATH="$PATH:$HOME/misc/neovim/build/bin"

# added by Miniconda3 4.3.11 installer
export PATH="/home/tmenne/miniconda3/bin:$PATH"
