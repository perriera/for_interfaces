
## How to install the tools necessary for C++11/17 projects
> In this step we need to install all the tools used by this project (that you may or may not already have installed).

 1. **GIVEN** we need to have g++ tools installed 
 2. **WHEN** we update the Ubuntu install and install the tools required
 3. **THEN** we build projects using g++, cmake and  CPM

### Prerequisites
  - [How to install a Linux Platform (Ubuntu 20.04.4)](https://github.com/perriera/extras_dbo/blob/dev/docs/UBUNTU.md)
  - [How to clone your project (with this template)](https://github.com/perriera/extras_dbo/blob/dev/docs/CLONE.md)

 
### Wish Case
Now that you have your project cloned we need to make sure you have the tools necessary to compile properly:

  - [ ] First put **sudo** into ready-to-accept mode
	
		sudo ls
	
 - [ ] Now bring Ubuntu up to date

		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt autoclean -y
		sudo reboot 

 - [ ] Now install gcc build tools

		sudo apt install -y build-essential libtool autotools-dev automake pkg-config git clangd cppcheck clang-tidy python3-pip checkinstall gdb xclip openssh-server

 - [ ] In the interest of simplicity set to temporary environment variables (just for this process)

		MY_EMAIL_IS="myemail@email.com"
		MY_NAME_IS="My Name"

 - [ ] Now setup the git utility for regular access (change "your_email@example.com" and "Your Name" accordingly)

		git config --global user.email ${MY_EMAIL_IS}
		git config --global user.name ${MY_NAME_IS}

  - [ ] Now create an SSH for the Linux box (**do not supply a different filename and leave the pass phrase blank**)

		ssh-keygen -t ed25519 -C ${MY_EMAIL_IS}

  - [ ] Show the SSH public key and remember how to display it when it is needed later on (for SSH authentication)

		cat ~/.ssh/id_ed25519.pub

  - [ ] Also install net-tools and keep track of your ip address:

		sudo apt install net-tools
		ifconfig

  - [ ] Also the name of your user account

		ls /home

  - [ ] As you will be needing your SSH public key, your username and your IP address for SSH purposes (for example):

		ssh dev@211.56.210.32

 - [ ] Assuming that was successful, install CMake 

		sudo apt-get -y install clang-format
		pip install cmake-format
		sudo apt-get update -y 
		sudo apt-get install cmake -y
		sudo apt-add-repository universe -y
		sudo apt-get install cmake-extras -y

 - [ ] Now open the vi editor 

		vi ~/.bashrc
		
 - [ ] APPEND these environment variables to `~/.bashrc `
		
		export PATH=$HOME/.local/bin:${PATH}
		export CPM_SOURCE_CACHE=$HOME/.cache/CPM
		export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}

 - [ ] Then source it ... 

		source ~/.bashrc

 - [ ] Now install Visual Studio Code

		sudo snap install --classic code # or code-insiders

 - [ ] Now remove all unnecessary files 

		sudo apt-get autoremove -y
		sudo apt-get autoclean -y
		sudo apt-get clean -y
		journalctl --disk-usage
		sudo journalctl --vacuum-time=3d
		du -h /var/lib/snapd/snaps

 - [ ] Create the following script: 
 
 		vi ~/.local/bin/xsnap.sh
		
 - [ ] Add the following content

		#!/bin/bash
		echo Removes old revisions of snaps
		echo CLOSE ALL SNAPS BEFORE RUNNING THIS
		echo Attention: **experimental optimization** 
		echo Attention: Have your Linux instance backed up beforehand 
		echo Attention: should snap behave strangely resort to the backup
		read -p "Are you sure you want to reset local SNAPS cache: (y/N)? " name
		if [[ "$name" = "Y" || "$name" = "y" ]];
		then
			echo -e "local SNAPS cache deleted${ANSI_RED}"
			set -eu
			snap list --all | awk '/disabled/{print $1, $3}' |
				while read snapname revision; do
					snap remove "$snapname" --revision="$revision"
			done
		else
			echo -e "local SNAPS cache not deleted${ANSI_RED}"
		fi

 > The above script would free up to a GB of unnecessary files. However, be sure to use it only after a backup of the Linux box as it has been known to screw up the snap utility.

 - [ ] Now execute it

		chmod +x ~/.local/bin/xsnap.sh
		sudo ~/.local/bin/xsnap.sh
		
 - [ ] Now start Visual Studio Code

		mkdir ~/dev
		cd ~/dev
		mkdir sample_project
		cd sample_project
		code .

### Alternate Case 
> Dark Theme
In the case where you start up VSC and the title bar portion of the editor is Light coloured and you desire to have it Dark themed merely do this:
1. Open the Settings app, (click on the bottom left menu and type 'Settings')
2. Select Appearance and then click on the Dark theme

### Alternate Case 
> Semi-transparent Terminal boxes
In the case where you would like your Terminal box to have a certain level of transparency:
1. Open a Terminal box, , (click on the bottom left menu and type 'Terminal')
2. On the top left of the screen click on 'Terminal'
3. Select Preferences -> Unnamed -> Colours 
4. Deselect 'Use transparency from system theme'
5. Select 'Use transparent background'
6. Adjust the scroll bar to your preferred level of transparency
> In this way you'll be able to see things behind your Terminal box, (comes in handy)


### Alternate Case 
> error: snap "code" is not available on stable for this architecture (arm64) but exists on other architectures (amd64).
In the case of the Apple M1 (and you are running Linux under a VM like Parallels or VirtualBox) what you want to do is connect to the Linux box via it's IP address over SSH.
```
sudo apt install net-tools
ifconfig
```
Get the IP address and after adding the ~/.ssh/id_ed25519.pub key to the ~/.ssh/authorized_keys of the Linux box log into it via ssh protocol

### Alternate Case 
> **Visual Studio Code Extensions** </br>
>	Visual Studio Code will detect whatever language you are using and offer to install extentions automatically. Feel free to allow all recommendations as they appear to the bottom right of the Visual Studio Code environment.

### Alternate Case 
> Install cmake using snap:
```
sudo snap install cmake --classic 
```

### Alternate Case 
> **Bad CMake executable "/snap/bin/cmake"** </br>
>	cmake has been going through alot of improvemetns and the latest  method of installation from the command line provides the 3.21 requirement (see [bad cmake executable vscode](https://askubuntu.com/questions/1353824/bad-cmake-executable-vscode)):
```
snap remove cmake -y 
sudo apt-get update -y 
sudo apt-get install cmake -y
sudo apt-add-repository universe -y
sudo apt-get install cmake-extras -y
```

### Alternate Case 
> **Ubuntu 18.04** </br>
>	Slightly different parameters required
```
sudo apt install -y build-essential libtool autotools-dev automake pkg-config git clang-9 cppcheck clang-tidy python3-pip checkinstall gdb gcc-multilib g++-multilib
```
> In the case you've installed a version of gcc / g++ that doesn't ship by default (such as g++-4.8 on lucid) you'll want to match the version as well:
```
sudo apt-get install gcc-4.8-multilib g++-4.8-multilib
```
### Summary 
Now you have installed the development environment and editor for a C++17 project (complete with cmake 3.21 support). The next steps are now to clone the project then setup your changelog.md (for accurate version control).

### Next Steps
 - [How to install the tools necessary for (perriera) / injections](https://github.com/perriera/for_interfaces/blob/main/injections/INSTALL.md)
 - [How to generate a new SSH key for your GitHub.com account](https://github.com/perriera/extras_dbo/blob/dev/docs/SSHKEY.md)
 - [How to clone your project (with this template)](https://github.com/perriera/extras_dbo/blob/dev/docs/CLONE.md)
 - [How to setup your changelog.md](https://github.com/perriera/extras_dbo/blob/dev/docs/CHANGELOG.md)
 - [How to tag your latest revisions](https://github.com/perriera/extras_dbo/blob/dev/docs/TAGIT.md)
