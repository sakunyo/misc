# my bin
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH

# Languages
PATH=$HOME/google-cloud-sdk/bin:$PATH
PATH=$HOME/.jenv/bin:$PATH
PATH=$HOME/.ndenv/bin:$PATH
PATH=$HOME/.plenv/bin:$PATH
PATH=$HOME/.rbenv/bin:$PATH
PATH=$HOME/.pyenv/bin:$PATH
eval "$(jenv init -)"
eval "$(ndenv init -)"
eval "$(plenv init -)"
eval "$(rbenv init -)"
eval "$(pyenv init -)"

# Direnv
eval "$(direnv hook bash)"

GOPATH=$HOME

## Export
export LANG=ja_JP.UTF-8
export PATH
export GOPATH
export EDITOR=mine

## Aliases
alias ls='ls -alG'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

alias gl='git log --graph --decorate --oneline'
alias ga='git add -p'
alias gd='git diff HEAD'
alias gb='git branch'
alias gs='git status'

alias prof!='vi ~/.bash_profile'
alias sour!='source ~/.bash_profile'

alias mycom='cat ~/.bash_profile | grep alias'
alias g!='open https://github.com/'
alias t!='open https://translate.google.co.jp'
alias b!='open http://b.hatena.ne.jp/sakunyo/bookmark'
alias c!='open http://caniuse.com'

## Peco
alias gh='cd $(ghq list --full-path | peco)'
alias gc='git checkout $(gb | sed "s/^[ *]*//" | peco)'

alias c.='cd ../'
alias c..='cd ../../'
alias c...='cd ../../../'

alias unzip6="/usr/local/Cellar/unzip/6.0_2/bin/unzip"
