#!/bin/bash

# symlink common files so config_scripts repo can be anywhere
echo "Symlinking common files"
ln -s -f `pwd`/common_bash_profile.sh ~/.common_bash_profile.sh
ln -s -f `pwd`/common_gitconfig ~/.common_gitconfig
ln -s -f `pwd`/common_bash_aliases ~/.common_bash_aliases.sh
ln -s -f `pwd`/bash_colors.sh ~/.bash_colors.sh

# copy base regular files so they can be adapted
echo
echo "Copying base regular files"
if [ ! -f ~/.bash_profile ]; then
    cp ./bash_profile ~/.bash_profile
else
    echo "Leaving existing ~/.bash_profile"
fi
if [ ! -f ~/.gitconfig ]; then
    cp ./gitconfig ~/.gitconfig
else
    echo "Leaving existing ~/.gitconfig"
fi
if [ ! -f ~/.bash_aliases ]; then
    cp ./bash_aliases ~/.bash_aliases
else
    echo "Leaving existing ~/.bash_aliases"
fi

# get git completion files
echo
echo "Downloading git completion files"
if [ ! -f ~/.git-completion.bash ]; then
    curl -s -S https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
else
    echo "Not overwriting ~/.git-completion.bash"
fi
if [ ! -f ~/.git-prompt.sh ]; then
    curl -s -S https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh
else
    echo "Not overwriting ~/.git-prompt.sh"
fi

# link sublime config files
echo "Symlinking sublime config files"
SCRIPT_WD="`pwd`"
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s $SCRIPT_WD/Sublime/User
cd $SCRIPT_WD
