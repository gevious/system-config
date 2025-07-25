EDITOR=nvim
alias ed=$EDITOR
alias nv=$EDITOR
alias vi=nvim

export XDG_CONFIG_HOME=$HOME/.config
VIM="nvim"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export GIT_EDITOR=$EDITOR

export PATH=$HOME/.config/gevious-scripts:$PATH

## Magic script from the Primeagen to move between workspaces
bindkey -s ^f "tmux-sessionizer\n"