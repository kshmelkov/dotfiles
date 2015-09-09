#
# Executes commands at the start of an interactive session.
#

BASE16_SHELL="$HOME/.config/base16-shell/base16-3024.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ -s "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"
[[ -s "/etc/zsh/aws_complete.zsh" ]] && source "/etc/zsh/aws_complete.zsh"
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias q='exit'
alias й='exit'
alias pl='mpv -shuffle **/*.mp3'
alias imv='feh -d -B checks -FZ --force-aliasing --keep-zoom-vp'
alias devmon='devmon -g'
alias feh='feh --fontpath /usr/share/fonts/TTF --font DejaVuSansMono/26'
alias cm='cryptmount'
alias m='mpv'
alias img='feh -FZd --draw-tinted'
alias nh='unset HISTFILE'
alias t='todo.sh'
alias myip='curl ifconfig.me'
alias path='echo $PATH | tr ":" "\n"'
alias cal='cal -m -3'
alias zc='zcalc'
alias ывсм='sdcv'
alias psc='pass show -c'

alias py='python'
alias py2='python2'

alias g='git'

# disown completely application and ignore its STDOUT, STDERR
alias -g S='>& /dev/null &!'

alias -g L="| less"
alias -g C='| wc -l'

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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
