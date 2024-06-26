## How to install `Visual Studio Code (VSC)` on macOS
> **Given** we need to edit text files, source code and build projects **when** we install Visual Studio Code (VSC) **then** we can build and edit any projects that require a text file editor  

### Prerequisites
- [Visual Studio Code on macOS](https://code.visualstudio.com/docs/setup/mac) (review)
- macOS based computer
- sudo privilages 

### Wish Case
Installation

1. Download [Visual Studio Code for macOS](https://code.visualstudio.com/docs?dv=osx).
2. Open the browser's download list and locate the downloaded app or archive.
3. Drag Visual Studio Code.app to the Applications folder, making it available in the macOS Launchpad.
4. Open VS Code from the Applications folder, by double clicking the icon.
5. Add VS Code to your Dock by right-clicking on the icon:
 	- located in the Dock
	- to bring up the context menu and choosing Options, 
	- "Keep in Dock"

### Alternate Case
#### Remote SSH
VSC has an extension that pretty comes standard during the install process. To access a remote Linux box using the Remote SSH extension merely click on the bottom left icon where you will see a blue `><` icon. 

- Be sure you have the ssh connection string
- example: dev@192.168.11.1
- Select `Collect Current Window to Host ...`
- Once connected do a `File -> Open Folder` and navigate to the project folder of choice (aka. `~/dev/injections`)

In the case were the ssh session does not connect:
- see [How to remote connect to your Linux box via SSH](https://github.com/perriera/for_interfaces/blob/main/ssh/REMOTE_SSH.md)

### Alternate Case
#### In the case it is an archive, extract the archive contents. ...
Extract the archive contents. Use double-click for some browsers or select the 'magnifying glass' icon with Safari.


### Summary
`Visual Studio Code (VSC)` has been installed on OS X.

### Next Steps

- [Visual Studio Code on macOS](https://code.visualstudio.com/docs/setup/mac) (review)


