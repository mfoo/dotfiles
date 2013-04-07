if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="norm"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails bundler mvn rake autojump vagrant knife)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export TERM=screen-256color

export PATH=/home/martin/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/local/bin

[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

# Allow comments even in interactive shells
setopt interactive_comments

# Manually disable autocorrect for some commands
alias rspec='nocorrect rspec ' 
alias bundle='nocorrect bundle'

GREP_OPTIONS=
for PATTERN in .cvs .git .hg .svn; do
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


