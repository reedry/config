set -gx PYENV_ROOT $HOME/.pyenv
set -x PATH $PATH $PYENV_ROOT/bin
pyenv init - | source

set -x PATH $PATH $HOME/.cargo/bin

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
