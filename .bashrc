#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin


# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='kiro'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="/usr/bin/vim"
export GIT_EDITOR='/usr/bin/vim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK


# Change this to your console based IRC client of choice.

export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh
export GPG_TTY=$(tty)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/kiro/.sdkman"
[[ -s "/home/kiro/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kiro/.sdkman/bin/sdkman-init.sh"

# add goland 1.10
export PATH="$PATH:/usr/local/go/bin/"
# Add ruby 2.3 bins
export PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin/"
# Add golang path
export GOPATH="$HOME/golang"
export GOBIN="$HOME/golang/bin"
export PATH="$PATH:${GOBIN}"

# Use newer go
export PATH="/opt/golang/1.13.4/go/bin:$PATH"

# Local bin
export PATH="/home/kiro/.local/bin/:$PATH"
# Root bin
export PATH="$PATH:/opt/bin"
# Cabal (Haskell) bin
export PATH="$PATH:${HOME}/.cabal/bin"
# NPM Dir
NPM_DIR="${HOME}/.local/share/npmi/node-v12.10.0-linux-x64"
export PATH="${NPM_DIR}/bin/:${PATH}"

source ~/.aliases

#### CS 4760
export GRAILS_HOME="/home/kiro/git/grails/frameworks/grails-3.3.8"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
