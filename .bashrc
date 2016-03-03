if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

if [ "$(uname)" == "Linux" ]; then
    source ~/.dotfiles/mintty-solarized-dark.sh
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


PATH="/home/alex/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/alex/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/alex/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/alex/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/alex/perl5"; export PERL_MM_OPT;
