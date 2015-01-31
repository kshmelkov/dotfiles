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
alias dh='df -h'
alias q='exit'
alias й='exit'
alias dj='djview4'
alias pl='mplayer -shuffle **/*.mp3'
alias p='mupdf -r 210'
alias imv='feh -B checks -FZ --force-aliasing --keep-zoom-vp'
alias devmon='devmon -g'
alias feh='feh --fontpath /usr/share/fonts/TTF --font DejaVuSansMono/26'

#alias standby='sudo systemctl suspend'

vpn () { sudo systemctl $1 openvpn@nl2_udp.service }

alias offscreen='xset dpms force off'

