################
# ANSI COLOR
################
GRAY=`echo -en '[1;30m'`
RED=`echo -en '[31m'`
BLUE=`echo -en '[1;34m'`
YELLOW=`echo -en '[93m'`
RESET=`echo -en '[0m'`

################
# GIT
################
function git_branch {
    remote="$(git config --get remote.origin.url)"
    if [ "$remote" -a "$remote" != 'https://github.com/smk2124/homeosx.git' ] ; then
        ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
        echo "|"${ref#refs/heads/};
    fi
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    
    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

export PS1='\[\e[1;30m\]\u@Retina:\[\e[1;3'"$(date +%u)"'m\]\w\[\e[1;36m\]'"\$(git_branch)"'\[\e[1;30m\]$ \[\e[0;39m\]'

alias gd='git difftool --tool=vimdiff --no-prompt'
gdv() { git diff $@ | vi - ; }
alias gs='git status'
alias gl="git logc"
alias ga='git add .'
alias gp='git pull --rebase'
alias grep='grep --color=auto'
alias ls='ls -G'

################
# MacPorts
################
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

################
# Diff 
################
#CSR
alias diff="diff '-x .* -x *.si -x *.o -x *.xiw -x *.xip -x *.mak -x *.keyr -x *.elf -x *.d -x *.img -x *.xuv -x *.map -x flags.*'"

