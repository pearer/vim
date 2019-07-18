export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lambda-pure"

plugins=(git)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)
source ~/Development/bin/fleetctl.sh
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:~/Development/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/opt/curl/bin
export CDPATH=~/go/src/github.com/optiopay/
export GIT_AUTHOR_EMAIL=$(git config --get user.email)
export GIT_AUTHOR_NAME=$(git config --get user.name)

alias gitk="/usr/bin/wish $(which gitk)"

fpath=(/usr/local/share/zsh-completions $fpath)
fpath+=~/.zfunc

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
