
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
 
### Wish Case
Now that you have your project cloned we need to make sure you have the tools necessary to compile properly:

  - [ ] Setup your SSH access to (perriera) private repositories 

        ssh-keygen -t ed25519 -C "unbuntu2204_m5@ubuntu2204_m5" 
        cat ~/.ssh/id_ed25519.pub 

  - [ ] Copy the contents to the clipboard and add the SSH key to (perriera) private SSH keys list 

  - [ ] Open a Terminal box and install 
	
		mkdir ~/dev
        cd ~/dev
        git clone git@github.com:perriera/injections.git
	
 - [ ] Now build and run the test cases for 

		cd ~/dev/injections
        install -d build; cd build; cmake ..; make; cd ..
        build/run-unittests-injections

 - [ ] APPEND these environment variables to `~/.bashrc `
		
		export PATH=$HOME/.local/bin:${PATH}
		export CPM_SOURCE_CACHE=$HOME/.cache/CPM
		export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}

 - [ ] Then source it ... 

		source ~/.bashrc
		
 - [ ] Now start Visual Studio Code

		cd ~/dev/injections
		code .

 - [ ] Now Press Shift-Ctrl-B in Linux (or Shift-Command-B on OSX)

> In the case VSC recommends adding *C/C++ Extention pack* and *CMake Tools* Extensions select **Install/Yes**

 - [ ] To the top left of the VSC editor you will see a list of large icons, the forth one down is for running/debugging. Select it and then press the green arrow, (it would have 'run-unittests' to the right of the green arrow)

### Alternate Case 
#### Using Visual Studio Code (VSC or 'code')
> Using VSC is optional (*but recommended*)

		cd ~/dev/injections
		code .
        
> Now Press Shift-Ctrl-B in Linux (or Shift-Command-B on OSX)

In the case VSC recommends adding *C/C++ Extention pack* and *CMake Tools* Extensions select **Install/Yes**

### Alternate Case 
> Dark Theme
In the case where you start up VSC and the title bar portion of the editor is Light coloured and you desire to have it Dark themed merely do this:
1. Open the Settings app, (click on the bottom left menu and type 'Settings')
2. Select Appearance and then click on the Dark theme

### Summary 
Now you have installed *(perriera) / injections* f  the development environment and editor for a C++17 project (complete with cmake 3.21 support). The next steps are now to clone the project then setup your changelog.md (for accurate version control).

### Next Steps
 - [How to generate a new SSH key for your GitHub.com account](https://github.com/perriera/extras_dbo/blob/dev/docs/SSHKEY.md)
 - [How to clone your project (with this template)](https://github.com/perriera/extras_dbo/blob/dev/docs/CLONE.md)
 - [How to setup your changelog.md](https://github.com/perriera/extras_dbo/blob/dev/docs/CHANGELOG.md)
 - [How to tag your latest revisions](https://github.com/perriera/extras_dbo/blob/dev/docs/TAGIT.md)
