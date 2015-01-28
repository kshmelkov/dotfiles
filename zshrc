# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
setopt appendhistory autocd notify
unsetopt beep
#setopt beep
bindkey -v
zstyle :compinstall filename '/home/shmel/.zshrc'

autoload -U compinit
compinit

autoload -U complist

autoload -U promptinit
promptinit
prompt pure

#autoload -U zutil
autoload zcalc

# Meta-u to chdir to the parent directory
bindkey -s '\eq' '^Ucd ..; ls^M'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-3024.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

if [ -n "$DISPLAY" ]; then
	export BROWSER=firefox
else
	export BROWSER=links
fi

if [ -f "${HOME}/.gnupg/gpg-agent.env" ]; then
  . "${HOME}/.gnupg/gpg-agent.env"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi

export ANT_HOME=/usr/share/apache-ant
export EDITOR=vim
export VISUAL=vim
export SUDO_EDITOR=rvim
#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk
export LANG=en_US.UTF-8
export LC_ALL=en_US.utf8
export LANGUAGE=en_US
export LC_MESSAGES=en_US.utf8
export GPG_TTY=`tty`
export MPD_HOST="127.0.0.1"
export MPD_PORT="6600"
export VIMRUNTIME=/usr/share/vim/vim74

alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias dh='df -h'
alias ls='ls --color -F'
alias ll='ls --color -F -lh'
alias la='ls --color -F -a'
alias lal='ls --color -F -alh'
alias grep='grep --colour'
alias q='exit'
alias й='exit'
alias cal='cal -3m'
alias pdf='screen -d -m apvlv'
alias dj='djview4'
alias pl='mplayer -shuffle **/*.mp3'
alias p='mupdf -r 210'
alias imv='feh -B checks -FZ --force-aliasing --keep-zoom-vp'
alias devmon='devmon -g'
alias feh='feh --fontpath /usr/share/fonts/TTF --font DejaVuSansMono/26'

alias netr='sudo netctl restart home'
alias nets='sudo netctl status home'
alias reboot='sudo systemctl reboot'
alias shutdown='sudo systemctl poweroff'
alias standby='sudo systemctl suspend'
alias hibernate='sudo systemctl hibernate'

alias netctl='sudo netctl'
vpn () { sudo systemctl $1 openvpn@nl2_udp.service }

alias offscreen='xset dpms force off'

cd
