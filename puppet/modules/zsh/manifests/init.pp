class zsh {
	# Symlink my .zshrc file to $HOME/.zshrc
	file { "/home/martin/.zshrc":
		target => source_path("puppet:///modules/zsh/.zshrc"),
		ensure => "link",
		owner => "martin",
		group => "martin",
		require => [
			User["martin"],
			Package["zsh"]
		],
		creates => "/home/martin/.zshrc"
	}

	# Install oh-my-zsh
	exec { "install oh-my-zsh":
		cwd => "/home/martin",
		user => "martin",
		group => "martin",
		command => "git clone git://github.com/robbyrussell/oh-my-zsh.git /home/martin/.oh-my-zsh",
		require => [
			User["martin"],
			Package["git-core"],
			Package["zsh"]
		],
		creates => "/home/martin/.oh-my-zsh"
	}
}
