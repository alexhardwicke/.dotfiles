# For some bizarre reason, pinned mintty doesn't add /bin/ to PATH. :(
set MSYSTEM=MINGW64
export PATH=$PATH:/bin/:/mingw64/bin/:/usr/local/games/

if [ ! "$TMUX" == "" ]; then
    fortune | cowsay

    eval `~/bin/keychain/keychain -q --eval --agents ssh id_rsa`

    cd ~/

    export TERM=xterm-256color

    alias ag='ag --search-files'
    alias jq="jq -C"

    export GIT_GUI_LIB_DIR=/c/msys64/usr/share/git-gui/lib

    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases;
    fi

    if [ "$(uname)" == "Linux" ]; then
        source ~/.dotfiles/mintty-solarized-dark.sh
    fi

    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    GIT_PROMPT_SHOW_UNTRACKED_FILES=no

    source ~/bash-git-prompt/gitprompt.sh

    [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

    PS1="\e]0;Bash\a\[\033[34m\]\w\[\033[36m\]\[\033[0m\] $ "


    #GIT_PROMPT_THEME=Custom

    export PATH=/mingw64/:/mingw64/bin/:$PATH:~/bin
else
    echo -ne "\e]0;Bash\a"

    #keychain ~/.ssh/id_rsa

    if [ "$(pgrep tmux)" == "" ]; then
        exec tmux
    else
        tmux attach &> /dev/null
    fi
fi

# cat() {
#     pygmentize -g $1
# }

# catl() {
#     pygmentize -g $1 | perl -e 'print ++$i." $_" for <>'
# }

# if [ "$(uname -o)" == "Msys" ]; then
#     # Add python scripts to path
#     pythonPaths=( $(where python) )
#     pythonPath=${pythonPaths[0]}
#     pythonPath=${pythonPath//'\'/'/'}
#     pythonPath=${pythonPath//'C:'/'/c'}
#     pythonPath=${pythonPath%/*}
#     pythonPath="$pythonPath/Scripts"
#     export PATH=$PATH:$pythonPath
# fi


# PATH="/home/alex/perl5/bin:/home/alex/bin/${PATH+:}${PATH}"; export PATH;
# PERL5LIB="/home/alex/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/alex/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/alex/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/alex/perl5"; export PERL_MM_OPT;

