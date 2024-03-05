## How to install Ubuntu 22.04 using `multipass` on Mac (OS X)
> In this step we show how to install multipass on OS X (mac)

 1. **GIVEN** we need to be able to run Linux apps on OSX and Windows
 2. **WHEN** we install multipass on OSX or Windows 
 3. **THEN** we can launch an instance of Ubuntu 22.04 

### Prerequisites
- [How to install `multipass` on macOS](https://multipass.run/docs/installing-on-macos#heading--install-upgrade-uninstall)  
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

	Whatever random name was listed (instead of `observant-earwig` was listed change the assignment to that random name)

- Now stop the instance:

		multipass stop ${MY_NAME_IS}

- Now reconfigure the instance:

		multipass set local.${MY_NAME_IS}.memory=8G
		multipass set local.${MY_NAME_IS}.cpus=2   
		multipass set local.${MY_NAME_IS}.disk=64GB
		multipass mount $HOME $MY_NAME_IS:/media/psf/home

	The system is now configured for 8GB of ram, 2 cpus and a 64GB hard disk. It will also mount your $HOME folder to a folder inside the new Linux instance (using a Parallels Desktop file naming convention as `/media/psf/home`), (feel free to adjust the naming convention as necessary).

 - Now update it:

 		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt autoclean -y
		sudo reboot 

- Now restart the instance:

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

 - Now restart the instance and update it:

		multipass shell ${MY_NAME_IS}
		su dev

	You are now inside a user account on the new Linux instance. In the case where you expect to want to access the new Linux instance with a GUI front-end see the **Alternate Case** below.

### Alternate Case
#### Add a GUI
`multipass` is very cutting edge in that it is possible to add gui access to the instance either using **x11** or even `Microsoft Remote Desktop` (available on the **App Store**) without too much trouble at all:

	sudo apt update
	sudo apt install ubuntu-desktop xrdp

On macOS we can use the “Microsoft Remote Desktop” application, from the Mac App Store. Once installed use the username and password for `dev`:

- for more see [How to set up a graphical interface](https://multipass.run/docs/set-up-a-graphical-interface)

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

- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/cpp/INSTALL.md)
- [How to install (perriera) / injections](https://github.com/perriera/for_interfaces/blob/main/injections/INSTALL.md)
- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
- [How to run Ubuntu 22.04 VMs on Apple M1 ARM-based systems for free](https://multipass.run/docs/installing-on-macos)
- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
- [How can I change memory (RAM) size of existing Multipass virtual machine?](https://github.com/canonical/multipass/issues/1265)

