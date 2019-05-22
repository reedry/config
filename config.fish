set -gx PYENV_ROOT $HOME/.pyenv
set -x PATH $PATH $PYENV_ROOT/bin
pyenv init - | source

set -x PATH $PATH $HOME/.cargo/bin
