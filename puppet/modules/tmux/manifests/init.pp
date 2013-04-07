class tmux {

	package { "tmux":
		ensure => "present"
	}

        # Symlink my .tmux.conf file to $HOME/.tmux.conf
        file { "/home/martin/.zshrc":
                target => source_path("puppet:///modules/tmux/.tmux.conf"),
                ensure => "link",
                owner => "martin",
                group => "martin",
                require => [
                        User["martin"],
                        Package["tmux"]
                ]
        }
}
