class git {
	# Install git latest version
	package { "git-core":
		ensure => "present"
	}

	# Symlink my .gitconfig file to $HOME/.gitconfig
	file { "/home/martin/.gitconfig":
		target => source_path("puppet:///modules/git/.gitconfig"),
		ensure => "link",
		owner => "martin",
		group => "martin",
		require => [
			User["martin"],
			Package["git-core"]
		]
	}
}
