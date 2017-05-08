# .bashrc for phido, vollmond & phobos

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Autocomplete
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# Thorbens Sachen
# CLI Prefix: Hostname:Pfad$
export PS1='\[\033k\033\\\][\u@\h:\[\e[35m\]\W\[\e[0m\]\]]\$ '
export STORAGE="/fhgfs/users/tmenne/"

alias ls="ls --color=auto -AFh"
alias lso="\ls --color=auto -Fh"
alias ..="cd .."
alias ...="cd ../.."

# Add manually build nvim
export PATH="$PATH:$HOME/misc/neovim/build/bin"

export IC86DATA="/fhgfs/groups/app/icecube/IC86_I"
# export PATH=/opt/anaconda2/bin:${PATH}
# export PATH=/opt/anaconda3/bin:${PATH}

alias startnbserver="jupyter-notebook --no-browser --port=3333"

# added by Miniconda3 4.3.11 installer
export PATH="/home/tmenne/miniconda3/bin:$PATH"
