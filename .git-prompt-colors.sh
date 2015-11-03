# This theme for gitprompt.sh is optimized for the "Solarized Dark" and "Solarized Light" color schemes 
# tweaked for the Solarized Powerline custom font
# Also, I've removed some of the prompts

override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Hardwicke"
  GIT_PROMPT_STAGED="${Yellow}●"
  GIT_PROMPT_STASHED="${BoldMagenta}▼ "
  GIT_PROMPT_CLEAN="${Green}✔"
  GIT_PROMPT_END_USER=" $ "
  GIT_PROMPT_END_ROOT=" # "
  GIT_PROMPT_START_USER="${Blue}${PathShort}${ResetColor}"
  GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_USER}"
}

reload_git_prompt_colors "Hardwicke"
