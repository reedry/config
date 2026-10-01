# .zshenv

export LANG=ja_JP.UTF-8
export TERM=xterm-256color

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$HOME/dev/config/bin:$HOME/.cabal/bin:$HOME/.cargo/bin

case "$(uname)" in
  Darwin)
    if [ -x /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    ;;
  Linux)
    export PATH=$PATH:/usr/local/go/bin
    ;;
esac


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# mise が入っている環境では mise に任せる
if ! command -v mise 1>/dev/null 2>&1 && command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
