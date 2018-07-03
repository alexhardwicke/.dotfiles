[[ $- != *i* ]] && return
export EDITOR=vim

export PATH=/usr/local/sbin:$PATH:/bin

if [ "$(uname)" == Darwin ]; then
    export PATH=$PATH:~/.fastlane/bin
fi

export TMUX_GITBAR_DIR=~/tmux-gitbar/
export SSH_ASKPASS=""
GPG_TTY=$(tty)
export GPG_TTY

if [ ! "$TMUX" == "" ]; then
    fortune | cowsay | lolcat

    if [ "$(uname)" == Darwin ]; then
        if [[ $(ssh-add -l) == "The agent has no identities." ]]; then
            ssh-add ~/.ssh/id_rsa
        fi
    else
        eval `~/bin/keychain/keychain -q --eval --agents ssh id_rsa`
    fi

    gpg --import ~/.pgp/private

    alias ag='ag --search-files'

    [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

    PS1="\e]0;Bash\a\[\033[0m\]\[\033[34m\] > \[\033[0m\]"

    export PS1=$PS1'$( [ -n $TMUX ] && tmux setenv -g TMUX_PWD_$(tmux display -p "#D" | tr -d %) "~${PWD#~}")' 
else
    echo -ne "\e]0;Bash\a"

    #keychain ~/.ssh/id_rsa

    exec tmux
fi

