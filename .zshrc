if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="norm"
ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git                     # Add a large number of git aliasses
  rails                   # Add rails3 commands rc (rails console), rs (rails server)
  bundler                 # Adds be (bundle exec), bu (bundle update) and bi (bundle install)
  redis-cli               # Completion for redis-cli
  tmux                    # Configuration options for tmux with zsh
  mvn                     # Add command line completion for maven
  rake
  autojump                # Enables autojump if installed
  vagrant                 # Adds vagrant command autocompletion
  web-search              # Adds support for "google foo" opening a google search
  command-not-found       # If a command can't be found, check apt to see which package contains it
  gitfast                 # Enable fast zsh git completion
  git-extras              # Enable git-extras command completion
  jira
  autojump                # Enable autojump if installed
  coffee                  # CoffeeScript completion
  debian                  # Apt completion
  dircycle                # Ctrl+Shift+left/right for directory up/down
  docker                  # Completion for docker
  gem                     # Completion for rubygems
  pip                     # Completion for pip
  sbt                     # Completion for sbt
  web-search
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export TERM=screen-256color

export LANG=en_GB.utf8

export PATH=/home/martin/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/local/bin

[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

# Allow comments even in interactive shells
setopt interactive_comments

# Manually disable autocorrect for some commands
alias rspec='nocorrect rspec '
alias bundle='nocorrect bundle'
alias -g bec='bundle exec cucumber'
alias -g gp='| grep -i'
alias -s rb=vim
alias -s h=vim
alias -s cpp=vim
alias -s log=less -R

GREP_OPTIONS=' --color=auto --exclude=*.o'
for PATTERN in .cvs .git .hg .svn docs; do
    GREP_OPTIONS="$GREP_OPTIONS --exclude-dir=$PATTERN"
done
export GREP_OPTIONS

# Via http://indlovu.wordpress.com/2010/07/26/useful-bash-functions/
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1         ;;
            *.tar.gz)    tar xzf $1         ;;
            *.bz2)       bunzip2 $1         ;;
            *.rar)       rar x $1           ;;
            *.gz)        gunzip $1          ;;
            *.tar)       tar xf $1          ;;
            *.tbz2)      tar xjf $1         ;;
            *.tgz)       tar xzf $1         ;;
            *.zip)       unzip $1           ;;
            *.Z)         uncompress $1      ;;
            *.7z)        7z x $1            ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

stty start undef stop undef


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:~/Repositories/play-2.1.0
export EDITOR=vim
alias vr='vagrant destroy -f && vagrant up'
export PATH=/home/martin/.rvm/gems/ruby-1.9.3-p362/bin:/home/martin/.rvm/gems/ruby-1.9.3-p362@global/bin:/home/martin/.rvm/rubies/ruby-1.9.3-p362/bin:/home/martin/.rvm/bin:/home/martin/.autojump/bin:/home/martin/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/local/bin:/home/martin/Repositories/play-2.1.0:$PATH
export PATH=/home/martin/Repositories/devops-cube/scripts:$PATH
export PATH=$PATH:~/bin/play-2.2.1

function git-find-file () {
for branch in $(git rev-list --all)
do
    if (git ls-tree -r --name-only $branch | grep --quiet "$1") 
        then
           echo $branch
        fi
    done
}

# Automatically start a tmux session upon logging in
ZSH_TMUX_AUTOSTART=true

JIRA_URL='http://jira.intranet'
export EZ_HOME=~/Repositories/entropyzero/Core-C++/Engine-JNI

alias fuck='sudo $(fc -ln -1)'
