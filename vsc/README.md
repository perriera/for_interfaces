## How to install `Visual Studio Code (VSC)` 
> **Given** we need to edit text files, source code and build projects **when** we install Visual Studio Code (VSC) **then** we can build and edit any projects that require a text file editor  

### Prerequisites
- Linux instance
- Internet access
- **sudo** privilages 
- x11 or SSH access

### Wish Case
Visual Studio Code is a text editor that gives the user the ability to edit files using a GUI. In the case where you have already setup a SSH connection to the remote Linux box all you have to do now is install VSC locally (see Alternate Case below for your native operating system)

- Once installed open a Terminal box:

        code .

 - Once started open the File menu on VSC and select `Open Folder`
 - Here you can navigate to the dev folder or just select the home folder
 - Select 'Yes' to `I trust the authors`
 - In the top menu go `Terminal->New Terminal` to open a Terminal box (inside VSC)

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

### Next Steps

- [How to install injectons.io(C++17)](https://github.com/perriera/injections)



