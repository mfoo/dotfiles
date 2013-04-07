class commonpackages {
	$packages = [
		"curl",
		"ruby",
		"cmake",
		"valgrind",
		"clang",
		"build-essential",
		"maven",
		"libboost-all-dev",
		"ncmpcpp",
		"kdiff3",
		"meld",
		"openssh-server",
		"libxerces-c-dev",
		"mysql-server"
	]
	
	package {
	        $packages: ensure => "present"
	}
}
