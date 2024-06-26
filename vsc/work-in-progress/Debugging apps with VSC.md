
# Disclaimer
> the following is a work in progress 

## How to use breakpoints with `injections.io(C++17)(interfaces)` using Visual Studio Code (VSC)
> **Given** the need to simplify complications with pre-existing large source code repositories **when** we add new features using [Interface (object-oriented programming)](https://en.wikipedia.org/wiki/Interface_(object-oriented_programming)) best practices **then** we can save much time when trouble-shooting software glitches and/or adding more features later on, (see [Abstract factory pattern](https://en.wikipedia.org/wiki/Abstract_factory_pattern)).

### Prerequisites
- [How to install injections.io(C++17)](https://github.com/perriera/injections)

### Wish Case

  - Open a Terminal box and login in dev (optional)

		su dev

  - [ ] Now install `injections.io(C++17)(interfaces)`:
	
	    mkdir ~/dev
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

 - [ ] Now that you have successfully built `injections.io(C++17)(interfaces)` there are now a few more entries made to the `~/.local/bin` folder including this one:

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

		...

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
The cause of this issue is believed to be related to [Using SSH agent forwarding](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/using-ssh-agent-forwarding). At present however this prompt will not display when building the code from within the VSC editor. Therefore, open VSC and then a Terminal window (or press Shift-Cmd-B).
```
cd ~/dev/interfaces
code .
```
- see [Using SSH agent forwarding](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/using-ssh-agent-forwarding)
- see [Steve Friedl's Unixwiz.net Tech Tips](http://www.unixwiz.net/techtips/ssh-agent-forwarding.html)

### Alternate Case
#### `by-gdb` not supported
This message shows up on VSC when running inside `Microsoft Remote Desktop`. It does not show up when running VSC connected using `Remote - SSH`. However, when you install `GDB Debugger - Beyond` (again) inside `Microsoft Remote Desktop` it appears to work fine. 

### Alternate Case
#### gdb breakpoints landing at random places
Install `GDB Debugger - Beyond` 

### Summary 
Now you have installed *(perriera) / injections* f  the development environment and editor for a C++17 project (complete with cmake 3.21 support). The next steps are now to clone the project then setup your changelog.md (for accurate version control).

### Next Steps
- [How to install (perriera) / html_parser](https://github.com/perriera/for_interfaces/blob/main/injections/html_parser/README.md)
