### How to install Linux 
> **Given** that we need to be able to install onto a Linux platform **when** we document the steps involved for different methods of installing Linux (as a *Wish Case*) **then** anyone new to the Linux world will be able to as well, (anytime our instructions do not cover all the basis we will document the alternate methods to resolve the issue as an *Alternate Case*)

### Prerequistes
- Internet connection
- Windows, Linux or Mac based computer
- **sudo privilages** on that computer
- Adequate ram and disk space

### Quick links
- see [**native install**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#installing-linux-as-the-host-operating-system-native-install) here
- see [**virtual machine**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#installing-linux-on-top-of-an-existing-system-virtual-machine) here
- see [**cloud hosted**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#digitalocean-cloud-hosted) here
- see [**Docker install**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#docker-linux-mac-or-windows) here
- see [**Flutter install**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#flutter-windows-install) here
- see [**multipass install**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#multipass-linux-mac-or-windows) here
- see [**Parallels Desktop install**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#parallels-desktop-mac-only) here
- see [**Qt Windows install**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#qt-windows-install) here
- see [**Windows 10/11 install**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#windows-1011--windows-install) here
- see [**WSL/WSL2 install**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#windows-1011--wslwsl2-install) here
- see [**VirtualBox install**](https://github.com/perriera/for_interfaces/blob/main/linux/README.md#virtualbox-windows-only) here

### Wish Case: 

#### Installing Linux as the host operating system (native install)
Linux comes in many flavours can be installed either natively or as a virtual machine. 
- Step 1: Choose a Linux Distribution
    - Research and choose a Linux distribution that suits your needs. 
    - Popular Linux distributions:

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
        - see [List of Linux distributions](https://en.wikipedia.org/wiki/List_of_Linux_distributions)

- Step 2: Download the Installation Media
    - Visit the official website of the chosen Linux distribution and download the ISO image for installation.
- Step 3: Create Installation Media
    - Create a bootable USB drive using the downloaded ISO image. 
    - You can use tools like [Rufus (for Windows)](https://rufus.ie/en/) or [Etcher (for Linux and macOS)](https://etcher.balena.io/) for this purpose.
- Step 4: Boot from Installation Media
    - Insert the bootable USB drive into your system and restart it.
    - Access the BIOS or UEFI settings and set the boot order to prioritize booting from the USB drive.
    - Save the changes and exit the BIOS/UEFI settings.
    - Your system should now boot from the installation media.
- Step 5: Begin Installation
    - Once the installation media boots up, you'll be presented with the option to try Linux or install it. 
    - Choose the "Install" option.
- Step 6: Follow Installation Wizard
    - Follow the on-screen instructions provided by the installation wizard.
    - You'll be prompted to select language, time zone, keyboard layout, and other basic settings.
- Step 7: Partitioning
    - Decide on the disk partitioning scheme. 
    - For beginners, choosing the option to install Linux alongside existing operating systems (when any) is recommended.
- Step 8: Create User Account
    - Provide necessary information to create a user account, including username and password.
- Step 9: Complete Installation
    - Once all required information is provided, proceed with the installation process.
    - The installer will copy necessary files and configure the system.
- Step 10: Reboot
    - After the installation completes, you'll be prompted to reboot your system. 
    - Remove the installation media and restart your computer.
- Step 11: Log In
     - Upon rebooting, you'll be presented with the login screen. 
     - Enter the username and password you created during the installation process.
- Step 12: Post-Installation Setup
    - After logging in, you may need to perform additional setup tasks, such as installing updates, drivers, and software packages.

### Alternate Case
#### Troubleshooting 
When you encounter any issues during the installation process, such as driver compatibility problems or partitioning errors, refer to the official documentation of your chosen Linux distribution for troubleshooting steps. Alternatively, you can seek help from online forums and communities dedicated to Linux users, where experienced users can provide assistance and guidance.
- [Linus Torvalds](https://github.com/torvalds) ([Wikipedia](https://en.wikipedia.org/wiki/Linus_Torvalds))
- [Slack.com](https://www.slack.com) (best)
- [Slack AI](https://app.slack.com/features/ai) (AI)
- [LinuxQuestions.org](https://www.linuxquestions.org/) (free)
- [Linux.org](https://www.linux.org/forums/) (free)
- [FeedSpot.com/](https://www.feedspot.com/) (ads)
- [craftypenguins.net](https://www.craftypenguins.net/) (paid)

### Alternate Case
#### Installing Linux on top of an existing system (virtual machine)
There are various methods to install Linux on your computer, depending on the type of computer you own and the existing operating system. Installing Linux as a virtual machine atop a native operating system is often preferred. Especially for software development purposes, (as it proves to be more practical). While installing Linux natively is also an option, it can pose challenges for development, particularly when it comes to restoring the Linux operating system in case of malfunction. In practice, it proves to be much simpler to restore a backup and retrace your steps (to recreate the malfunction) than to attempt to isolate the issue. 

**Cross-platform API**: 
Before we list the VM managers that have been tested with `injections.io(C++17)` it is important to mention that it is possible to develop applications on one type of operating system for use on another type of operating system, (without being inside the target environment itself). **Note**: One key disadvantage to this approach is that a failure in the host operating system itself (aka. mere spamware) can often be mistaken as a malfunction in the beta software functionality under development.

| Cross-platform API      | Free | Eval | GUI |Wiki | Gurus |
| ----------- | ------| -----| --- | --- |   --- |
| [Flutter](https://flutter.dev/)                   | yes | no  | yes  | [wiki](https://en.wikipedia.org/wiki/Flutter_(software)) | [udemy](https://www.udemy.com/courses/search/?src=ukw&q=Flutter)
| [Qt](https://www.qt.io/)                          | no  | yes | yes | [wiki](https://en.wikipedia.org/wiki/Qt_(software))| [udemy](https://www.udemy.com/courses/search/?src=ukw&q=Qt)

**List of VM managers**: Being inside the target operating system when developing applications for that operating system has the advantage being able to contain everything the new application is experiencing during it's development, (even freeze/capture the entire instance in the event of a malfunction). Managing multiple instances of entire operating systems (as mere zip files) quickly and easily.

| VM manager      | Free | Eval | GUI | x11 | MRDT | Wiki | Gurus |
| ----------- | ------| -----| --- |  --- | --- | --- | --- |
| [DigitalOcean](https://www.digitalocean.com)      | no  | yes | no  | yes | no  | [wiki](https://en.wikipedia.org/wiki/DigitalOcean) | [udemy](https://www.udemy.com/courses/search/?src=ukw&q=digitalocean)
| [Docker](https://www.docker.com)                  | yes | no  | no  | yes | no  | [wiki](https://en.wikipedia.org/wiki/Docker_(software)) | [udemy](https://www.udemy.com/courses/search/?src=ukw&q=docker)
| [multipass](https://multipass.run/)               | yes | no  | no  | yes | yes | [wiki](https://en.wikipedia.org/wiki/Canonical_(company)) | [ubuntu](https://multipass.run/docs)
| [VirtualBox](https://virtualbox.org)              | yes | no  | yes | yes | no  | [wiki](https://en.wikipedia.org/wiki/VirtualBox) | [udemy](https://www.udemy.com/courses/search/?src=ukw&q=VirtualBox)

| Mac only      | Free | Eval | GUI | x11 |MRDT |Wiki | Gurus |
| ----------- | ------| -----| --- |  --- |--- | --- | --- |
| [Parallels Desktop](https://parallels.com)        | no  | yes | yes | yes | no  | [wiki](https://en.wikipedia.org/wiki/Parallels_Desktop_for_Mac) | [udemy](https://www.udemy.com/courses/search/?src=ukw&q=Parallels)

| Windows only      | Free | Eval | GUI | x11 |MRDT | Wiki | Gurus |
| ----------- | ------| -----| --- |  --- |--- |--- | --- |
| [WSL/WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)         | yes | no  | no | yes |no | [wiki](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux)  | [udemy](https://www.udemy.com/courses/search/?src=ukw&q=WSL)


- **x11**: GUI support *possible* (using x11 protocol)
- **MRDT**: *[Microsoft Remote Desktop tested](https://apps.microsoft.com/detail/9wzdncrfj3ps?hl=en-US&gl=US)* (by the author)
    

- Which ever VM platform you choose make sure that platform is installed properly onto your native operating system, (using the documentation supplied on their respective websites). 
- However, below you will find Wish Cases for select VM platforms and select Linux distributions (usually Ubuntu) that will have step-by-step instructions for that particular version of VM platform and Linux distribution. 

#### Alternate Case
#### DigitalOcean (cloud hosted)
We recommend setting up a virtual machine that can be accessed remotely (via SSH) using [digitalocean.com](https://www.digitalocean.com) as it offers a 60-day, $200 coupon to new users (*credit card required*):
- [How to install Ubuntu 22.04 using `digitalocean`](https://github.com/perriera/for_interfaces/blob/main/vm/digitalocean/README.md)

#### Alternate Case
#### Windows 10/11  (Windows install)
While it is possible to use Linux on Windows 10/11 through [multipass](https://multipass.run/), [VirtualBox](https://virtualbox.org), [Parallels Desktop](https://parallels.com), [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) or [Docker](https://www.docker.com) you will have to work out the details on your own as the specific steps to do so keep changing with each and every upgrade. 
> However the approach recommended is to merely install VSC onto the Windows 10/11 environment by itself. With just a SSH public key generated for remotely accessing a Linux box,  (either on the web or anywhere on the network). In this way almost no additional packages or modifications to settings are required for the delicate Windows 10/11 environment. Moreover, backing up and restoring the actual development environment is all but completely independent of Windows 10/11.

- Install Windows 10/11 on your computer natively
- Install [Visual Studio Code (VSC) on Windows](https://code.visualstudio.com/docs/setup/windows) installation
- Create a SSH public key for your account (using CMD.exe is fine).

        ssh-keygen -t ed25519 -C "your_email@example.com"

    Just hit enter till you see the prompt again then:

        cd .ssh
        type id_ed25519.pub

    - Copy the whole line of text to the clipboard
    - When you see the `New SSH Key` button paste the clipboard contents

- Create an instance of Ubuntu somewhere on the cloud
    - see [How to install Ubuntu 22.04 using `digitalocean`](https://github.com/perriera/for_interfaces/blob/main/vm/digitalocean/README.md)

- Connect to the Ubuntu instance using VSC.
    - see [How to install injections.io(C++17)](https://github.com/perriera/injections)

#### Alternate Case
#### Qt (Windows install)
**Qt** (pronounced "cute" or as an initialism) is cross-platform application development framework for creating graphical user interfaces as well as cross-platform applications that run on various software and hardware platforms such as [Linux, Windows, macOS, Android or embedded systems](https://www.qt.io) with little or no change in the underlying codebase while still being a native application with native capabilities and speed
- [Qt](https://www.qt.io) website 
- [Qt](https://en.wikipedia.org/wiki/Qt_(software)) wiki 
- [Qt](https://www.udemy.com/courses/search/?src=ukw&q=Qt) tutorials

#### Alternate Case
#### Windows 10/11  (WSL/WSL2 install)
It can be and it is the first thing to do when ever there is any mention of using Linux on a Windows 10/11 platform. But for our purposes `multipass` is easier to use (and **recommended** over WSL/WSL2). However, WSL/WSL2 would be a better and easier to manage alternative to VirtualBox, (albiet setting it up to work with a GUI can be bit of a challenge).
- [WSL/WSL2](https://learn.microsoft.com/en-us/windows/wsl/) website 
- [WSL/WSL2](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux) wiki 
- [WSL/WSL2](https://www.udemy.com/courses/search/?src=ukw&q=wsl%2Fwsl2) tutorials

#### Alternate Case
#### multipass (Linux, Mac or Windows)
Installing a Linux distribution locally can be achieved easily using [multipass](https://multipass.run/). It does not matter whether you are using Windows, Mac or are using Linux on your system already. Just follow either of these links and you can install Linux using `multipass`:
- [How to install Ubuntu 22.04 using `multipass` on Mac (OS X)](https://github.com/perriera/for_interfaces/blob/main/vm/multipass/mac/README.md)
- [How to install Ubuntu 22.04 using `multipass` on Windows (OS X)](https://github.com/perriera/for_interfaces/blob/main/vm/multipass/windows/README.md)
- [How to install Ubuntu 22.04 using `multipass` on Linux (OS X)](https://github.com/perriera/for_interfaces/blob/main/vm/multipass/linux/README.md)

#### Alternate Case
#### Docker (Linux, Mac or Windows)
Installing a Linux distribution using Docker is a possible as it is a forerunner to `multipass`. But for our purposes `multipass` is easier to use (and **recommended** over Docker). However, Docker would be a better and easier to manage alternative to VirtualBox, (albiet setting it up to work with a GUI can be bit of a challenge).
- [Docker website](https://www.docker.com) here
- [Docker wiki](https://en.wikipedia.org/wiki/Docker_(software)) here
- [Docker tutorials](https://www.udemy.com/courses/search/?src=ukw&q=docker) here

#### Alternate Case
#### VirtualBox (Windows only)
[VirtualBox](https://virtualbox.org) has been around for quite some time and their developers have been pretty [diligent in keeping it up to date](http://download.virtualbox.org/virtualbox/). The following are instructions on how to install VirtualBox for one particular situation. However, what is written there can be applicable for newer versions of Ubuntu: 
- [How to setup ubuntu-20.04.4-desktop-amd64 (on VirtualBox)](https://github.com/perriera/for_interfaces/tree/main/vm/virtualbox)
- [Complete listing of latest VirtualBox releases](http://download.virtualbox.org/virtualbox/) 
- [Latest stable version](http://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT)

#### Alternate Case
#### Flutter (Windows install)
**Flutter** is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web, Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017. Flutter is used internally by Google in apps such as Google Pay and Google Earth as well as by other software developers including ByteDance and Alibaba.
- [Flutter](https://flutter.dev) website 
- [Flutter](https://en.wikipedia.org/wiki/Flutter_(software)) wiki 
- [Flutter](https://www.udemy.com/courses/search/?src=ukw&q=Flutter) tutorials

#### Alternate Case
#### Parallels Desktop (Mac only)
[Parallels Desktop](https://parallels.com) is essentially a much more modern approach to setting up virtual machines for the desktop however there is a modertately low yearly subscription required. But for that rather low and insignificant significant subscription price you tend to get a service that works out of the box. As you have at your disposal a small army of professional developers taking care of all the tiny little issues for you. 
- A dedicated How-to page for Paralles will be provided shortly
- But the website is already very straight forward
- see [Find the Parallels solution that works best for you](https://parallels.com)
- Currently Parallels Desktop does offer an evaluation period, ([free for 14 days](https://www.parallels.com/products/desktop/trial/?clientId=2032879761.1711828844&sessionId=1711828844&_gl=1*1nadzln*_up*MQ..*_ga*MjAzMjg3OTc2MS4xNzExODI4ODQ0*_ga_RYHBN2XNLK*MTcxMTgyODg0NC4xLjAuMTcxMTgyODg0NC4wLjAuMA..))

### Summary
You now have a selection of methods for setting up a Linux distribution, (either natively or through a VM manager). At this point in time the number one recommendation is to utilize `DigitalOcean` provided you have a good Internet connection, (and a credit card). The number two recommendation is `multipass` as it is free and can support a GUI interface via `Microsoft Remote Desktop`, (albeit somewhat laggy). `VirtualBox` comes in as a strong number three as it also free and does do a fairly good GUI interface (but takes longer to setup properly and much more fragile compared to `Parallels Desktop`). `Docker` (a forerunner to `multipass`) is number five but requires a course off [Udemy.com](https://www.udemy.com/courses/search/?src=ukw&q=docker) to know how to use it properly. `WSl/WSL2` provides a Linux-style interface to a natively-installed Windows instance but is dependent on the ever-changing Windows desktop environment to make it practical for software development (when compared to software development in a pure Linux environment). 
- **Cross-platform tool**: `Qt` certainly is an option to consider as it promises to be an all-in-one solution for all three major operating systems plus strong Android support, (but requires a paid subscription and a strong learning curve, see **[Qt courses available on Udemy](https://www.udemy.com/courses/search/?src=ukw&q=qt)**)
 - **Cross-platform tool**: `Flutter` is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web, Fuchsia, Android, iOS, Linux, macOS, and Windows, (see **[Flutter courses available on Udemy](https://www.udemy.com/courses/search/?src=ukw&q=flutter)**)

### Next Steps
- [How to install injections.io(C++17)](https://github.com/perriera/injections)

### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
