# gmm-zsh theme
# Based on `af-magic` and `sunrise`

if [ $UID -eq 0 ];
	then NCOLOR="red";
	else NCOLOR="green";
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Colors
color_subtle=$FG[237]
color_prompt=$FG[105]
color_git_dirty=$FG[196]
color_git_default=$FG[166] 

#
# Left prompt
#

# `Footer` virtual environment information
PROMPT_FOOTER_STR=${(%):-" %n@%m"}" ──"
PROMPT_FOOTER_STR_LEAD=${(r:$(( $COLUMNS - ${#PROMPT_FOOTER_STR} ))::─:)} # \u2500 is used

PROMPT='%{$color_subtle%}%{$PROMPT_FOOTER_STR_LEAD%}%{$PROMPT_FOOTER_STR%}%{$reset_color%}
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
