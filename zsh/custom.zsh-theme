
BLUE="%{$fg[blue]%}"
WHITE="%{$fg[white]%}"
RED="%{$fg[red]%}"
RESET="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="${WHITE} ("
ZSH_THEME_GIT_PROMPT_SUFFIX="${RESET}"
ZSH_THEME_GIT_PROMPT_DIRTY="${RED}~${WHITE})"
ZSH_THEME_GIT_PROMPT_CLEAN="${WHITE})"

PROMPT='${BLUE}%2~${RESET}$(git_prompt_info) » ${RESET}%a'

