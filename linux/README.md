### How to install Linux 
> **Given** that we need to be able to install onto a Linux platform **when** we document the steps involved for different methods of installing Linux (as a *Wish Case*) **then** anyone new to the Linux world will be able as well, (anytime our instructions do not cover all the basis we will document the alternate methods to resolve the issue as an *Alternate Case*)

### Prerequistes
- Internet connection
- Windows, Linux or Mac based computer
- sudo privilages on that computer
- Adequate ram and disk space
- An interest in Object-oriented programming
- An interest in Interface-driven programming

### Wish Case
There are a number of ways to install Linux onto your computer with the variables being the type of computer you have and whatever operating system that is already on that hardware. In the case of install Linux as a virtual machine on top of a natively installed operating system is a preferred option when considering software development, (as this tends to be more practically). Installing Linux natively is an option but for development purposes can be more difficult with respect to restoring the Linux operating system from some form of malfunction. In effect it is a lot easier (and quicker) to restore a backup of a Linux instance and then retrace your steps to what may have caused the malfunction than it is try and isolate the malfuction. 

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
- [How to install Ubuntu 22.04 or 23.10 using `digitalocean`](https://github.com/perriera/for_interfaces/blob/main/vm/digitalocean/README.md)

#### Alternate Case
#### multipass
Installing a Linux distribution locally can be achieved easily using [multipass](https://multipass.run/). It does not matter whether you are using Windows, Mac or are using Linux on your system already. Just follow either of these links and you can install Linux using `multipass`:
- [How to install Ubuntu 22.04 using `multipass` on Mac (OS X)](https://github.com/perriera/for_interfaces/blob/main/vm/multipass/mac/README.md)
- [How to install Ubuntu 22.04 using `multipass` on Windows (OS X)](https://github.com/perriera/for_interfaces/blob/main/vm/multipass/windows/README.md)
- [How to install Ubuntu 22.04 using `multipass` on Linux (OS X)](https://github.com/perriera/for_interfaces/blob/main/vm/multipass/linux/README.md)

#### Alternate Case
#### VirtualBox
[virtualbox](https://virtualbox.org) has been around for quite some time and their developers have been pretty diligent in keeping it up to date. The following are instructions on how to install VirtualBox for one particular situation. However, what is written there can be applicable for newer versions of Ubuntu, (upgrades expected shortly): 
- [How to setup ubuntu-20.04.4-desktop-amd64 (on VirtualBox)](https://github.com/perriera/for_interfaces/tree/main/vm/virtualbox)

#### Alternate Case
#### Parallels Desktop
[parallels desktop](https://parallels.com) is essentially a much more modern approach to setting up virtual machines for the desktop however there is a modertately low yearly subscription required. But for that rather low and insignificant significant subscription price you tend to get a service that works out of the box. As you a small army of professional developers taking care of all the tiny little issues for you. 
- A dedicated How-to page for Paralles will be provided shortly
- But the website is already very straight forward
- see [Find the Parallels solution that works best for you](https://parallels.com)

### Summary
You now have a selection of methods of setting up a Linux distribution.

#### Next Steps
- [How to install injections.io(C++17)](https://github.com/perriera/injections)
