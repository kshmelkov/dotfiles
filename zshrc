#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-3024.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias q='exit'
alias й='exit'
alias pl='mpv -shuffle **/*.mp3'
alias imv='feh -B checks -FZ --force-aliasing --keep-zoom-vp'
alias devmon='devmon -g'
alias feh='feh --fontpath /usr/share/fonts/TTF --font DejaVuSansMono/26'
alias cm='cryptmount'
alias m='mpv'
alias f='feh -FZd --draw-tinted'
alias nh='unset HISTFILE'
alias t='todo.sh'
alias myip='curl ifconfig.me'
alias path='echo $PATH | tr ":" "\n"'
alias cal='cal -m -3'
alias zc='zcalc'
alias ывсм='sdcv'

# disown completely application and ignore its STDOUT, STDERR
alias -g S='>& /dev/null &!'

alias -s pdf='zathura'
alias -s djvu='zathura'
alias -s ps='zathura'
alias -s html='firefox'

alias jrnl=' jrnl'

alias offscreen='xset dpms force off'

unalias rm

# disable software flow control
# who needs it today ?
stty -ixon

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }; alias transfer=transfer 
