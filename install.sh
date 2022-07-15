#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# List of files/folders to symlink in homedir
files=(bashrc screenrc bash_aliases bash_profile vimrc vim tmux.conf git-radar gitignore_global ssh/rc)

##########

# Update submodules
git submodule update --init --recursive
# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir || exit 1
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in "${files[@]}"; do
    if [[ "$file" != "old_files" ]] && [[ "$file" != "install.sh" ]]; then
        if [[ -e ~/."$file" ]]; then
            echo "Moving any existing dotfiles from ~ to $olddir"
            mv ~/."$file" ~/dotfiles_old/
        fi
        echo "Creating symlink to $file in home directory."
        ln -s "$dir"/"$file" ~/."$file"
    fi
done

#Install vim plugins
echo "Installing vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "...done"

read -r -p "Setup Git config? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        echo "Setting up Git"
        git config --global user.name "Justin Hempsey"
        git config --global commit.template ~/.gitmessage.txt
        git config --global core.editor vim
        git config --global merge.conflictStyle diff3
		git config --global core.excludesfile ~/.gitignore_global
		git config --global color.ui true
        echo "...done"
        ;;
    *)
        echo "Not setting up Git"
        ;;
esac

