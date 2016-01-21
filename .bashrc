if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color

fi

if [ "$(uname -o)" == "Msys" ]; then
else
    if [ "$(uname)" == "Linux" ]; then
        source ~/.dotfiles/mintty-solarized-dark.sh
    fi
fi

source ~/bashconf/bin/.git-prompt.sh
source ~/bash-git-prompt/gitprompt.sh

PS1="\[\033[34m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\] $ "
GIT_PROMPT_ONLY_IN_REPO=1

GIT_PROMPT_THEME=Custom
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

cat() {
    pygmentize -g $1
}

catl() {
    pygmentize -g $1 | perl -e 'print ++$i." $_" for <>'
}

if [ "$(uname -o)" == "Msys" ]; then
    # Add python scripts to path
    pythonPaths=( $(where python) )
    pythonPath=${pythonPaths[0]}
    pythonPath=${pythonPath//'\'/'/'}
    pythonPath=${pythonPath//'C:'/'/c'}
    pythonPath=${pythonPath%/*}
    pythonPath="$pythonPath/Scripts"
    export PATH=$PATH:$pythonPath
fi

