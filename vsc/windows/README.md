## How to install `Visual Studio Code (VSC)` on Windows
> **Given** we need to install Visual Studio Code (VSC) on Windows 10/11 **when** we install VSC from the browser inside Windows 10/11 **then** we can have VSC and all the extensions necessary to edit and build projects.

### Prerequisites
- [How to Install Visual Studio Code on Windows?](https://www.geeksforgeeks.org/how-to-install-visual-studio-code-on-windows/) (review)
- Windows instance
- sudo privilages 

### Wish Case
Installation

- [Download Visual Studio Code](https://code.visualstudio.com/download).
- Execute the download file.
- Accept the Terms & Conditions.
- Click on the Install button.
- Wait for the installation to complete.
- Click on the Launch button to start it.

### Alternate Case
#### Remote SSH
VSC has an extension that pretty comes standard during the install process. To access a remote Windows box using the Remote SSH extension merely click on the bottom left icon where you will see a blue `><` icon. 

- Be sure you have the ssh connection string
- example: dev@192.168.11.1
- Select `Collect Current Window to Host ...`
- Once connected do a `File -> Open Folder` and navigate to the project folder of choice (aka. `~/dev/injections`)

In the case were the ssh session does not connect:
- see [How to remote connect to your Windows box via SSH](https://github.com/perriera/for_interfaces/blob/main/ssh/REMOTE_SSH.md)

### Summary
`Visual Studio Code (VSC)` has been installed on Windows.

### Next Steps

- [How to install injectons.io](https://github.com/perriera/injections)



