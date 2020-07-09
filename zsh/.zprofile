export BROWSER=firefox

export EDITOR='vim'
export VISUAL='vim'
export SUDO_EDITOR='vim'
export PAGER='less'
export MERGE_EDITOR='vimdiff'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

export PATH=$HOME/.local/bin:$PATH
export ANT_HOME=/usr/share/apache-ant
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export GOPATH=~/.go
export PYTHONPATH=.
export PYTHONSTARTUP=~/.pythonrc
export TODOTXT_DEFAULT_ACTION=ls
export PATH="$(pyenv root)/shims:$(ruby -e 'print Gem.user_dir')/bin:$PATH:$GOPATH/bin:$HOME/.cargo/bin"
export LEDGER_FILE='~/money.ldg'
export PYTHONDOCS=/usr/share/doc/python2/html/

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/devel
export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Temporary Files

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
