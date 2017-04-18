# dotfiles_server

Dotfiles for a Linux server.
Different from the OSX dotfiles.
Provides basic settings for bashrc, tmux and nvim.

Install:

```
cd
git clone https://github.com/mennthor/dotfiles_server.git dotfiles
cd dotfiles
for i in $(ls -d */); do stow -vv $i; done
cd
source .bashrc
```
