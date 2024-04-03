### How to install Linux 
> **Given** that we need to be able to install onto a Linux platform **when** we document the steps involved for different methods of installing Linux (as a *Wish Case*) **then** anyone new to the Linux world will be able as well, (anytime our instructions do not cover all the basis we will document the alternate methods to resolve the issue as an *Alternate Case*)

### Prerequistes
- Internet connection
- Windows, Linux or Mac based computer
- sudo privilages on that computer
- Adequate ram and disk space
- An interest in [Object-oriented programming](https://en.wikipedia.org/wiki/Object-oriented_programming)
- An interest in [Interface-driven programming](https://en.wikipedia.org/wiki/Interface-based_programming)

### Wish Case
There are various methods to install Linux on your computer, depending on the type of computer you own and the existing operating system. Installing Linux as a virtual machine atop a native operating system is often preferred, especially for software development purposes, as it proves to be more practical. While installing Linux natively is also an option, it can pose challenges for development, particularly when it comes to restoring the Linux operating system in case of malfunction. In practice, it's much simpler and faster to restore a backup of a Linux instance and retrace your steps to identify the cause of the malfunction than to attempt to isolate the issue. 

- Pick a distribtion from the list below and install it on your machine (using a VM such as Virtual Box, Parallels Desktop or multipass):

    #### Popular Linux distributions
    
        - Debian-based
            - Ubuntu-based
            - Knoppix-based
            - Other Debian-based
        - Pacman-based
            - Arch Linux-based
            - Other Pacman-based
        - RPM-based
            - Fedora-based
            - RHEL-based
            - Other Fedora-based
            - openSUSE-based
            - Mandriva-based
            - Other RPM-based
        - Gentoo-based
        - Slackware-based
        - Android-based
        - Source-based
    
    Linux comes in many flavours can be installed either natively or as a virtual machine. 

    - see [List of Linux distributions](https://en.wikipedia.org/wiki/List_of_Linux_distributions)

#### Alternate Case
#### DigitalOcean
[digitalocean.com](https://www.digitalocean.com) offers a 60 day $200 coupon to new users:
- [How to install Ubuntu 22.04 using `digitalocean`](https://github.com/perriera/for_interfaces/blob/main/vm/digitalocean/README.md)

#### Alternate Case
#### multipass
Installing a Linux distribution locally can be achieved easily using [multipass](https://multipass.run/). It does not matter whether you are using Windows, Mac or are using Linux on your system already. Just follow either of these links and you can install Linux using `multipass`:
- [How to install Ubuntu 22.04 using `multipass` on Mac (OS X)](https://github.com/perriera/for_interfaces/blob/main/vm/multipass/mac/README.md)
- [How to install Ubuntu 22.04 using `multipass` on Windows (OS X)](https://github.com/perriera/for_interfaces/blob/main/vm/multipass/windows/README.md)
- [How to install Ubuntu 22.04 using `multipass` on Linux (OS X)](https://github.com/perriera/for_interfaces/blob/main/vm/multipass/linux/README.md)

#### Alternate Case
#### VirtualBox
[virtualbox](https://virtualbox.org) has been around for quite some time and their developers have been pretty diligent in keeping it up to date. The following are instructions on how to install VirtualBox for one particular situation. However, what is written there can be applicable for newer versions of Ubuntu: 
- [How to setup ubuntu-20.04.4-desktop-amd64 (on VirtualBox)](https://github.com/perriera/for_interfaces/tree/main/vm/virtualbox)

#### Alternate Case
#### Parallels Desktop
[parallels desktop](https://parallels.com) is essentially a much more modern approach to setting up virtual machines for the desktop however there is a modertately low yearly subscription required. But for that rather low and insignificant significant subscription price you tend to get a service that works out of the box. As you have at your disposal a small army of professional developers taking care of all the tiny little issues for you. 
- A dedicated How-to page for Paralles will be provided shortly
- But the website is already very straight forward
- see [Find the Parallels solution that works best for you](https://parallels.com)
- Currently Parallels Desktop does offer an evaluation period, ([free for 14 days](https://www.parallels.com/products/desktop/trial/?clientId=2032879761.1711828844&sessionId=1711828844&_gl=1*1nadzln*_up*MQ..*_ga*MjAzMjg3OTc2MS4xNzExODI4ODQ0*_ga_RYHBN2XNLK*MTcxMTgyODg0NC4xLjAuMTcxMTgyODg0NC4wLjAuMA..))

#### Alternate Case
#### Windows 10/11
While is possible that using Linux onto Windows 10/11 be through [multipass](https://multipass.run/), [virtualbox](https://virtualbox.org), [parallels desktop](https://parallels.com), [WSL/WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) or [Docker](https://www.docker.com) you will have to work out the details on your own as they keep changing with each upgrade of Windows. 
> However, this is the recommended approach:
- Install Windows 10/11 on your computer natively
- Install Visual Studio Code (VSC) on top of your Windows installation
- Create a SSH public key for your account (using CMD.exe is fine).

        ssh-keygen -t ed25519 -C "your_email@example.com"

    Just hit enter till you see the prompt again then:

        cd .ssh
        type id_ed25519.pub

    Copy the whole line of text to the clipboard

- Create an instance of Ubuntu somewhere on the cloud
    - see [How to install Ubuntu 22.04 using `digitalocean`](https://github.com/perriera/for_interfaces/blob/main/vm/digitalocean/README.md)
- Add your SSH public key to that instance.

        cd ~
        echo <paste clipboard contents here> >> ~/.ssh/authorized_keys

- Connect to the Ubuntu instance using VSC.
    - see [How to install injections.io(C++17)](https://github.com/perriera/injections)

### Summary
You now have a selection of methods of setting up a Linux distribution.

### Next Steps
- [How to install injections.io(C++17)](https://github.com/perriera/injections)
