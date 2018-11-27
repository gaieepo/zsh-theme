#!/bin/sh

RCFILE=".zshrc"
VIMRCFILE=".vimrc"
TMUXCONF=".tmux.conf"
ZGENREPO="https://github.com/tarjoilija/zgen.git"
HISTFILE=".histfile"
ZGUPDATER=".zgen-update-cron.sh"
ALIASES=".aliases"
GITCONF=".gitconfig"

set -e

# Install zsh
sudo apt-get install zsh git tmux
sudo chsh -s /bin/zsh

#
# Install my .zshrc file and antigen
#

# Move to the home directory
cd ~

# Place the history file if it doesn't already exist.
if [ -e $HISTFILE ]
then
	echo "$HISTFILE found, skipping..."
else
	touch $HISTFILE
	chmod u+rw $HISTFILE
fi

# Place .aliases file if it doesn't already exist.
if [ -e $ALIASES ]
then
	echo "$ALIASES found, skipping..."
else
	touch $ALIASES
	chmod u+rw $HISTFILE
fi

# Install the .zshrc file.
if [ -e $RCFILE ]
then
	echo "$RCFILE found, skipping..."
else
	wget "https://raw.githubusercontent.com/gaieepo/zsh-theme/master/.zshrc" -O $RCFILE
fi

# Install the .vimrc file.
if [ -e $VIMRCFILE ]
then
	echo "$VIMRCFILE found, skipping..."
else
	wget "https://raw.githubusercontent.com/gaieepo/zsh-theme/master/.vimrc" -O $VIMRCFILE
    mkdir .vim
	wget "https://raw.githubusercontent.com/gaieepo/zsh-theme/master/plugins.vim" -O .vim/plugins.vim
fi

# Install the .tmux.conf file.
if [ -e $TMUXCONF ]
then
	echo "$TMUXCONF found, skipping..."
else
	wget "https://raw.githubusercontent.com/gaieepo/zsh-theme/master/.tmux.conf" -O $TMUXCONF
    tmux source-file $TMUXCONF
fi

# Install the .aliases file.
if [ -e $ALIASES ]
then
	echo "$ALIASES found, skipping..."
else
	wget "https://raw.githubusercontent.com/gaieepo/zsh-theme/master/.aliases" -O $ALIASES
fi

# Install the .gitconfig file.
if [ -e $GITCONF ]
then
	echo "$GITCONF found, skipping..."
else
	wget "https://raw.githubusercontent.com/gaieepo/zsh-theme/master/.gitconfig" -O $GITCONF
fi


# Install zgen.
if [ -d $ZGENREPO ]
then
	echo "$ZGENREPO found, skipping..."
else
	git clone "https://github.com/tarjoilija/zgen.git" .zgen
fi

# Install the zgen updater.
#if [ -e $ZGUPDATER ]
#then
#	echo "$ZGUPDATER found, skipping..."
#else
#	wget "https://raw.githubusercontent.com/gaieepo/zsh-theme/master/.zgen-update-cron.sh" -O $ZGUPDATER
#	# Add cron entry:
#	crontab -l >> /tmp/crontab-edit
#	echo "30 9,12 * * * /usr/bin/zsh ~/.zgen-update-cron.sh > /tmp/zgen.update.log 2>&1" >> /tmp/crontab-edit
#	crontab /tmp/crontab-edit
#fi

echo "Done! Starting zsh..."

cd -
zsh
