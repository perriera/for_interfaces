
## How to install (perriera) / interfaces 
> In this step we need to install all the tools used by this project (that you may or may not already have installed).

 1. **GIVEN** we need to have develope injectX based projects
 2. **WHEN** we install (perriera) / injections onto Linux, OS X, WSL2
 3. **THEN** we can build projects using special bins/scripts to simplify using injections

### Prerequisites
- [How to install (perriera) / injections](https://github.com/perriera/for_interfaces/blob/main/injections/INSTALL.md)

### Wish Case

  - [ ] Open a Terminal box and install 
	
        cd ~/dev
		git clone https://github.com/perriera/interfaces.git

git clone git@github.com:perriera/interfaces.git
	
 - [ ] Now build and run the test cases for 

		cd ~/dev/interfaces
        install -d build; cd build; cmake ..; make; cd ..
        build/run-unittests-interfaces

 - [ ] Now in your VSC editor do: `File -> Open Folder -> ~/dev/interfaces` or ... 

		cd ~/dev/interfaces
		code .

 - [ ] Now Press Shift-Ctrl-B in Linux (or Shift-Command-B on OSX)

> In the case VSC recommends adding *C/C++ Extention pack* and *CMake Tools* Extensions select **Install/Yes**

- [ ] Maximize your editor and place a breakpoint on `interfaces/proofs/test_interface.cpp` (at the first `ASSERT_INJECTX`)

		std::ifstream in("changelog.md");
		REQUIRE_INJECTX(proofs::SyntaxError, in);
		ASSERT_INJECTX(injections::file::NotFound, proofs_md);
		std::ifstream in2(proofs_md);
		ASSERT_INJECTX(proofs::SyntaxError, in2);

 - [ ] Select the forth large icon from the top left (for `RUN AND DEBUG`) and press the Green arrow.

### Alternate Case
#### VSC Breakpoints and the **gdb** debugging tools
VSC merely uses the Linux gdb for it's C++ debugging purposes. However certain quicks somewhere between the latest gcc compilers, VSC and how gdb works are causing occasional eratic behavior. For example trying to `step-over` `REQUIRE_` macros will force a jump out of the function and sometimes a breakpoint set in one source location will cause gdb to stop in another location. Nothing on the Internet is giving much in the way of how to resolve this (yet) but we are hoping something in the future will resolve this issue. 

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

### Alternate Case 
> Dark Theme
In the case where you start up VSC and the title bar portion of the editor is Light coloured and you desire to have it Dark themed merely do this:
1. Open the Settings app, (click on the bottom left menu and type 'Settings')
2. Select Appearance and then click on the Dark theme

### Summary 
Now you have installed *(perriera) / injections* f  the development environment and editor for a C++17 project (complete with cmake 3.21 support). The next steps are now to clone the project then setup your changelog.md (for accurate version control).

### Next Steps
- [How to install (perriera) / html_parser](https://github.com/perriera/for_interfaces/blob/main/injections/html_parser/INSTALL.md)
