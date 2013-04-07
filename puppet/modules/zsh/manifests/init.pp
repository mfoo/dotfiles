class zsh {
	# Install zsh
	package { "zsh":
		ensure => "present"
	}

	# Symlink my .zshrc file to $HOME/.zshrc
	file { "/home/martin/.zshrc":
		target => "puppet:///modules/zsh/.zshrc",
		ensure => "link",
		require => [
			User["martin"],
			Package["zsh"]
		]
	}
}
