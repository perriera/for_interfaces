 - [ ] Now setup your client account to access your private server

		git config --global user.name “git”
		git config --global user.email “git@gitserver”

 - [ ] Now create an **.ssh** key and share it with the server

		ssh-keygen -t ed25519 -C “git@gitserver”

 - [ ] Now add that key to the **git** user account

		cat ~/.ssh/id_ed25519.pub > /tmp/key.txt