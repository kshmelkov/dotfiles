#
# Executes commands at the start of an interactive session.
#

BASE16_SHELL="$HOME/.config/base16-shell/base16-3024.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export HISTSIZE=1000

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

GPG_TTY=$(tty)
export GPG_TTY

# [[ -s "/etc/zsh/aws_complete.zsh" ]] && source "/etc/zsh/aws_complete.zsh"
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"
[[ -s "$HOME/.fzf.zsh" ]] && source ~/.fzf.zsh

alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias q='exit'
alias й='exit'
alias pl='mpv --shuffle **/*.mp3'
alias imv='feh -d -B checks -FZ --force-aliasing --keep-zoom-vp'
alias devmon='devmon -g'
alias feh='feh --fontpath /usr/share/fonts/TTF --font DejaVuSansMono/26'
alias cm='cryptmount'
alias m='mpv'
alias mm='mpv --shuffle --fs'
alias img='feh -FZd --draw-tinted'
alias nh='unset HISTFILE'
alias ydl=' youtube-dl'
alias myip='curl ifconfig.me'
alias path='echo $PATH | tr ":" "\n"'
alias cal='cal -m'
alias c='zcalc'
alias ывсм='sdcv'
alias pingg='ping -c 3 8.8.8.8'
alias upd='sudo pacman -Syu'
alias upda='yay -Syu'
alias ee='emacsclient -nw'
alias cd=' cd'
alias btc='curl rate.sx'
alias ww='curl wttr.in/London'

alias py='python'
alias py2='python2'

alias g='git'
alias jj='fasd_cd'

# disown completely application and ignore its STDOUT, STDERR
alias -g S='>& /dev/null &!'

alias -g L="| less"
alias -g C='| wc -l'

alias -s pdf='zathura'
alias -s djvu='zathura'
alias -s ps='zathura'
alias -s html='firefox'

alias offscreen='xset dpms force off'

alias -g P='| pe | fzf | read filename; [ ! -z $filename ] && vim $filename'
alias pe='path-extractor'

unalias rm

# disable software flow control
# who needs it today ?
stty -ixon

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

cconv() {
  wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3" |  sed '/res/!d;s/<[^>]*>//g';
}

bindkey '\C-k' edit-command-line

bindkey -M vicmd '\C-h' run-help
bindkey -M viins '\C-h' run-help

# pass completion suggested by @d4ndo (#362)
_fzf_complete_pass() {
  _fzf_complete '+m' "$@" < <(
    pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
    stringsize="${#pwdir}"
    find "$pwdir" -name "*.gpg" -print |
        cut -c "$((stringsize + 1))"-  |
        sed -e 's/\(.*\)\.gpg/\1/'
  )
}


source ~/.zfzf
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
