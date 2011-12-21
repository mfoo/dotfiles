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
