# LOAD PATHS
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/google-cloud-sdk/bin:$PATH

PATH="/usr/local/opt/mysql@5.7/bin":$PATH
PATH="/usr/local/opt/swagger-codegen@2/bin:$PATH"

PATH="$HOME/.anyenv/bin":$PATH
PATH="$HOME/.anyenv/shims":$PATH
PATH="$HOME/Downloads:$PATH"
eval "$(anyenv init -)"

# eval "$(pipenv --completion)"

# DIRENV
eval "$(direnv hook bash)"

PATH="/usr/local/opt/openssl/bin:$PATH"
PATH="/usr/local/opt/go/bin:$PATH"

GOPATH=$HOME
GHQ_ROOT="$HOME/repositories"

## EXPORT
export LANG=ja_JP.UTF-8
export TERM=xterm-256color
export PATH
export GOPATH
export GHQ_ROOT
export EDITOR=mine
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

## ALIASES
alias ls='ls -alG'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

alias g!='open https://github.com/'
alias c!='open https://circleci.com/'

alias ga='git add -p'
alias gb='git branch'
alias gd='git diff HEAD'
alias gf='git fetch -p'
alias gl='git log --graph --decorate --oneline'
alias gs='git status'
alias gv='open -a /Applications/MacVim.app $@'

alias pecog='cd $(ghq list --full-path | peco)'
alias pecogb='$(git branch | sed "s/^[ *]*//" | peco)'

alias c.='cd ../'
alias c..='cd ../../'
alias c...='cd ../../../'

alias tt=tmux


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shinyasugo/google-cloud-sdk/path.bash.inc' ]; then . '/Users/shinyasugo/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shinyasugo/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/shinyasugo/google-cloud-sdk/completion.bash.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/shinyasugo/.sdkman"
[[ -s "/Users/shinyasugo/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/shinyasugo/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/sbin:$PATH"
