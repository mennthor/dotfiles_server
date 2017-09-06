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

Build and install stow:

```
cd && cd misc
# Get and install dependencies
wget ftp://ftp.gnu.org/gnu/texinfo/texinfo-6.4.tar.gz
tar -xzvf texinfo-6.4.tar.gz
wget http://download.savannah.gnu.org/releases/texi2html/texi2html-5.0.tar.gz
tar -xzvf texi2html-5.0.tar.gz
cd texinfo-6.4
./configure --prefix=$DIR
make && make install
cd && cd misc/texi2html-5.0
./configure --prefix=$DIR
make && make install
# Build stow from git
cd && cd misc
git clone https://github.com/aspiers/stow.git && cd stow
autoreconf -iv
./configure --prefix=$DIR
make && make install
```

Build and install tmux:

```
cd && cd misc
git clone https://github.com/tmux/tmux.git
sh autogen.sh
./configure --prefix=$DIR CFLAGS="-I$DIR/libevent/include" LDFLAGS="-L$DIR/lib"
make && make install  #  Is now in ~/misc/bin
```

Install tmux plugin manager:

```
cd
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux 
# Now inside tmux, press Prefix + I in tmux to install plugins. Takes some seconds, be patient.
```

Build and install neovim:

```
cd && cd misc
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$DIR"
make install
```

Setup nvim plugins using vim-plug:

```
curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall -c qall
```

Setup vim and plugins using Vundle:

```
cd && misc
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-multibyte --enable-pythoninterp=yes --enable-cscope --prefix=/home/tmenne/software
make
make install prefix=$DIR

# Plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim```
vim -c PluginInstall -c qall
```

Building cmake when the available one is not build with ssl support (then neovim won't build)

```
cd && cd misc
mkdir cmake && cd cmake
wget https://cmake.org/files/v3.9/cmake-3.9.0-rc2.tar.gz
tar xvzf cmake-3.9.0-rc2.tar.gz
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$DIR ../cmake-3.9.0-rc2  # requires available cmake
make
make install
```

Bulding libcurl, when SSL is disabled (do this before linking cmake to libcurl to use this version)

```
cd && cd misc
mkdir libcurl && cd libcurl
wget https://curl.haxx.se/download/curl-7.54.0.tar.gz
tar xvzf curl-7.54.0.tar.gz && cd curl-7.54.0
./configure --with-ssl
make
make install prefix=$DIR
```


## Python 3

**Note:** Python packages are py2 compatible now.
So save the hassle to egt py3 working when it is not natively installed.

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
