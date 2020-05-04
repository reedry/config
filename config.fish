set -x LANG ja_JP.UTF-8

set -gx PYENV_ROOT $HOME/.pyenv
set -x PATH $PATH $PYENV_ROOT/bin
status --is-interactive; and source (pyenv init -|psub)

set -x PATH $PATH $HOME/.cargo/bin

set -x PATH $PATH $HOME/.yarn/bin

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.roswell/bin

# opam configuration
source /home/ry/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# fish_color
set fish_color_command blue
