
## How to install (perriera) / html_parser 
> In this step we need to install all the tools used by this project (that you may or may not already have installed).

 1. **GIVEN** we need to have develop HTML based projects
 2. **WHEN** we use the Java-based JSoup Framework 
 3. **THEN** the htmlforge.net framework can parse HTML pages

### Prerequisites
- [How to install (perriera) / injections](https://github.com/perriera/for_interfaces/blob/main/injections/INSTALL.md)

### Wish Case

  - [ ] Open a Terminal box and install 
	
        cd ~/dev
		git clone https://github.com/perriera/html_parser.git

git clone git@github.com:perriera/html_parser.git

 - [ ] Now in your VSC editor do: `File -> Open Folder -> ~/dev/html_parser` or ... 

		cd ~/dev/html_parser

 - [ ] Now type the following:
 
		javac

	Select a `Java Development Kit (JDK)` : (**openjdk-11-jdk-headless** works for our purposes)

		sudo apt install openjdk-11-jdk-headless  # version 11.0.20.1+1-0ubuntu1~22.04, or
		sudo apt install default-jdk              # version 2:1.11-72build2
		sudo apt install openjdk-17-jdk-headless  # version 17.0.8.1+1~us1-0ubuntu1~22.04
		sudo apt install openjdk-18-jdk-headless  # version 18.0.2+9-2~22.04
		sudo apt install openjdk-19-jdk-headless  # version 19.0.2+7-0ubuntu3~22.04
		sudo apt install openjdk-8-jdk-headless   # version 8u382-ga-1~22.04.1
		sudo apt install ecj                      # version 3.16.0-1

	Recommended:

		sudo apt install maven openjdk-11-jdk-headless  # version 11.0.20.1+1-0ubuntu1~22.04

	Notice we are also installing `maven` here as well.
	
 - [ ] Now setup the merge.sh script 

		bin/install_merge.sh

 - [ ] Now build and run the test cases:

		mvn test

	The first time this runs maven will download all necessary jar files.

 - [ ] Now build and run the test cases again:

		mvn test

	You would see this:
	
		[WARNING] Tests run: 1189, Failures: 0, Errors: 0, Skipped: 45
		[INFO] 
		[INFO] ------------------------------------------------------------------------
		[INFO] BUILD SUCCESS
		[INFO] ------------------------------------------------------------------------
		[INFO] Total time:  11.141 s
		[INFO] Finished at: 2024-02-28T10:37:27-08:00
		[INFO] ------------------------------------------------------------------------

 - [ ] Now build the jar target:

		mvn jar:jar

 - [ ] Now install JSoup (for use by the operating system)

		mvn install

 - [ ] Open another Terminal window and run the merge test:

		cd ~
		merge_tests.sh test 

	- A successful run will look like parsed HTML having been tested for each supported **vendor**:

		- **Angular**
		- **React**
		- **Vue** (installed via npm)
		- **Vue** (using just a .js file)

	- Planned support for mobile **vendors**:

		- **Qt**
		- **Flutter**
		- **Angular (mobile)**
		- **React (mobile)**
		- **Vue (mobile)**

	- This ensures that the path to the necessary Java libraries as well as the bash scripts are setup properly. 

 - [ ] Now take a look at the code using VSC: (optional)

		code .

	- Select 'Yes' to 'Trust the Authors'
	- Select 'Install' when asked about Java Extensions
	- Select 'Deny' on `Red Hat Statistics` where source code privacy is important
	- Close the window when asked by VSC to install a JDK (`you are going to do it manually`)

 - [ ] Make a backup of the Linux box instance.

	It might seem redundant but making a duplicate of the Linux box now gives you a convenient fall back.

### Alternate Case 
#### JAVA_HOME not set
Unless there is a solution online (that works), resort to your latest backed image of the Linux box. 

### Alternate Case 
#### Failure on `mvn test`
It would be required to examine the diagnostics and/or email anything that cannot be resolved to: info@exparx.ca.

### Alternate Case 
#### Failure on `mvn install`
Rerun `mvn install` again (in the case there was some sort of Internet timeout). It would be required to examine the diagnostics and/or email anything that cannot be resolved to: info@exparx.ca.

### Summary 
Now you have installed *(perriera) / html_parser*. You now have the ability to parse HTML/CSS pages from Webflow.com for use inside Angular, React, Vue (as well as future planned supported JavaScript frameworks).

### Next Steps
- [How to install (perriera) / htmlforge](https://github.com/perriera/for_interfaces/blob/main/injections/htmlforge/INSTALL.md)
