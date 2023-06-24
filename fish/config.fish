set -x LANG ja_JP.UTF-8

# PYENV
# set -gx PYENV_ROOT $HOME/.pyenv
# set -x PATH $PATH $PYENV_ROOT/bin
# status --is-interactive; and source (pyenv init -|psub)

set -x PATH $PATH $HOME/.cargo/bin

set -gx GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin

set -x PATH $PATH $HOME/.yarn/bin

set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.roswell/bin

# Alias
alias vim=nvim

# opam configuration
source /home/ry/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# fish_color
set fish_color_command white
