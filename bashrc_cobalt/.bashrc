# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PS1='\[\033k\033\\\]\u@\h:\[\e[34m\]\W\[\e[0m\]\$ '
export EDITOR="vim"
alias ls="ls --color -FAh"
alias lso="\ls --color -Fh"
alias ..="cd .."
alias ...="cd ../.."
alias startnbserver="jupyter-notebook --no-browser --port=2222"
alias gti="echo 'Typed gti again...'; git"

# Source autocompletions
for i in $(ls ~/software/bash-completions); do
  source ~/software/bash-completions/$i;
done


## Currently linked metaproject is: Parasitic
## /cvmfs/icecube.opensciencegrid.org/py2-v2/RHEL_6_x86_64/metaprojects/icerec/V05-00-00
export PARASITIC=${HOME}/software/parasitic/build
# Load a cvmfs environment, adds stuff to PATH & LD_LIBRARY_PATH
eval `/cvmfs/icecube.opensciencegrid.org/py2-v2/setup.sh`
# alias icerec="$PARASITIC/env-shell.sh"
alias icerec=/cvmfs/icecube.opensciencegrid.org/py2-v2/RHEL_6_x86_64/metaprojects/icerec/V05-00-00/env-shell.sh
alias icecombo=/cvmfs/icecube.opensciencegrid.org/py2-v2/RHEL_6_x86_64/metaprojects/combo/stable/env-shell.sh

# jfelde's icerec to use the GRB stuff
alias grbrec="/home/jfelde/IceCube/build/env-shell.sh"

# If building doesn't work try a newer gcc
alias devset2="exec scl enable devtoolset-2 bash"

# All custom build software goes to ~/software/[bin|lib]
export PATH=~/software/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/software/lib


# Add user python packages first in path
export PATH="/home/tmenne/.local/bin/:${PATH}"
export PYTHONPATH="/home/tmenne/.local/lib/python2.7/site-packages:${PYTHONPATH}"
export PYTHONSTARTUP=/home/tmenne/software/pystart.py


# Functions
function count_files {
    # POSIX save way to count files in dir.
    # https://github.com/l0b0/tilde/blob/2bb1a09b41435ddb9961baaa5d7faa4e7e237a05/.bash_history#L240
    # Arg1 : Dir to search in. Arg2 : Wildcard pattern for filename
    # Example: count_files . "*.i3.bz2"
    find $1 -mindepth 1 -maxdepth 1 -type f -name "$2" -exec  printf x \; | wc -c;
}

function gits {
    for folder in $@; do cd $folder; echo "Checking '$(pwd)'"; git status; cd - > /dev/null; done
}

# Load python3 on demand. Disables the cvmfs paths and restores them on deactivate
function miniconda3 {  
        # Activates miniconda 3 as the main python.
        # `deactivate` restores previous state
	function deactivate {
		if [ ! -z "$_OLD_PATH" ]; then
			export PATH=${_OLD_PATH}
			export LD_LIBRARY_PATH=${_OLD_LD_LIBRARY_PATH}
			export PYTHONPATH=${_OLD_PYTHONPATH}
			export PS1=${_OLD_PS1}
			unset _OLD_PATH
			unset _OLD_PYTHONPATH
			unset _OLD_LD_LIBRARY_PATH
			unset _OLD_PS1
			unset -f deactivate
		fi
		}
	deactivate  # Just deactivate old envs
	_OLD_PATH=${PATH}
	_OLD_LD_LIBRARY_PATH=${LD_LIBRARY_PATH}
	_OLD_PYTHONPATH=${PATH}
	_OLD_PS1=${PS1}
	# Set new path on top of all, remove CVMFS pythonpath
	export PATH=${HOME}/software/miniconda3/bin:${PATH}
        export PYTHONPATH=""
	export LD_LIBRARY_PATH="/home/tmenne/software/miniconda3/lib":${LD_LIBRARY_PATH}
	export PS1="(py3) $PS1"
}
