# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=99999
setopt appendhistory extendedglob
unsetopt autocd beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

# Language setting
LANG=en_US.UTF-8

#
# Additional key bindings
#

# ctrl-left/right
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

# ctrl-backspace/delete
bindkey "\C-_" backward-kill-word
bindkey "\e[3;5~" kill-word

# alt-backspace
bindkey "\e\d" undo

bindkey "\e[3~" delete-char
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line


#
# zgen install
#
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
	echo "Generating new zgen file."
	
	# specify plugins here
	zgen oh-my-zsh
	zgen load zsh-users/zsh-syntax-highlighting
	zgen oh-my-zsh plugins/git
	zgen oh-my-zsh plugins/command-not-found

	zgen load gauravmm/zsh-theme themes/gmm-zsh

	# generate the init script from plugins above
	zgen save
fi

#
# Environment Variables & Config
#

# General aliases
alias ls='ls --color'
alias ll='ls -al'
alias clear='echo -ne "\e[0;$[LINES]r"'

# Default Editor
export EDITOR='subl -w'


# Windows support:
if [[ `uname` =~ "CYGWIN_NT" ]]
then
	alias explorer='/cygdrive/c/Windows/explorer.exe /e,`cygpath -w $PWD`'
	alias subl='/cygdrive/c/Program\ Files/Sublime\ Text\ 3/subl.exe'

	# If we are starting in the home directory, start on the desktop instead.
	[[ $PWD == '/home/manek' ]] && cd C:\\Users\\manek\\Desktop
fi
