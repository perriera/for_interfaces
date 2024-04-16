## How to install Ubuntu 22.04 using `Parallels Desktop`
**Given** we need to be able to run Linux apps on Parallels Desktop **when** we have a Parallels Desktop installed **then** we can install an instance of Ubuntu

### Prerequisites
- Purchase [Parallels Desktop](https://www.parallels.com) 
- At time of writing Parallels Desktop is offering a [Free trial for 14 days](https://www.parallels.com)
- *credit **not** card required for free trial*

### Quick links
- see [Simplified instructions](https://github.com/perriera/for_interfaces/tree/main/vm/parallels/ubuntu#alternate-case) below

### Wish Case
#### Detailed instructions 
To install Parallels Desktop, follow these steps:

1. Purchase Parallels Desktop: 
First, you need to buy a license for Parallels Desktop. 
	
	You can do this on the Parallels website or through authorized resellers.

2. Download the Installer: 
	
	- After purchasing, download the installer from the Parallels website. 
	- Make sure to download the correct version for your operating system (Mac or Windows).

3. Run the Installer: 

	-Locate the downloaded installer file and double-click it to run the installation process.

4. Follow Installation Wizard: 

	- The installation wizard will guide you through the process. 
	- You may need to agree to the license agreement and choose installation options such as installation location and additional components.

5. Enter License Key: 

	- During the installation process, you will be prompted to enter your license key. 
	- Enter the key you received when you purchased Parallels Desktop.

6. Install Ubuntu: 

	- When you plan to run Ubuntu on your Mac using Parallels Desktop, you'll need to have a Ubuntu installation ISO file ready. 
	- Parallels Desktop can help you download and install Ubuntu, or you can use an existing Ubuntu installation ISO.

7. Configure Virtual Machine (VM): 

	- After installing Parallels Desktop, you can create a new virtual machine by following the on-screen instructions. 
	- You'll need to choose the operating system you want to install (e.g., Windows, Linux) and configure settings such as the amount of RAM and disk space allocated to the virtual machine.

8. Install Operating System: 

	- When you're setting up a new virtual machine, you'll need to install the operating system. 
	- Parallels Desktop provides step-by-step guidance on installing Windows, Linux, and other operating systems.

9. Install Parallels Tools (Optional): 

	- Parallels Tools is a set of utilities that enhance the integration between your Mac and virtual machine. 
	- After installing the operating system, you can install Parallels Tools to improve performance and enable features like shared folders and seamless mouse integration.

10. Start Using Parallels Desktop: 

	- Once everything is set up, you can start using Parallels Desktop to run Ubuntu and other operating systems on your Mac.
	- Remember to regularly update Parallels Desktop to ensure you have the latest features and security fixes. 
	- You can check for updates within the application or download them from the Parallels website.

### Alternate Case
#### Simpified instructions 
Assuming you have an iMac with Parallels Desktop installed
 -  Goto Ubuntu.com and download [Ubuntu 22.04.4](https://releases.ubuntu.com/22.04/)
 -  Press the + button to the top right corner of Parallels Desktop Control Center
 -  Select *Install Windows or another OS from a DVD or image file*
 -  Press *Continue*
 -  Select *ubuntu-20.04.4-desktop-amd64.iso* in *~/Downloads* 
 -  Fill out the details for an *Express Installation*
 -  Rename the installation *Ubuntu 22.04.4 LTS* (for clarity)
 -  Select *Customize settings before installation*
 -  Press *Create*
 -  Under *Options -> Sharing* share the Home folder (and unselect everything else)
 -  Under *Options -> CPU & Memory* set Memory to 8192 
 -  Under *Options -> Mouse & Keyboard* set Mouse & Keyboard to *Don't optimize for games*
 -  Close the dialog and press the blue *Continue* button
 -  Wait for the install to complete
 -  Login in with the login credentials you provided
 -  Click *Next* until you see the desktop
 -  Select *Update Now* on the Software Updater
 -  To the left you should now see a small icon with a status bar slowly going right
 -  That status bar shows you updates being installed (wait for that to complete)
 -  Click on the icon you see In the bottom left corner 
 -  Type "ter" in the search box, select Terminal
 -  When the Terminal box opens execute the following

		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt update -y
		sudo reboot

 -  When you login again you now have a fully working Ubuntu instance
 -  Shutdown the Ubuntu instance (top right corner click on the icon)
 -  Select *Power Off -> Power Off*
 -  Now in the Parallels Desktop Control Center select *Ubuntu 22.04.4 LTS*
 -  Click the *Reclaim* button to reclaim unused hard disk space
 -  Close the *Configuration* dialog
 -  Right mouse click on *Ubuntu 22.04.4 LTS* and select *Clone...*
 -  Replace the name *Copy of Ubuntu 22.04.4 LTS* with something meaningful (ex. Ubuntu 22.04.4 <your project name>")
 -  Start your cloned Ubuntu instance for your project (keeping the original one in reserve as a backup)
 - Open a Terminal window create a user like this:
 - Create a SSH key *([unless you already have one](https://github.com/perriera/for_interfaces/blob/main/ssh/README.md))*:

		ssh-keygen -t ed25519 -C "your_name@your_email.com"

	- Set your own email address *(optional)* 
	- Do **not** supply a passphrase or change the filename

- Display the `SSH public key`

		cat ~/.ssh/id_ed25519.pub

- Add the `dev` user:

		sudo adduser dev 

	Specify a password and hit enter on everything else

- Now add dev to the **sudo** group:

		sudo adduser dev sudo
		cp -r .ssh /home/dev
		chown -R dev:dev /home/dev/.ssh/

	- A few dialog boxes might appear
	- Just `TAB` till you hightlight the `<Ok>` button and hit `Enter`

#### Relog into the Linux instance as `dev`

- Open a Terminal box:

		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt update -y

Everything would come back quickly as you've already updated the sytem

see *Resume/Next* steps below ... 

#### Backup/Restore you instance
Backing up a Linux box using Parallels can happen in three ways.
 - You power off the Linux box and do a `Clone` operation
 - You power off the Linux box and do a `Show in Finder` operation
 - You leave the power on do a `Show in Finder` operation anyway
 - Once you see the Linux box instance in the Finder window you can do a simple copy & paste.
 - Powering off behand is wiser but not really required.
 - There is also a Backup option in the Configuration window that you can setup at your convenience.  

### Alternate Case
#### You didn't see the chance to specify your own password?

	passwd

### Alternate Case
#### Don't know anything about SSH public keys?
- see [How to setup a SSH public key](https://github.com/perriera/for_interfaces/blob/main/ssh)

### Summary
Remember to secure your Linux box by setting up a firewall, disabling root login, and keeping your system and applications updated regularly. Additionally, always follow best practices for security and data protection.

### Resume Steps

- [How to install injections.io(C++17)](https://github.com/perriera/injections#how-to-install-injectionsioc17s)

### Next Steps

- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/cpp/README.md)

### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
