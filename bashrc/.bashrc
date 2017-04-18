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

export IC86DATA="/fhgfs/groups/app/icecube/IC86_I"
# export PATH=/opt/anaconda2/bin:${PATH}
# export PATH=/opt/anaconda3/bin:${PATH}

alias startnbserver="jupyter-notebook --no-browser --port=3333"

# Load pyenv automatically by adding
# the following to ~/.bash_profile:
export PATH="/home/tmenne/.pyenv/bin:$PATH"
if which pyenv > /dev/null;
    then eval "$(pyenv init -)";
fi
if which pyenv-virtualenv-init > /dev/null;
    then eval "$(pyenv virtualenv-init -)";
fi

