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
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "|"${ref#refs/heads/};
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


################
# IAdea
################
#export PATH=$PATH:/Applications/Android/android-sdk-macosx/platform-tools/:/Applications/Android/android-sdk-macosx/tools/:~/.bash_scripts
#export ANDROID_SDK_TOOLS=/Applications/Android/android-sdk-macosx
#cate() {
#    if [ $1 = '--raw' ] ; then
#        adb shell cat /mnt/ext/Android/data/com.iadea.player/files/var/log/event.xml
#    else
#        adb shell cat /mnt/ext/Android/data/com.iadea.player/files/var/log/event.xml | sed -ne 's|<event><eventType>\(.*\)</eventType><eventTime>\(.*\)</eventTime><eventSource>\(.*\)</eventSource><eventName>\(.*\)</eventName>.*"resourceURI" content="\([^"]*\)".*</event>|'${GRAY}'\2 '${YELLOW}'\1'${BLUE}' \3::\4'${RESET}' \5|p'; 
#    fi 
#}
#taile() { adb shell tail -f /mnt/ext/Android/data/com.iadea.player/files/var/log/event.xml | sed -ne 's|<event><eventType>\(.*\)</eventType><eventTime>\(.*\)</eventTime><eventSource>\(.*\)</eventSource><eventName>\(.*\)</eventName>.*"resourceURI" content="\([^"]*\)".*</event>|'${GRAY}'\2 '${YELLOW}'\1'${BLUE}' \3::\4'${RESET}' \5|p'; }
#alias rme='adb shell rm /mnt/ext/Android/data/com.iadea.player/files/var/log/event.xml'

################
# ADB
################
#alias af='adb forward tcp:8080 tcp:8080 && open http://localhost:8080/launcher/basicsettings.html'
#alias al='adb logcat -c && adb logcat'
#alias alx='adb logcat -c && adb logcat -s libxmp'
#alias au='adb shell am start -a android.settings.SYSTEM_UPDATE_SETTINGS'
#alias as='adb shell am start com.android.settings'
#alias ap='adb shell am start -S -n com.iadea.player/.SmilActivity -d ' 
#alias ar='adb shell "stop;start"'
