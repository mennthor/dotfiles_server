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

Install tmux plugin manager `tpm`:

```
cd
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
```

Install Python 3 via miniconda and install packages:

```
cd
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
rm -f Miniconda3-latest-Linux-x86_64.sh

cd && cd dotfiles
# From Stackoverflow: 35802939, Till Hoffmann :+1:
while read requ; do conda install --yes $requ; done < pip_requirements.txt
pip install -r pip_requirements.txt  # Install those, that conda doesn't have
```

Setup my python_modules3 package:

```
cd && mkdir -p misc && cd misc
git clone https://github.com/mennthor/python_modules3.git
cd python_modules3
pip install -e .
```

If no neovim is availbale, build and install it first in ~/misc:

```
cd && mkdir -p misc && cd misc
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/misc/neovim"
make install -j <maximum cores>
```

Setup nvim Plugins using Vim-Plug:

```
curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall -c qall
```
