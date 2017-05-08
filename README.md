# dotfiles_server

Dotfiles for a Linux server (different from my OSX dotfiles).
Provides basic settings for bashrc, tmux, git and nvim and sets up an Anaconda Python 3 with packages I use most of the time.

Install dotfiles:

```
cd
git clone https://github.com/mennthor/dotfiles_server.git dotfiles
cd dotfiles
for i in $(ls -d */); do stow -vv $i; done
cd
source .bashrc
```

~~Install Python with [pyenv](https://github.com/pyenv/pyenv-installer):~~

```
# cd && cd dotfiles
# curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
# eval "$(pyenv init -)"
# pyenv update
# pyenv install 3.6.1
```

Install Python 3 via miniconda and install packages:

```
cd
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
rm -f Miniconda3-latest-Linux-x86_64.sh

cd && cd dotfiles
# From Stackoverflow: 35802939, Till Hoffmann :+1:
while read requ; do conda install --yes $requ; done < pip_equirements.txt
pip install -r pip_requirements.txt  # Install those, that conda doesn't have
```

Setup my python_modules3 package:

```
cd && mkdir -p misc && cd misc
git clone https://github.com/mennthor/python_modules3.git
cd python_modules3
pip install -e .
```

Setup nvim Plugins using Vim-Plug:

```
curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall -c qall
```
