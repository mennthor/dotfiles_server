# dotfiles_server

Dotfiles for a Linux server.
Different from the OSX dotfiles.
Provides basic settings for bashrc, tmux and nvim.

Install dotfiles:

```
cd
git clone https://github.com/mennthor/dotfiles_server.git dotfiles
cd dotfiles
for i in $(ls -d */); do stow -vv $i; done
cd
source .bashrc
```

Install Python with [pyenv](https://github.com/pyenv/pyenv-installer):

```
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
eval "$(pyenv init -)"
pyenv update
pyenv install 3.6.1
```
