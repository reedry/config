# .zshenv

export LANG=ja_JP.UTF-8
export TERM=xterm-256color

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/dev/config/bin:$HOME/.cabal/bin:$HOME/.cargo/bin


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
