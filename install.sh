#!/bin/sh

# Install zsh
sudo apt-get install zsh git
chsh -s /bin/zsh

# Install my .zshrc file and antigen
# Move to the home directory
cd ~
touch .histfile
chmod u+rw .histfile
RCFILE=".zshrc"
ZGENREPO="https://github.com/tarjoilija/zgen.git"

# Install the RC file
if [ -e $RCFILE ]
then
	echo "$RCFILE found, skipping..."
else
	wget https://raw.githubusercontent.com/gauravmm/zsh-theme/master/.zshrc -O $RCFILE
fi

# Install zgen
if [ -d $ZGENREPO ]
then
	echo "$ZGENREPO found, skipping..."
else
	git clone https://github.com/tarjoilija/zgen.git .zgen
fi

echo "Done! Starting zsh..."

cd -
zsh
