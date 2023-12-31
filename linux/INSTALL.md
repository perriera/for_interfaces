
## How to install the tools necessary for C++11/17 projects
> In this step we need to install all the tools used by this project (that you may or may not already have installed.

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

		sudo apt install -y build-essential libtool autotools-dev automake pkg-config git clangd cppcheck clang-tidy python3-pip checkinstall gdb

 - [ ] Assuming that was successful, install CMake 

		sudo apt-get -y install clang-format
		pip install cmake-format
		sudo snap install cmake --classic 

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

 - [ ] Create the following script: `vi ~/xsnap.sh`
		
		#!/bin/bash
		# Removes old revisions of snaps
		# CLOSE ALL SNAPS BEFORE RUNNING THIS
		set -eu
		snap list --all | awk '/disabled/{print $1, $3}' |
			while read snapname revision; do
				snap remove "$snapname" --revision="$revision"
		done

 - [ ] Now execute it

		chmod +x ~/xsnap.sh
		sudo ~/xsnap.sh
		
 - [ ] Now start Visual Studio Code

		cd <into your project directory>
		code .

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
> **Bad CMake executable "/snap/bin/cmake"** </br>
>	cmake has been going through alot of improvemetns and the latest  method of installation from the command line provides the 3.21 requirement (see [bad cmake executable vscode](https://askubuntu.com/questions/1353824/bad-cmake-executable-vscode)):
```
snap remove cmake
sudo apt-get update
sudo apt-get install cmake
sudo apt-add-repository universe
sudo apt-get install cmake-extras
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
Now you have instaled the development environment and editor for a C++17 project (complete with cmake 3.21 support). The next steps are now to clone the project then setup your changelog.md (for accurate version control).

### Next Steps
 - [How to generate a new SSH key for your GitHub.com account](https://github.com/perriera/extras_dbo/blob/dev/docs/SSHKEY.md)
 - [How to clone your project (with this template)](https://github.com/perriera/extras_dbo/blob/dev/docs/CLONE.md)
 - [How to setup your changelog.md](https://github.com/perriera/extras_dbo/blob/dev/docs/CHANGELOG.md)
 - [How to tag your latest revisions](https://github.com/perriera/extras_dbo/blob/dev/docs/TAGIT.md)
