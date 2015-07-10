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
# Antigen install
#
source ~/antigen.zsh

antigen use oh-my-zsh

# Antigen packages
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle command-not-found

antigen theme gauravmm/zsh-theme themes/gmm-zsh

antigen apply


#
# Final config
#

# General aliases
alias ls='ls --color'
alias ll='ls -al'
alias clear='echo -ne "\e[0;$[LINES]r"'
alias explorer='/cygdrive/c/Windows/explorer.exe /e,`cygpath -w $PWD`'

alias cdtellex='pushd C:\\Users\\GauravManek\\Desktop\\Semester\ 5\\Tellex >/dev/null'

cd C:\\Users\\GauravManek\\Desktop
