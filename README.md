# dotfiles_server

Dotfiles for a Linux server (different from my OSX dotfiles).
Provides basic settings for bashrc, tmux, git and nvim and sets up an Anaconda Python 3 with packages I use most of the time.

Binaries are installed to `~/misc/bin` and libraries to `~/misc/lib`.
Paths are included in `.bashrc`.
Before we start, we create the folder and a shortcut for our install path:

```
cd && mkdir -p misc
DIR=$HOME/misc
```

## dotfiles

These get just symlinked to the home directory using GNU stow:

```
cd
git clone https://github.com/mennthor/dotfiles_server.git dotfiles
cd dotfiles
for i in $(ls -d */); do stow -vv $i; done
cd
source .bashrc
```

## Libraries

Install libevent:

```
cd && cd misc
git clone https://github.com/libevent/libevent
cd libevent
sh autogen.sh
./configure --prefix=$DIR
make && make install  # Is now in ~/misc/lib/
```

## Binaries

Build and install tmux:

```
cd && mkdir -p misc && cd misc
git clone https://github.com/tmux/tmux.git
sh autogen.sh
./configure --prefix=$DIR CFLAGS="-I$DIR/misc/libevent/include" LDFLAGS="-L$DIR/lib"
make && make install  #  Is now in ~/misc/bin
```

Install tmux plugin manager:

```
cd && cd misc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux 
tmux source ~/.tmux.conf  # Now inside tmux, press Prefix + I in tmux to install plugins
```

Build and install neovim:

```
cd && cd misc
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/misc/neovim"
make install
```

Setup nvim plugins using vim-plug:

```
curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall -c qall
```

## Python 3

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
cd && cd misc
git clone https://github.com/mennthor/python_modules3.git
cd python_modules3
pip install -e .
```
