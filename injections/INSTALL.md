
## How to install `(perriera) / injections`
> This is how we install and configure a system for use with `(perriera) / injections `

 1. **GIVEN** we need to have develop injectX based projects
 2. **WHEN** we install (perriera) / injections onto Linux, OS X, WSL2
 3. **THEN** we can build projects using g++, cmake, CPM and injectX

### Prerequisites
- [How to install Linux](https://github.com/perriera/for_interfaces/blob/main/vm/MENU.md)
- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/cpp/INSTALL.md)
- [How to remote connect to your Linux box via SSH](https://github.com/perriera/for_interfaces/blob/main/ssh/REMOTE_SSH.md)

### Wish Case
Assuming you have set up a Ubuntu 22.04 instance and configured it for C++11/17 projects (see above):

  - Open a Terminal box and install 

	(**Note**: In the case where you have a SSH connection to the Github repository see **Alternate Case** below)

		mkdir ~/dev
        cd ~/dev
        git clone https://github.com/perriera/injections.git
		cd ~/dev/injections
		bin/scripts/docs.sh

 - Now build and run the test cases for 

		cd ~/dev/injections
        install -d build; cd build; cmake ..; make; cd ..
        build/run-unittests-injections

 - Now start Visual Studio Code

		cd ~/dev/injections
		code .

	- Select **Yes** to **Trust the Authors**
	- When asked to install C++ or CMake extensions say `Install` or `Yes`
	- When asked to select a C++ dialect select anything early gcc

 - Now Press Shift-Ctrl-B in Linux (or Shift-Command-B on OSX)

 - Maximize your editor and place a breakpoint on `interfaces/system/test_interface.cpp` (at the first `ASSERT_INJECTX`)

         REQUIRE_INJECTX(SomethingMessedUp, "some stderr diagnostics");
         ASSERT_INJECTX(SomethingMessedUp, "");
         REQUIRE_INJECTX(NothingSpecified, "");

 - Select the forth large icon from the top left (for `RUN AND DEBUG`) and press the Green arrow.

> In the case VSC recommends adding *C/C++ Extention pack* and *CMake Tools* Extensions select **Install/Yes**

 - Make a backup of the Linux box instance.

	It might seem redundant but making a duplicate of the Linux box now gives you a convenient fall back.
	
### Note
#### (perriera) / injections bash scripts and binaries
Upon the successful BUILD of `(perriera) / injections` the `~/.local/bin` folder is now populated similiar to the the following: 
```
cmake-annotate    docs.sh                  it_clean_cache.sh      it_paths.sh       it_test.sh               
cmake-format      ex_sudo.sh               it_common_scripts.sh   it_post.sh        it_version.sh            cmake-genparsers  it_ansi_colors.sh        it_default_browser.sh  it_rebuild.sh     it_version.txt           ctest-to          it_build.sh              it_library_path.sh     it_show_title.sh         
```
These bash scripts and binaries are now available on the PATH (as long as `~/.local/bin` is part of PATH). The `it_help.sh` script gives a basic introduction to these tools. For more on this see **Next Steps** below.

### Note
#### VSC Intergrated Debugger capabilties

 - [ ] The C/C++ Extensions has to be installed and VSC usually detects that is it required and will ask your to allow it to be install, (select 'Install')

 - [ ] The `EXPLORER` panel (to the top left) will show you all files and folders in the injections project. The first large icon is that of a file copy operation, select it. On the list of files and folders shown select `interfaces/system/mold_interface.cpp` and place a break point on the line that says `system::Test(i);`

 - [ ] To the top left of the VSC editor you will see a list of large icons, the forth one down is for running/debugging. Select it and then press the green arrow, (it would have 'run-unittests' to the right of the green arrow)

### Alternate Case
#### When we are connecting via SSH key to Github
In the case where we wish to make updates to the source repository we need to connect to Github via an SSH key:

	cat ~/.ssh/id_ed25519.pub

Add the SSH key to Github -> Settings -> SSH and GPG keys

	mkdir ~/dev
	cd ~/dev
	git clone git@github.com:perriera/injections.git

### Alternate Case
#### When we need to connect VSC to the Linux box via SSH
In the case where we do not have a gui to work with we can connect VSC via SSH provided the client SSH key is added to the local authorized_keys:

On the client machine:

	cat ~/.ssh/id_ed25519.pub

On the Linux box add the clipboard contents to the authorized_keys

 	echo ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINGrWm8vAqdDMuHVlDc+hlLASoWHas8JPQZo8Gwq2y/n perry@imac219 >> ~/.ssh/authorized_keys 

Add the Remote SSH extensions to VSC and connect via the username and ip address to the Linux box (more below)

	cd ~
	basename $PWD
	hostname -I

	aka. dev@192.169.2.2

### Alternate Case
#### VSC Breakpoints and the **gdb** debugging tools
VSC merely uses the Linux gdb for it's C++ debugging purposes. However certain quicks somewhere between the latest gcc compilers, VSC and how gdb works are causing occasional eratic behavior. For example trying to `step-over` `REQUIRE_` macros will force a jump out of the function and sometimes a breakpoint set in one source location will cause gdb to stop in another location. Nothing on the Internet is giving much in the way of how to resolve this (yet) but we are hoping something in the future will resolve this issue. 

### Alternate Case
#### Customizations
>- To see a Dark title bar go to Linux Settings -> Appearance -> Dark  
>- To see a Terminal window select Terminal -> New Terminal from the top menu.
>- To see background transparency on the Terminal window -> Terminal (on top of screen) -> Preferences -> Unnamed -> Colors -> Use transparency background -> set desired level
### Alternate Case
#### Since selecting clang the C++ compiler shows warning messages
There should not be any C++ warning messages unless you selected one of the latest versions of clang. 
```
rm  ~/.local/share/CMakeTools/cmake-tools-kits.json
```
or edit that file to remove all references to clang (for now)

### Alternate Case
#### You don't have a `~/.ssh/id_ed25519.pub`
Generate a SSH key for your Linux box, (**do not change the file name and do not supply a passphrase**)

	ssh-keygen -t ed25519 -C "your_name@your_email_address.com" 

### Alternate Case 
#### Using Visual Studio Code (VSC or 'code')
> Using VSC is optional (*but recommended*)

		cd ~/dev/injections
		code .

> - Now Press Shift-Ctrl-B in Linux (or Shift-Command-B on OSX)
> - In the case VSC recommends adding *C/C++ Extention pack* and *CMake Tools* Extensions select **Install/Yes**
> - To the top left of the VSC editor you will see a list of large icons, the forth one down is for running/debugging. Select it and then press the green arrow, (it would have 'run-unittests' to the right of the green arrow)

### Alternate Case 
#### Using Visual Studio Code (VSC or 'code') via Remote SSH
In the case where you would like to access the Linux box via VSC over SSH:
 - Do [How to remote connect to your Linux box via SSH](https://github.com/perriera/for_interfaces/blob/main/ssh/REMOTE_SSH.md)
 - Then open VSC (on the client) 
 - In the bottom left corner there should be a little blue icon with these two symbols '><' (almost).
 - In the case that that symbol '><' is not present add 'Remote - SSH' using the Extensions (usually the 5th large icon on the top left of the VSC editor)
 - Click that icon and select 'Connect Current Window to Host ...' add the same ssh connection parameters used earlier (to test the SSH connection ex. 'perry@10.211.55.32' *do not do this 'ssh perry@10.211.55.32')
 - Once connected open the File menu on VSC and select 'Open Folder'
 - Here you can navigate to the dev folder and select the project of your choice, (in this case it would be `dev/injections')
 - Select 'Yes' to `I trust the authors`
 > When asked 'Install C/C++ Extension Pack' say 'Yes'
```
```

### Alternate Case 
> Dark Theme
In the case where you start up VSC and the title bar portion of the editor is Light coloured and you desire to have it Dark themed merely do this:
1. Open the Settings app, (click on the bottom left menu and type 'Settings')
2. Select Appearance and then click on the Dark theme

### Summary 
Now you have installed *(perriera) / injections*, the development environment and VSC for a C++17 project (complete with cmake 3.21 support). 

### Next Steps
- [How to set the PATH environment variable (using it_paths.sh)](https://github.com/perriera/for_interfaces/blob/main/injections/SET_PATHS.md)
- [How to install (perriera) / interfaces](https://github.com/perriera/for_interfaces/blob/main/injections/interfaces/INSTALL.md)

