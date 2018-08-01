# Load paths
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/google-cloud-sdk/bin:$PATH

function isCallable() {
  local p="$HOME/.$1"
  if [ -d $p ] ; then
    echo "true"
  else
    echo "false"
  fi
}
# isCallable "42"
# isCallable "ndenv"

function initEnv() {
  local a=`isCallable $1`
  if [ "$a" == "true" ] ; then
    PATH="$HOME/.$1/bin":$PATH
    PATH="$HOME/.$1/shims":$PATH
    eval "$($1 init -)"
    echo "$1 init"
  else
    echo "$1 skip"
  fi
}

initEnv "jenv"
initEnv "ndenv"
initEnv "plenv"
initEnv "rbenv"
initEnv "pyenv"

eval "$(direnv hook bash)"

GOPATH=$HOME

## Export
export LANG=ja_JP.UTF-8
export TERM=xterm-256color
export PATH
export GOPATH
export EDITOR=mine

## Aliases
alias ls='ls -alG'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias g!='open https://github.com/'
alias ga='git add -p'
alias gb='git branch'
alias gd='git diff HEAD'
alias gf='git fetch -p'
alias gh='cd $(ghq list --full-path | peco)'
alias gl='git log --graph --decorate --oneline'
alias gs='git status'
alias gv='open -a /Applications/MacVim.app $@'
alias gc='git checkout $(gb | sed "s/^[ *]*//" | peco)'
alias c.='cd ../'
alias c..='cd ../../'
alias c...='cd ../../../'
alias tt=tmux
function openLocalhost() {
  ruby -e 'system "open", "http://localhost:#{ARGV.shift || 80}"' $1
}
alias l!=openLocalhost

