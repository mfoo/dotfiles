alias grep='grep --color=auto'

export EDITOR=vim
export PATH=$PATH:~/bin/

export ANDROID_NDK=~/Android/android-ndk-r6b
export ANDTOOLCHAIN=~/android-cmake/toolchain/android.toolchain.cmake
alias android-cmake='cmake -DCMAKE_TOOLCHAIN_FILE=/Users/martin/android-cmake/toolchain/android.toolchain.cmake '


# Enable Vi mode for command editing on the command line.
set -o vi
