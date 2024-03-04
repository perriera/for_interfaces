## How to install Linux using `multipass` on Mac (OS X)
> In this step we show how to install multipass on OS X (mac)

 1. **GIVEN** we need to be able to run Linux apps on OSX and Windows
 2. **WHEN** we install multipass on OSX or Windows 
 3. **THEN** we can launch an instance of Ubuntu 22.04 

### Prerequisites
- [How to install Multipass on macOS](https://multipass.run/docs/installing-on-macos#heading--install-upgrade-uninstall)  
- [Multipass Documentation](https://multipass.run/docs)
- OSX based computer
- sudo privilages 

### Wish Case

  - Go to the [website and download the installer for OSX](https://multipass.run/docs/installing-on-macos#heading--install-upgrade-uninstall)
  - Once installed in a Terminal box do this:
	
		multipass launch
		multipass list

- Right here identify the name of the newly created Ubuntu 22 instance, (for example):

		Name                    State             IPv4             Image
		observant-earwig        Running           192.168.64.2     Ubuntu 22.04 LTS

- multipass creates a Ubuntu 22.04 instance (by default) and issues it a random name:

		MY_NAME_IS=observant-earwig

- Now stop the instance:

		multipass stop ${MY_NAME_IS}

- Now reconfigure the instance:

		multipass set local.${MY_NAME_IS}.memory=8G
		multipass set local.${MY_NAME_IS}.cpus=2   
		multipass set local.${MY_NAME_IS}.disk=64GB

- Now restart the instance:

		multipass start ${MY_NAME_IS}
		multipass shell ${MY_NAME_IS}

 - Once inside the instance create a dev user:

		sudo adduser dev

 - Added dev to the sudo group and make sure it works:

		sudo adduser dev sudo
		su dev

 - From here you can now exit of the new Linux instance and make a backup:

		multipass stop ${MY_NAME_IS}
		multipass snapshot ${MY_NAME_IS} --name "e1"
		multipass list --snapshots

 - Now restart the instance and update it:

		multipass shell ${MY_NAME_IS}
		su dev

 - Now update it:

 		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt autoclean -y
		sudo reboot 

### Alternate Case
#### Added GUI
`multipass` is very cutting edge in that it is possible to add gui access to the instance either using **x11** or even `Microsoft Remote Desktop` (available on the **App Store**) without too much trouble at all:

	sudo apt update
	sudo apt install ubuntu-desktop xrdp

On macOS we can use the “Microsoft Remote Desktop” application, from the Mac App Store. Once installed use the username and password for `dev`:

- for more see [How to set up a graphical interface](https://multipass.run/docs/set-up-a-graphical-interface)

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

 - see [Creating a Backup of a Multipass Instance](https://github-wiki-see.page/m/dialloi659/multipass/wiki/Creating-a-Backup-of-a-Multipass-Instance)

### Summary
`multipass` appears to be a streamlined version of Docker for the purposes of running Ubuntu 22.04 on all major platforms. 

### Next Steps

- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/linux/INSTALL.md)
- [How to install (perriera) / injections](https://github.com/perriera/for_interfaces/blob/main/injections/INSTALL.md)
- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
- [How to run Ubuntu 22.04 VMs on Apple M1 ARM-based systems for free](https://multipass.run/docs/installing-on-macos)
- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
- [How can I change memory (RAM) size of existing Multipass virtual machine?](https://github.com/canonical/multipass/issues/1265)

