
## How to install (perriera) / html_parser 
> In this step we need to install all the tools used by this project (that you may or may not already have installed).

 1. **GIVEN** we need to have develop HTML based projects
 2. **WHEN** we use the Java-based JSoup Framework 
 3. **THEN** we can parse properly HTML pages

### Prerequisites
- [How to install (perriera) / injections](https://github.com/perriera/for_interfaces/blob/main/injections/INSTALL.md)

### Wish Case

  - [ ] Open a Terminal box and install 
	
        cd ~/dev
		git clone https://github.com/perriera/html_parser.git

git clone git@github.com:perriera/html_parser.git

 - [ ] Now select and install a `Java Development Kit (JDK)` and `maven`:

		javac

	Available options:

		sudo apt install openjdk-11-jdk-headless  # version 11.0.20.1+1-0ubuntu1~22.04, or
		sudo apt install default-jdk              # version 2:1.11-72build2
		sudo apt install openjdk-17-jdk-headless  # version 17.0.8.1+1~us1-0ubuntu1~22.04
		sudo apt install openjdk-18-jdk-headless  # version 18.0.2+9-2~22.04
		sudo apt install openjdk-19-jdk-headless  # version 19.0.2+7-0ubuntu3~22.04
		sudo apt install openjdk-8-jdk-headless   # version 8u382-ga-1~22.04.1
		sudo apt install ecj                      # version 3.16.0-1

	Recommended:

		sudo apt install maven openjdk-8-jdk-headless -y  # version 8u382-ga-1~22.04.1

 - [ ] Now build and run the test cases:

		mvn test

 - [ ] Now build and run the test cases again:

		mvn test

 - [ ] Now build the jar target:

		mvn jar:jar

 - [ ] Now install JSoup 

		mvn install

 - [ ] Now setup the merge.sh script 

		bin/install_merge.sh





> Add any extensions that VSC recommends: (typically `Extension Pack for Java`)

 - [ ] Now Press Shift-Ctrl-B in Linux (or Shift-Command-B on OSX)

> In the case VSC recommends adding *C/C++ Extention pack* and *CMake Tools* Extensions select **Install/Yes**

 - [ ] To the top left of the VSC editor you will see a list of large icons, the forth one down is for running/debugging. Select it and then press the green arrow, (it would have 'run-unittests' to the right of the green arrow)

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
- [How to install (perriera) / intehtml_parserfaces](https://github.com/perriera/for_interfaces/blob/main/injections/html_parser/INSTALL.md)
