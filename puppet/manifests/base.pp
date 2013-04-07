Exec {
 	path => '/usr/bin:/bin:/usr/sbin:/sbin'
}

# Include Richard Clamp's puppet path functions. See https://github.com/richardc/puppet-path_functions
include path_functions

# Make sure I exist.
user { "martin":
	managehome => true,
	ensure => "present"
}

# Install all of the packages I need that require no configuration
include commonpackages

# Install and configure git
include git

#include zsh

# zsh, tmux, mpd, git-core

