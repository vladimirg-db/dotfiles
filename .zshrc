export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"
plugins=(bazel colored-man-pages fzf git github scala vi-mode zsh-fzf-history-search)
source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'

alias vim=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
export PATH="$PATH:$HOME/usr/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/share/coursier/bin"
export PATH="$PATH:/usr/local/go/bin"

complete -W "$(kubectl config get-contexts -o name | sed 's/$/ /' | tr '\n' ' ')" lens
