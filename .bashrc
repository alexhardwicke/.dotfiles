PS1="\[\033[34m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ "
GIT_PROMPT_ONLY_IN_REPO=1
source ~/bash-git-prompt/gitprompt.sh
GIT_PROMPT_THEME=Custom
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
bind 'Tab: menu-complete'
bind '"\e[Z": complete'
