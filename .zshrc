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
# Environment Variables & Config
#

# General aliases
alias clear='echo -ne "\e[0;$[LINES]r"'
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias gitconfig="vim ~/.gitconfig"
alias tmuxconfig="vim ~/.tmux.conf"
alias vimplugins="vim ~/.vim/plugins.vim"
alias aconfig="vim ~/.aliases"
alias emacsconfig="vim ~/.emacs.d/init.el"

# Default Editor
command -v subl 1>/dev/null 2>&1
if [ $? == "0" ]; then
	export EDITOR='subl -w'
else
	export EDITOR='vim'
fi

# Detect if this is an ssh session
SESSION_TYPE="local"
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    SESSION_TYPE="ssh"
else
    case $(ps -o comm= -p $PPID) in
        sshd|*/sshd) SESSION_TYPE="ssh";;
    esac
fi
export SESSION_TYPE=$SESSION_TYPE

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

# Includes
source ~/.profile
source ~/.aliases
