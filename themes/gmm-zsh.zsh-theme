# gmm-zsh theme
# Based on `af-magic` and `sunrise`

# We handle virtualenv separately
export VIRTUAL_ENV_DISABLE_PROMPT=1

if [ $UID -eq 0 ];
	then NCOLOR="red";
	else NCOLOR="green";
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Colors

# Pick the footer color to indicate SSH.
color_footer_line=$FG[237]
if [ $SESSION_TYPE == "ssh" ]; then
	color_footer=$FG[004]
else
	color_footer=$FG[237]
fi
color_prompt=$FG[105]
color_git_dirty=$FG[196]
color_git_default=$FG[166] 

# Left prompt

# From https://github.com/tonyseek/oh-my-zsh-virtualenv-prompt/blob/master/virtualenv-prompt.plugin.zsh
export PROMPT_VIRTUALENV_STR=""
function virtualenv_prompt_info() {
    export PROMPT_VIRTUALENV_STR=""
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        export PROMPT_VIRTUALENV_STR="[$name]"
    else
        if [ -n "${CONDA_DEFAULT_ENV// }" ]; then
            export PROMPT_VIRTUALENV_STR="{${CONDA_DEFAULT_ENV// }}"
        fi
    fi
}

# `Footer` virtual environment information
PROMPT_FOOTER_STR=${(%):-" %n@%m"}

# Use a function so that it can be called automatically.
function PROMPT_FOOTER_RECALC () {
	virtualenv_prompt_info
	PROMPT_FOOTER_STR_LEAD=${(r:$(( $COLUMNS - ${#PROMPT_VIRTUALENV_STR} - ${#PROMPT_FOOTER_STR} - 3))::─:)} # \u2500 is used
}
PROMPT_FOOTER_RECALC
# Also execute it before each cmd is drawn. 
precmd() { PROMPT_FOOTER_RECALC; }

PROMPT='%{$color_footer_line%}%{$PROMPT_FOOTER_STR_LEAD%}%{$color_footer%}%{$PROMPT_VIRTUALENV_STR%}%{$PROMPT_FOOTER_STR%}%{$color_footer_line%} ──%{$reset_color%}
$FG[032]%2d\
%{$color_prompt%}%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# Right prompt
RPROMPT='$(git_prompt_info)'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$color_git_default%}["
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$color_git_dirty%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$color_git_default%}]%{$reset_color%}"
