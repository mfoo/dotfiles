
# Set GNU Grep to use colours by default and ignore errors about files not
# existing or being unreadable
GREP_OPTIONS=' --color=auto'

# Stop 'grep -r' searches including repository folders
# Wrapped in an if because older Grep versions (such as the mac default) don't
# support --exclude-dir
if grep --help | grep -- --exclude-dir &>/dev/null; then
    for PATTERN in .cvs .git .hg .svn; do
        GREP_OPTIONS="$GREP_OPTIONS --exclude-dir=$PATTERN"
    done
fi
export GREP_OPTIONS

export TERM="xterm-256color"
export EDITOR=vim

# Add my scripts to the path
export PATH=~/bin/:$PATH

# MacPorts
export PATH=$PATH:/opt/local/bin

# Android SDK
export PATH=$PATH:$HOME/Android/android-sdk-mac_x86/tools/
export PATH=$PATH:$HOME/Android/android-sdk-mac_x86/platform-tools/
# CMake-android
export ANDROID_NDK=$HOME/Android/android-ndk-r7
export ANDROID_NDK_TOOLCHAIN_ROOT=$HOME/android-toolchain
export ANDTOOLCHAIN=$HOME/android-cmake/toolchain/android.toolchain.cmake
alias android-cmake='cmake -DCMAKE_TOOLCHAIN_FILE=$HOME/android-cmake/toolchain/android.toolchain.cmake '

# Enable git autocompletion in bash
source ~/.git-completion.bash

# Enable Vi mode for command editing on the command line.
set -o vi

# make it possible to pass file names from gcc errors, e.g. “foo.c:3:14:”,
# directly to vim and have vim jump to line 3, column 14.
# Function source http://hamberg.no/erlend/2011/12/14/making-vim-go-to-the-correct-linecolumn-when-given-a-file-name-from-gcc/

vim()
{
    if [[ $# -eq 1 && $1 =~ (.*):([[:digit:]]+):([[:digit:]]+): ]]; then
        FILE="${BASH_REMATCH[1]}"
        LINE="${BASH_REMATCH[2]}"
        COL="${BASH_REMATCH[3]}"
        $(which vim) -c "call cursor($LINE,$COL)" $FILE
    else
        $(which vim) $@
    fi
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:/usr/local/apache-maven-3.0.4/bin

function sshfwd {
   ssh devel.modeltwozero.com -L 8080:localhost:80 -N &
}

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
