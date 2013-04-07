Exec {
 	path => '/usr/bin:/bin:/usr/sbin:/sbin'
}

# Include Richard Clamp's puppet path functions. See https://github.com/richardc/puppet-path_functions
include path_functions

package { "zsh":
	ensure => "present"
}

# Make sure I exist.
user { "martin":
	managehome => true,
	ensure => "present",
	shell => "/bin/zsh",
	require => Package["zsh"]
}

# Install all of the packages I need that require no configuration
include commonpackages

# Install and configure git
include git

# Install and configure zsh
include zsh

# Include tmux with tmux conf
include tmux
# zsh, tmux, mpd, git-core

