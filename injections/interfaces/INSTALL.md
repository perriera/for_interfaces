
## How to install (perriera) / interfaces 
> In this step we need to install all the tools used by this project (that you may or may not already have installed).

 1. **GIVEN** we need to have develop injectX based projects
 2. **WHEN** we install (perriera) / injections onto Linux, OS X, WSL2
 3. **THEN** we can build projects using special bins/scripts to simplify using injections

### Prerequisites
- [How to install (perriera) / injections](https://github.com/perriera/for_interfaces/blob/main/injections/INSTALL.md)

### Wish Case

  - [ ] Open a Terminal box and install 
	
        cd ~/dev
		git clone https://github.com/perriera/interfaces.git
	
 - [ ] Now build and run the test cases for 

		cd ~/dev/interfaces
        install -d build; cd build; cmake ..; make; cd ..
        build/run-unittests-interfaces

 - [ ] Now in your VSC editor do: `File -> Open Folder -> ~/dev/interfaces` or ... 

		cd ~/dev/interfaces
		code .

	- Select 'Yes' to 'Trust the Authors'

 - [ ] Now Press Shift-Ctrl-B in Linux (or Shift-Command-B on OSX)

> In the case VSC recommends adding *C/C++ Extention pack* and *CMake Tools* Extensions select **Install/Yes**

- [ ] Maximize your editor and place a breakpoint on `interfaces/proofs/test_interface.cpp` (at the first `ASSERT_INJECTX`)

		std::ifstream in("changelog.md");
		REQUIRE_INJECTX(proofs::SyntaxError, in);
		ASSERT_INJECTX(injections::file::NotFound, proofs_md);
		std::ifstream in2(proofs_md);
		ASSERT_INJECTX(proofs::SyntaxError, in2);

 - [ ] Select the forth large icon from the top left (for `RUN AND DEBUG`) and press the Green arrow.

 - [ ] Now that you have successfully built `(perriera) / interfaces` there are now a few more entries made to the `~/.local/bin` folder including this one:

		nterface_tools.sh 

	When you execute that one you might see something close to the following:

		NTERFACE_TOOLS.SH injections::Blueprint (injectX) v5.49.11
		-----------------------------------------------------------
		desc: show nterface base tools available on PATH
		-----------------------------------------------------------
		/home/perry/.local/bin
		-----------------------------------------------------------
		desc: list folder contents of each nterface PATH entry (in order)
		-----------------------------------------------------------
		/home/perry/.local/bin
		cmake-annotate    docs.sh                  it_clean_cache.sh      it_paths.sh      
		cmake-format      ex_sudo.sh               it_common_scripts.sh   it_post.sh       
		cmake-genparsers  it_ansi_colors.sh        it_default_browser.sh  it_rebuild.sh    
		cmake-lint        it_assert_interfaces.sh  it_help.sh             it_run.sh         
		ctest-to          it_build.sh              it_library_path.sh     it_show_title.sh 

	The above listing is not able to show all the entries that are actually there (due to the need for neatness).

 - [ ] To see a more descriptive introduction of the new tools available:

		it_help.sh

	You might see something like this:

		IT_HELP.SH injections::Blueprint (injectX) v5.49.11
		-----------------------------------------------------------
		desc: show help for each injections-based bash script
		-----------------------------------------------------------
		cmake-annotate - describe "snap installed cmake component"
		cmake-format - describe "snap installed cmake component"
		cmake-genparsers - describe "snap installed cmake component"
		cmake-lint - describe "snap installed cmake component"
		ctest-to - no help specified for '/home/perry/.local/bin/ctest-to'
		docs.sh - describe "populates the docs/ folder (with docs)"
		ex_sudo.sh - describe "shows sudo status"
		it_ansi_colors.sh - describe "set ANSI color variables"
		it_assert_interfaces.sh - describe "assert folder is an injections based project"
		it_build.sh - describe "build the C++ make files"
		it_clean_cache.sh - describe "reset C++ build/ folder and CPM folder"
		it_common_scripts.sh - function describe(){
		it_default_browser.sh - describe "detect the browser to be used by htmlforge.net"
		it_help.sh - describe "show help for each injections-based bash script"
		it_library_path.sh - describe "show current contents of LD_LIBRARY_PATH"
		it_paths.sh - describe "show current contents of PATH"
		describe "add a parameter to generate new PATH"
		it_post.sh - describe "automate posting source code to Github repo"
		it_rebuild.sh - describe "do a rebuild of the build folder"
		it_run.sh - describe "run-unittests in the build folder"
		it_show_title.sh - describe "display the title of the bash script"
		it_test.sh - describe "run the test cases for project"
		it_version.sh - describe "display the version of the injections framework"
		it_version.txt - describe "the latest version number from CMakeLists.txt"
		nterface_clone_clazz.sh - describe "clone a clazz.hpp for an interface"
		nterface_clone.sh - describe "clone an interface, (from another interface)"
		nterface_create.sh - describe "create an interface, (from sample::Interface)"
		nterface_delete.sh - describe "delete an interface, (from local repo)"
		nterface_export.sh - describe "export interface to another Github project"
		nterface_generalize.sh - describe "demote interface from another interface"
		nterface_NVM.sh - describe "sets the NVM version for session"
		describe "(works properly when called from ~/.bashrc)"
		nterface_PATH.sh - describe "sets the PATH variable for session"
		describe "(works properly when called from ~/.bashrc)"
		nterface_promote.sh - describe "promote interface to another interface"
		nterface_tools.sh - describe "show nterface base tools available on PATH"
		describe "list folder contents of each nterface PATH entry (in order)"
		tagit.sh - describe "show the current version tag (from Github) repo"
		describe "(or set the next version tag for the project)"
			git describe --tags --abbrev=0 
		upgrades - describe "sets the version number of project"
		upgrades_menu - describe "displays a menu (found in changelog.md)"
		xsnap.sh - describe "purges the snaps library (of old snap images)"

 - [ ] Make a backup of the Linux box instance.

	It might seem redundant but making a duplicate of the Linux box now gives you a convenient fall back.

### Alternate Case
#### When we are connecting via SSH key to Github
In the case where we wish to make updates to the source repository we need to connect to Github via an SSH key:

	cat ~/.ssh/id_ed25519.pub

Add the SSH key to Github -> Settings -> SSH and GPG keys

	mkdir ~/dev
	cd ~/dev
	git clone git@github.com:perriera/interfaces.git

### Alternate Case
#### "Username for 'https://github.com': " comes up during build
This has not been resolved properly (as of yet) however switching to VSC (via SSH) and doing a build from there resolves this issue. **Note**: Make sure the CPM of the Terminal window in the Linux box is disconnected before building with VSC. After the executables are built (and the CPM cache is not cleared you can it_test.sh from the terminal in the Linux box).

### Alternate Case
#### VSC Breakpoints and the **gdb** debugging tools
VSC merely uses the Linux gdb for it's C++ debugging purposes. However certain quicks somewhere between the latest gcc compilers, VSC and how gdb works are causing occasional eratic behavior. For example trying to `step-over` `REQUIRE_` macros will force a jump out of the function and sometimes a breakpoint set in one source location will cause gdb to stop in another location. Nothing on the Internet is giving much in the way of how to resolve this (yet) but we are hoping something in the future will resolve this issue. 

### Summary 
Now you have installed *(perriera) / injections* f  the development environment and editor for a C++17 project (complete with cmake 3.21 support). The next steps are now to clone the project then setup your changelog.md (for accurate version control).

### Next Steps
- [How to install (perriera) / html_parser](https://github.com/perriera/for_interfaces/blob/main/injections/html_parser/INSTALL.md)
