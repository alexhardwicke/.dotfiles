[[ $- != *i* ]] && return
export EDITOR=vim

# For some bizarre reason, pinned mintty doesn't add /bin/ to PATH. :(
export PATH=$PATH:/bin/:/mingw64/bin/:/usr/local/games/
export TMUX_GITBAR_DIR=~/tmux-gitbar/
export SSH_ASKPASS=""

set MSYSTEM=MINGW64

if [ ! "$TMUX" == "" ]; then
    fortune | cowsay

    if [ "$(uname)" == MSYS* ]; then
        export PYTHONPATH=/c/git-sdk-64/mingw64/lib/python2.7/site-packages/
    fi

    if [ "$(uname)" == Darwin ]; then
        if [[ ! $(ssh-add -l) ]]; then
            ssh-add ~/.ssh/id_rsa
        fi
    else
        eval `~/bin/keychain/keychain -q --eval --agents ssh id_rsa`
    fi

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
    
    [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

    PS1="\e]0;Bash\a\[\033[0m\]\[\033[34m\] > \[\033[0m\]"

    export PS1=$PS1'$( [ -n $TMUX ] && tmux setenv -g TMUX_PWD_$(tmux display -p "#D" | tr -d %) "~${PWD#~}")' 

    export PATH=/mingw64/:/mingw64/bin/:$PATH:~/bin:/c/Program\ Files\ \(x86\)/MSBuild/14.0/Bin/:~/bin/diff-so-fancy/
else
    echo -ne "\e]0;Bash\a"

    #keychain ~/.ssh/id_rsa

    exec tmux
fi

