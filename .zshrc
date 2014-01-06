# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=tonotdo

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

export SSDIR=~/Documents/SS/

alias grep="grep -E --exclude=\"*~\" --exclude=\"*.pyc\" -I"
alias ssgrep="grep --exclude-dir tests --exclude-dir migrations"
alias :e=vim #bc im dumb
alias :q=exit #also bc im dumb
alias gtags="git tag | perl -ne 'next unless /^\d+(\.\d+)+\$/; printf \"%s\n\", join(\".\", map { sprintf \"%03d\", \$_ } split(/\./, \$_));' | sort -g | perl -pe 's/0+(\d)/\$1/g'"

alias resource=". ~/.zshrc"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

function _ll () {
  ls -al $1 | grep ~$ -v | grep pyc$ -v
}

alias ll=_ll
alias l=_ll #this gets overwritten by ZSH

# Customize to your needs...
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH


stty -ixon
ssh-add
