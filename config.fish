set -x LANG ja_JP.UTF-8

set -gx PYENV_ROOT $HOME/.pyenv
set -x PATH $PATH $PYENV_ROOT/bin
status --is-interactive; and source (pyenv init -|psub)

set -x PATH $PATH $HOME/.cargo/bin

set -x PREFIX $HOME/.n
set -x N_PREFIX $HOME/.n
set -x PATH $PATH $N_PREFIX/bin

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# opam configuration
source /home/ry/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
alias ocaml="rlwrap ocaml"

set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.roswell/bin
