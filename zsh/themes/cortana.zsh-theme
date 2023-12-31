# Based on bira theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER="${FG[054]}%n%f"
  PR_USER_OP="${FG[141]}%#%f"
  PR_PROMPT="${FG[147]}➤ %f"
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST="${FG[203]}%m%f" # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}${FG[189]} at ${PR_HOST}"
local current_dir="%B${FG[172]}%~%f%b"
local git_branch='$(git_prompt_info)'

PROMPT="${FG[146]}╭─(${user_host}${FG[147]}) ${FG[189]}in ${current_dir} \$(ruby_prompt_info)${git_branch}
${FG[146]}╰─$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="${FG[189]}on ${FG[220]}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"

}
