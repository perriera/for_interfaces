## How to install `Visual Studio Code (VSC)` 
**Given** we need to edit text files, source code and build files for our projects **when** we install Visual Studio Code (VSC) **then** we can build and edit any projects that require a text file editor  

### Prerequisites
- Linux instance
- Internet access
- **sudo** privilages 
- x11 or SSH access

### Wish Case
Visual Studio Code is a text editor that gives the user the ability to edit files using a GUI. In the case where you have already setup a SSH connection to the remote Linux box all you have to do now is install VSC locally (see Alternate Case below for your native operating system)

- [ ] Login as dev (unless you are already `logged in as dev`):
	
		su dev

- Install VSC using snap:

		sudo snap install --classic code # or code-insiders

- Now start VSC up using this syntax:

        code . 

    **Note**: We don't install VSC on a remote Linux box

    - To use VSC to access a remote Linux box we install VSC locally 
    - Then use `Remote SSH` to access the remote Linux box
    - Click on the `Extensions` icon (fifth large icon from the top left)
    - And do a search for `Remote SSH` 
    - It is usually installed by default (otherwise click `Install`)

- Once installed open a Terminal box:

        code .

    - Once started open the File menu on VSC and select `Open Folder`
    - Here you can navigate to the dev folder or just select the home folder
    - Select 'Yes' to `I trust the authors`
    - In the top menu go `Terminal->New Terminal` to open a Terminal box (inside VSC)

- Now that you have VSC up and running (and connected to the Linux box) it is time to load it up with all the Extentions it will need:

- Click on the 5th large icon from the top left (it is the Extensions icon)

    Add the following extensions by typing the name in the search box (some may already be installed):

    - C/C++ 
    - C/C++ Extensions Pack
    - C/C++ Themes
    - CMake 
    - CMake Language Support
    - CMake Tools
    - Remote SSH
    - Doxygen
    - GDB Debugger - Beyond 
    - C++ TestMate

    It is usually just a matter of typing in the name and then hitting the install button

    See *Resume/Next* steps below ...

### Alternate Case
#### Linux installion
see [How to install `Visual Studio Code (VSC)` on Linux](https://github.com/perriera/for_interfaces/tree/main/vsc/linux)

### Alternate Case
#### Mac installion
see [How to install `Visual Studio Code (VSC)` on macOS](https://github.com/perriera/for_interfaces/tree/main/vsc/mac)

### Alternate Case
#### Windows installion
see [How to install `Visual Studio Code (VSC)` on Windows](https://github.com/perriera/for_interfaces/tree/main/vsc/windows)

### Alternate Case
#### SSH access already setup
In the bottom left hand corner you will see a little blue box with a symbol resembling this `><` in it, (click on it).
- Now select the `Connection Current Window to Host ...` option.
- When asked paste the `dev@ip_address` portion of the SSH 
connection string, (leave out the leading `ssh `)
- Wait a moment for the SSH connection to happen
- As soon as it connects on the top menu do this `File->Open Folder` then select `/home/dev`
- Select `Yes, I trust the authors`
- Now on the top menu do this `Terminal->New Terminal`

    **Note**: You are now inside the `dev` home folder of the remote Linux box. 

- Optionally: In the case where you are asked to select between `Linux, Mac and Windows` select `Linux`

### Alternate Case
#### SSH access not already setup
The best way to resolve this issue is to follow the steps required when setting up a new remote Linux box over SSH (see [How to install Linux](https://github.com/perriera/for_interfaces/blob/main/linux/README.md)).
- For more options on setting up SSH see [SSH Alternate Case(s)](https://github.com/perriera/for_interfaces/blob/main/ssh/README.md)


### Summary
Either of the above links would help you with your VSC installation, (including Remote SSH support)

### Resume/Next Steps

- [How to install injectons.io(C++17)](https://github.com/perriera/injections)

### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
