# Install Library for Golang dev

## Install HomeBrew

```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

## Install Iterm2 (optional)

```brew cask install iterm2```

## Install go
```brew install golang```

## Setup Environment
We’ll need to add to .bashrc or .zshrc (if you’re using zsh) with the following info. (Ex: nano ~/.bashrc )
```
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
```