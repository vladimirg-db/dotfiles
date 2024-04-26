export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"
plugins=(bazel colored-man-pages fd git github scala vi-mode)
source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'
eval $(/opt/homebrew/bin/brew shellenv)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias vim=nvim

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
	autoload -Uz compinit
	compinit
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/azul-17.0.10/Contents/Home"
export SPARK_HOME="$HOME/spark"
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
export PATH="$PATH:$HOME/usr/bin"
export PATH="$PATH:$HOME/go/bin"

complete -W "$(kubectl config get-contexts -o name | sed 's/$/ /' | tr '\n' ' ')" lens
