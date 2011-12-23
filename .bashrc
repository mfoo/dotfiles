alias grep='grep --color=auto'

export EDITOR=vim

# Add my scripts to the path
export PATH=~/bin/:$PATH

# MacPorts
export PATH=$PATH:/opt/local/bin

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
