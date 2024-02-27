
## How to install the tools necessary for (perriera) / injections 
> In this step we need to install all the tools used by this project (that you may or may not already have installed.

 1. **GIVEN** we need to have develope injectX based projects
 2. **WHEN** we install (perriera) / injections onto Linux, OS X, WSL2
 3. **THEN** we can build projects using g++, cmake, CPM and injectX

### Prerequisites
- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/linux/INSTALL.md)
- A standard user account setup for C++ development, (*sudo access optional*)
- SSH key access to the (perriera) private repositories 
- [How to generate a new SSH key for your GitHub.com account](https://github.com/perriera/for_interfaces/blob/main/ssh/SSHKEY.md)
- TODO: make (perriera) / injections publically available
- [How to remote connect to your Linux box via SSH](https://github.com/perriera/for_interfaces/blob/main/ssh/REMOTE_SSH.md)

### Wish Case
`(perriera) / injections` is a Github project available here: [git@github.com:perriera/injections.git](https://github.com/perriera/injections)

  - [ ] Open a Terminal box and install 
	
		mkdir ~/dev
        cd ~/dev
        git clone https://github.com/perriera/injections.git
		cd ~/dev/injections
		bin/docs.sh
	
 - [ ] Now build and run the test cases for 

		cd ~/dev/injections
        install -d build; cd build; cmake ..; make; cd ..
        build/run-unittests-injections

 - [ ] Now start Visual Studio Code

		cd ~/dev/injections
		code .

>- To see a Dark title bar go to Linux Settings -> Appearance -> Dark  
>- To see a Terminal window select Terminal -> New Terminal from the top menu.
>- IMPORTANT: When asked to install C++ or CMake extensions say yes
>- MORE IMPORTANT: When asked to select a C++ dialect select anything early gcc, (*avoid late versions clang*)

 - [ ] Now Press Shift-Ctrl-B in Linux (or Shift-Command-B on OSX)

> In the case VSC recommends adding *C/C++ Extention pack* and *CMake Tools* Extensions select **Install/Yes**

 - [ ] To the top left of the VSC editor you will see a list of large icons, the forth one down is for running/debugging. Select it and then press the green arrow, (it would have 'run-unittests' to the right of the green arrow)

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
Now you have installed *(perriera) / injections* f  the development environment and editor for a C++17 project (complete with cmake 3.21 support). The next steps are now to clone the project then setup your changelog.md (for accurate version control).

### Next Steps
 - [How to remote connect to your Linux box via SSH](https://github.com/perriera/for_interfaces/blob/main/ssh/REMOTE_SSH.md)
 - [How to generate a new SSH key for your GitHub.com account](https://github.com/perriera/extras_dbo/blob/dev/docs/SSHKEY.md)
 - [How to clone your project (with this template)](https://github.com/perriera/extras_dbo/blob/dev/docs/CLONE.md)
 - [How to setup your changelog.md](https://github.com/perriera/extras_dbo/blob/dev/docs/CHANGELOG.md)
 - [How to tag your latest revisions](https://github.com/perriera/extras_dbo/blob/dev/docs/TAGIT.md)


#### TODO: Place in .md file of it's own
```

#### On the computer / Linux instance you are connecting to the new Linux box from:

  - [ ] Copy the SSH public key to the clipboard 
  
  		cat ~/.ssh/id_ed25519.pub 

#### On the new Linux box where you authorize the client SSH to be able to connect:

  - [ ] Add the SSH key to ~/.ssh/authorized_keys:

	   echo (clipboard contents) >> ~/.ssh/authorized_keys


```
