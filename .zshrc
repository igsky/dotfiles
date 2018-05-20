# Default editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Go related config
# Point to the location beneath which source and binaries are installed.
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=${PATH}:${GOROOT}/bin
export PATH=${PATH}:${GOPATH}/bin

# Add access to custom binaries
export PATH=${PATH}:~/opt/bin

export DEFAULT_USER="$(whoami)"
export TERM="xterm-256color"

alias git-uncommit='git reset --soft HEAD~'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
ENABLE_CORRECTION="true" # Command auto-correction
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions zsh-256color kubectl)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=117'

fpath=(~/.zsh/completion ~/.oh-my-zsh/custom/plugins/zsh-256color ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ~/.oh-my-zsh/plugins/git ~/.oh-my-zsh/functions ~/.oh-my-zsh/completions /usr/local/share/zsh/site-functions /usr/share/zsh/vendor-functions /usr/share/zsh/vendor-completions /usr/share/zsh/functions/Calendar /usr/share/zsh/functions/Chpwd /usr/share/zsh/functions/Completion /usr/share/zsh/functions/Completion/AIX /usr/share/zsh/functions/Completion/BSD /usr/share/zsh/functions/Completion/Base /usr/share/zsh/functions/Completion/Cygwin /usr/share/zsh/functions/Completion/Darwin /usr/share/zsh/functions/Completion/Debian /usr/share/zsh/functions/Completion/Linux /usr/share/zsh/functions/Completion/Mandriva /usr/share/zsh/functions/Completion/Redhat /usr/share/zsh/functions/Completion/Solaris /usr/share/zsh/functions/Completion/Unix /usr/share/zsh/functions/Completion/X /usr/share/zsh/functions/Completion/Zsh /usr/share/zsh/functions/Completion/openSUSE /usr/share/zsh/functions/Exceptions /usr/share/zsh/functions/MIME /usr/share/zsh/functions/Misc /usr/share/zsh/functions/Newuser /usr/share/zsh/functions/Prompts /usr/share/zsh/functions/TCP /usr/share/zsh/functions/VCS_Info /usr/share/zsh/functions/VCS_Info/Backends /usr/share/zsh/functions/Zftp /usr/share/zsh/functions/Zle)

autoload -Uz compinit && compinit -i
