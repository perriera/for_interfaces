## How to install `multipass` on Windows 
> **Given** we need to develop Linux apps using Linux (as you would) but need the ability to recover from a malfunction quickly and easily **when** we install `multipass` for Windows on top of the natively installed Windows **then** we can easily backup and restore instances of any given Linux distribution quickly and easily  

### Prerequisites
- [How to install Multipass on Windows](https://multipass.run/docs/installing-on-windows)  
- [Multipass Documentation](https://multipass.run/docs)
- [Install Hyper-V on Windows 10](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)
- Windows 10/11 based operating system
- admin privilages 

### Wish Case
#### Install
  - [Download the latest installer for Windows 10/11](https://multipass.run/download/windows) 
  - Run the installer and it will guide you through the steps necessary. 
  - You will need to allow the installer to gain Administrator privileges.
  - You will need either Hyper-V enabled (only Windows 10 Professional or Enterprise), or VirtualBox installed.

	- **Note**: Enabling the Hyper-V is an important step
	- Depending on how you installed Windows 10/11 it must be activated
	- On Parallels Desktop do a Search (in the Configuration) for `Hyper`

  - To upgrade, just [download the latest installer](https://multipass.run/download/windows) and run it.
  - You will be asked to uninstall the old version, and a second question about whether to remove all data when uninstalling. 
  - If you want to keep your instances, answer “No” (the default).

#### Run

  - Now, to run normal Multipass commands, open either Command Prompt (cmd.exe) or PowerShell as a regular user. 
  - Use `multipass version` to check your version or `multipass launch` to create your first instance.

		multipass version
		multipass launch
		multipass list

 Note: As of this writing the Hyper-V activation has issues. 
       Until this is resolved we will recommend setting up a Linux box 
	   to be accessed from Windows 10/11 using another method.

- Right here identify the name of the newly created Ubuntu 22 instance, (for example):

		Name                    State             IPv4             Image
		breezy-dolphin          Running           192.168.64.3     Ubuntu 22.04 LTS
		observant-earwig        Running           192.168.64.2     Ubuntu 22.04 LTS

- multipass creates a Ubuntu 22.04 instance (by default) and issues it a random name:

		MY_NAME_IS=breezy-dolphin
		multipass stop ${MY_NAME_IS}

- Now set the desired amount of RAM:

		multipass set local.${MY_NAME_IS}.memory=8G

- Now set the desired number of CPUS:

		multipass set local.${MY_NAME_IS}.cpus=2   

- Now set the desired number of HARDDISK:

		multipass set local.${MY_NAME_IS}.disk=64GB

- Now shell into ${MY_NAME_IS}:

		multipass shell ${MY_NAME_IS}

	When the Ubuntu instance starts up again take note of it's welcome screen:

		System load:           0.080078125
		Usage of /:            2.6% of 61.84GB
		Memory usage:          3%
		Swap usage:            0%
		Processes:             130
		Users logged in:       0
		IPv4 address for ens3: 192.168.64.3
		IPv6 address for ens3: fdf4:54a2:bb80:ad36:5054:ff:feea:532a

- Once inside the root terminal window and add a dev account:

		sudo useradd -p $(openssl passwd -1 password) dev
		sudo adduser dev sudo
		su dev

	**Optional**: Replace `password` with a password of choice

 - Now go into `sudo mode`:

		cd ~
		sudo ls

 	Update the system:

 		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt autoclean -y
		sudo reboot 

 - From here you can backup the instance

		multipass stop ${MY_NAME_IS}
		multipass snapshot ${MY_NAME_IS} --name "e1"
		multipass list --snapshots

 - Now restart the instance as `dev`

		multipass shell ${MY_NAME_IS}
		su dev

### Alternate Case
#### pre-release versions from our GitHub releases
You can also get pre-release versions from [our GitHub releases page](https://github.com/CanonicalLtd/multipass/releases/) - it’s the .exe file

### Alternate Case
#### In the case you’d like to use VirtualBox
You can do so with:

	multipass set local.driver=virtualbox

### Alternate Case
#### Added GUI
`multipass` is very cutting edge in that it is possible to add gui access to the instance either using **x11** or even `Microsoft Remote Desktop` (available on the **App Store**) without too much trouble at all:

	sudo apt update
	sudo apt install ubuntu-desktop xrdp

- see [How to set up a graphical interface](https://multipass.run/docs/set-up-a-graphical-interface)

### Alternate Case
#### Can't access the Internet? (but a `sudo update` still works?)
OSX might have firewall setup:
 - see [How to troubleshoot networking](https://multipass.run/docs/troubleshoot-networking#heading--dns-problems)

### Alternate Case
#### Can do a restore from a backup?
Backups with multipass are very fast but require the instance to be stopped first:

 Create a Snapshot

	multipass stop dapper-manakin
	multipass snapshot observant-earwig --name "e1"

Restore from a Snapshot

	multipass list --snapshots
	multipass restore observant-earwig.e1 
	multipass start observant-earwig

Delete a Snapshot

	multipass delete --purge observant-earwig.e1
	
 - see [Creating a Backup of a Multipass Instance](https://github-wiki-see.page/m/dialloi659/multipass/wiki/Creating-a-Backup-of-a-Multipass-Instance)

### Summary
`multipass` appears to be a streamlined version of Docker for the purposes of running Ubuntu 22.04 on all major platforms. 

### Next Steps

- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/linux/INSTALL.md)
- [How to install injections.io(C++17)](https://github.com/perriera/injections)
- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
- [How to run Ubuntu 22.04 VMs on Apple M1 ARM-based systems for free](https://multipass.run/docs/installing-on-macos)
- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
- [How can I change memory (RAM) size of existing Multipass virtual machine?](https://github.com/canonical/multipass/issues/1265)

