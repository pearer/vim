export ZSH=$HOME/.oh-my-zsh

# https://github.com/eendroroy/nothing
ZSH_THEME="nothing"
NT_HIDE_COUNT=1

plugins=(git)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
#export GOPATH=$HOME/Development/go
#export GOROOT=/usr/local/opt/go/libexec
#export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:~/Development/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/opt/curl/bin

# export CDPATH=~/Development/go/src/github.com/styutnev/

export GIT_AUTHOR_EMAIL=$(git config --get user.email)
export GIT_AUTHOR_NAME=$(git config --get user.name)

export PYTHONDONTWRITEBYTECODE=1

#alias gitk="/usr/bin/wish $(which gitk)"

fpath=(/usr/local/share/zsh-completions $fpath)
fpath+=~/.zfunc

# brew install ...
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
