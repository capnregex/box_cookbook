# prompt configuration

# configure the git-prompt.sh script
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

source /opt/git/git-prompt.sh

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

normal='\[\033[01;00m\]'
black='\[\033[30m\]'
dark_red='\[\033[31m\]'
dark_green='\[\033[32m\]'
brown='\[\033[33m\]'
dark_blue='\[\033[34m\]'
purple='\[\033[35m\]'
teal='\[\033[36m\]'
light_grey='\[\033[37m\]'
dark_grey='\[\033[01;30m\]'
red='\[\033[01;31m\]'
green='\[\033[01;32m\]'
yellow='\[\033[01;33m\]'
blue='\[\033[01;34m\]'
magenta='\[\033[01;35m\]'
cyan='\[\033[01;36m\]'
white='\[\033[01;37m\]'

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

chroot='${debian_chroot:+($debian_chroot)}'
user='\u@\h'
where='\w'
branch='`__git_ps1`'
title='\[\e]0;\u@\h \w\a\]'

case "$TERM" in
  xterm*|rxvt*|*-256color) 
    export PS1="$title$chroot$green$user $yellow$branch $red\$RUBY_VERSION$purple\$MSYSTEM$normal $blue$where\n$white\\$ $normal"
    ;;
  *)
    export PS1="$chroot$user $branch $RUBY_VERSION $TERM $where\n\\$ "
    ;;
esac

unset black blue brown cyan dark_blue dark_green dark_grey dark_red green light_grey magenta normal purple red teal white yellow
