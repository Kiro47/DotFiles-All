#!/bin/bash

DOTFILE_REPO=~/.dotfiles-all

# old source , new link
# linker

relink ()
{
	old_source="$1"
	new_link="$2"
	ln -svf "$old_source" "$new_link"
}

## Cloning Repos
git clone https://github.com/Kiro47/bash-it.git "$DOTFILE_REPO/user/home/.bash_it"


## relink user dot files

echo "Beginning relinking of user files!"

relink "$DOTFILE_REPO/user/home/.vimrc" "$HOME/.vimrc"
relink "$DOTFILE_REPO/user/home/.bashrc" "$HOME/.bashrc"
relink "$DOTFILE_REPO/user/home/.ssh/config" "$HOME/.ssh/config"
relink "$DOTFILE_REPO/user/home/.aliases" "$HOME/.aliases"
relink "$DOTFILE_REPO/user/home/.cheatsheet" "$HOME/.cheatsheet"
relink "$DOTFILE_REPO/user/home/.config/htop/htoprc" "$HOME/.config/htop/htoprc"

## Recursively link vim dictionaries
#relink($DOTFILE_REPO/user/home/.vim/spell/


## link Desktop Environment Configurations
relink "$DOTFILE_REPO/user/home/.config/compton.conf" "$HOME/.config/compton.conf"

## Openbox
relink "$DOTFILE_REPO/user/home/.config/openbox/autostart" "$HOME/.config/openbox/autostart"
relink "$DOTFILE_REPO/user/home/.config/openbox/environment" "$HOME/.config/openbox/environment"
relink "$DOTFILE_REPO/user/home/.config/openbox/menu.xml" "$HOME/.config/openbox/menu.xml"
relink "$DOTFILE_REPO/user/home/.config/openbox/rc.xml" "$HOME/.config/openbox/menu.xml"
relink "$DOTFILE_REPO/user/home/.config/openbox/themes" "$HOME/.config/openbox/themes"


