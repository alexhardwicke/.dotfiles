[[ $- != *i* ]] && return

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$TMUX" ]; then
    IS_SESSION=1
fi

if [ "$IS_SESSION" = "1" ]; then
    [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

    eval `dircolors ~/.dotfiles/.dir_colors`

    export EDITOR=vim
    export PATH=/usr/local/sbin:$PATH:/bin:~/bin/:/usr/local/games
    export MC_SKIN=$HOME/.dotfiles/solarized.ini
    export LS_OPTIONS='--color=auto --group-directories-first'
    export SSH_ASKPASS=""
    GPG_TTY=$(tty)
    export GPG_TTY

    alias ag='ag --search-files'
    alias ls='ls $LS_OPTIONS'

    eval `~/bin/keychain/keychain -q --eval --agents ssh id_rsa`

    gpg --import ~/.pgp/private

    PS1="\e]0;Bash\a\[\033[34m\]\w\[\033[36m\]\[\033[0m\] "
else
    echo -ne "\e]0;Bash\a"

    if [ "$(pgrep tmux)" == "" ]; then
        exec tmux
    else
        tmux attach &> /dev/null
    fi
fi

#PATH="/home/ah/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/ah/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/ah/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/ah/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/ah/perl5"; export PERL_MM_OPT;
