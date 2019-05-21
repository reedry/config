# .zshrc

source ~/.zplug/init.zsh

zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zplug/zplug'

zplug load

precmd() {
  echo -ne "\033]0;${USER}@${HOST} ${PWD}\007"
}

autoload -Uz colors
colors

# source ~/.zsh/sol.dark
eval `dircolors ~/.zsh/dircolors.ansi-dark`

autoload -Uz add-zsh-hook
source ~/.zsh/myprompt.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit -u

cdpath=(.. ../.. ~ ~/dev)

setopt auto_menu
setopt auto_list
setopt auto_param_keys
setopt auto_param_slash
setopt print_eight_bit

setopt auto_cd
setopt correct
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt sharehistory

setopt nobeep
setopt ignore_eof

alias ls='ls --color=auto'
alias pd='popd'
alias vi='vim'
alias ...='cd ../..'
alias ....='cd ../../..'

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
