## How to install Ubuntu 22.04 using `multipass` on Mac (OS X)
> **Given** we need to develop Linux apps using Linux (as you would) but need the ability to recover from a malfunction quickly and easily **when** we install `multipass` for macOS on top of the natively installed macOS **then** we can easily backup and restore instances of any given Linux distribution quickly and easily  

### Prerequisites
- [How to install `multipass` on macOS](https://multipass.run/docs/installing-on-macos#heading--install-upgrade-uninstall)  
- [Multipass Documentation](https://multipass.run/docs)
- [Install Multipass](https://multipass.run/install)
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

	Whatever random name was listed (instead of `observant-earwig` was listed change the assignment to that random name)

- Now stop the instance:

		multipass stop ${MY_NAME_IS}

- Now reconfigure the instance:

		multipass set local.${MY_NAME_IS}.memory=8G
		multipass set local.${MY_NAME_IS}.cpus=2   
		multipass set local.${MY_NAME_IS}.disk=64GB
		multipass mount $HOME $MY_NAME_IS:/media/psf/home

	The system is now configured for 8GB of ram, 2 cpus and a 64GB hard disk. It will also mount your $HOME folder to a folder inside the new Linux instance (using a Parallels Desktop file naming convention as `/media/psf/home`), (feel free to adjust the naming convention as necessary).

- Now restart the instance:

		multipass shell ${MY_NAME_IS}

 - Once back inside the instance review it's start up page for the new memory, cpu count, disk size as well as the contents of the shared host directory:

	You would see something like this:

		Welcome to Ubuntu 22.04.4 LTS (GNU/Linux 5.15.0-101-generic x86_64)

		* Documentation:  https://help.ubuntu.com
		* Management:     https://landscape.canonical.com
		* Support:        https://ubuntu.com/pro

		System information as of Wed Mar 27 23:21:00 PDT 2024

		System load:           0.080078125
		Usage of /:            2.6% of 61.84GB
		Memory usage:          2%
		Swap usage:            0%
		Processes:             133
		Users logged in:       0
		IPv4 address for ens3: 192.168.64.7
		IPv6 address for ens3: fdf4:54a2:bb80:ad36:5054:ff:fed3:4f8f
		
 - Also checkout contents of the shared host directory:

		ls /media/psf/home/

	Which might look something like this:

		'Applications (Parallels)'   Documents   Dropbox   Movies           
    	Desktop   Downloads   Library   Music    Pictures  

 - Now update the instance:

 		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt autoclean -y
		sudo reboot 

- Now with multipass (like Docker) it is possible to run commands inside a Ubuntu instance without going into a shell:

		multipass exec $MY_NAME_IS -- lsb_release -a

	The above will produce something like this:

		No LSB modules are available.
		Distributor ID:	Ubuntu
		Description:	Ubuntu 22.04.4 LTS
		Release:	22.04
		Codename:	jammy

- Now reenter the instance as a shell:

		multipass shell ${MY_NAME_IS}

 - Once inside the instance create a dev user:

		sudo adduser dev

 - Added dev to the sudo group and make sure it works:

		sudo adduser dev sudo
		su dev

 - From here you can now exit of the new Linux instance and make a backup:

		exit
		exit
		
 - Now make a backup:

		multipass stop ${MY_NAME_IS}
		multipass snapshot ${MY_NAME_IS} --name "e1"
		multipass list --snapshots

	There is no need to name your backups with the "e1" prefix. This is just how we are doing it here with the idea being that successive backups with be named "e2", "e3" etc, (feel free to adjust the naming convention as necessary).

 - Now restart the instance:

		multipass shell ${MY_NAME_IS}
		su dev

	You are now inside a user account on the new Linux instance. In the case where you expect to want to access the new Linux instance with a GUI front-end see the **Alternate Case** below.

### Alternate Case
#### Add a GUI
`multipass` is very cutting edge in that it is possible to add gui access to the instance either using **x11** or even `Microsoft Remote Desktop` (available on the **App Store**) without too much trouble at all:

	sudo apt update
	sudo apt install ubuntu-desktop xrdp

On macOS we can use the `Microsoft Remote Desktop` application, from the Mac App Store. Once installed use the username and password for `dev`:

- for more see [How to set up a graphical interface](https://multipass.run/docs/set-up-a-graphical-interface)

### Alternate Case
#### openhab
There is an alternative method that might allow better GUI access for the multipass based Ubuntu instance.
 - [Install Multipass](https://multipass.run/install)
 - [How to Get Lynx for Mac OS X](https://osxdaily.com/2011/07/26/get-lynx-for-mac-os-x-10-7-lion/)
 - [Homebrew Documentation](https://docs.brew.sh/Installation) 
 - [MacPorts](https://www.macports.org/install.php)
 - [How to Get Lynx for Mac OS X](https://osxdaily.com/2011/07/26/get-lynx-for-mac-os-x-10-7-lion/)
 - ["sudo: port: command not found" after installing MacPorts on Snow leopard](https://superuser.com/questions/287713/sudo-port-command-not-found-after-installing-macports-on-snow-leopard)

### Alternate Case
#### Rerunning Microsoft Remote Desktop appears to be stuck
According to this posting [Remote Desktop App stuck on "Configuring remote session" but works well on PC](https://learn.microsoft.com/en-us/answers/questions/649233/remote-desktop-app-stuck-on-configuring-remote-ses) the only solution (which is typical of Microsoft projects) is to remove it completely (with a proper software uninstaller) and then reinstall from the AppStore. 
> "It appears to be a problem with the app. If you are trying to connect to an older PC, before it connects it has a screen that says "Identity of remote PC can't be verified." If you check the box "Never ask again for connections to this PC" and then connect, you will never be able to connect again (for my remote XP computer but not my remote Windows 10 computer). Apparently, it prevents asking and answering the question when it should automatically answer "Connect." The only solution I found on my Android was to delete all the App data (App Info, Storage, Clear Data). You lose all your connection data (PC's, Gateways, and User Accounts) so you're starting all over." -- George Bradley, Oct 20, 2023

### Alternate Case
#### Sharing data with the host operating system
The recommended way to share data between your host and an instance with Multipass is the mount command:
`multipass mount $HOME $MY_NAME_IS:/media/psf/home` where `$MY_NAME_IS` is the name of the running instance
```
$ multipass mount $HOME keen-yak
$ multipass info keen-yak
…
Mounts:         /home/michal => /home/michal
```
From this point on /home/michal will be available inside the instance.

You can also specify the path inside the instance in which to mount the local path:

```
$ multipass mount $HOME keen-yak:/some/path
```
Mounts can also be specified as an option to the launch command:

```
multipass launch --mount /some/local/path:/some/instance/path
```
To unmount the mounted paths, use the umount command. You can either specify the desired path to unmount or unmount all of them by not specifying any:
```
$ multipass umount keen-yak
$ multipass info keen-yak                
…
Mounts:         --
```
- see [How to share data with an instance](https://multipass.run/docs/share-data-with-an-instance)

### Alternate Case
#### Can't access the Internet? (but a `sudo update` still works?)
OSX might have firewall setup:
 - see [How to troubleshoot networking](https://multipass.run/docs/troubleshoot-networking#heading--dns-problems)

### Alternate Case
#### Can't do a restore from a backup?
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

### Resume Steps

- [How to install injections.io(C++17)](https://github.com/perriera/injections)

### Next Steps

- [How to install injections.io(C++17)](https://github.com/perriera/injections)
- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/cpp/README.md)
- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
- [How to run Ubuntu 22.04 VMs on Apple M1 ARM-based systems for free](https://multipass.run/docs/installing-on-macos)
- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
- [How can I change memory (RAM) size of existing Multipass virtual machine?](https://github.com/canonical/multipass/issues/1265)

