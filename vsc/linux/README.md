## How to install `Visual Studio Code (VSC)` on Linux
> In this step we show how to install Visual Studio Code (VSC) on Linux

 1. **GIVEN** we need to use Visual Studio Code (VSC) on Linux 
 2. **WHEN** we install Visual Studio Code (VSC) on Linux 
 3. **THEN** we can launch Visual Studio Code (VSC) on Linux

### Prerequisites
- [Visual Studio Code on Linux](https://code.visualstudio.com/docs/setup/linux) (review)
- Linux instance
- sudo privilages 

### Wish Case
Installation

1. Install using snap

		sudo snap install --classic code # or code-insiders

### Alternate Case
#### Remote SSH
VSC has an extension that pretty comes standard during the install process. To access a remote Linux box using the Remote SSH extension merely click on the bottom left icon where you will see a blue `><` icon. 

- Be sure you have the ssh connection string
- example: dev@192.168.11.1
- Select `Collect Current Window to Host ...`
- Once connected do a `File -> Open Folder` and navigate to the project folder of choice (aka. `~/dev/injections`)

In the case were the ssh session does not connect:
- see [How to remote connect to your Linux box via SSH](https://github.com/perriera/for_interfaces/blob/main/ssh/REMOTE_SSH.md)

### Summary
`Visual Studio Code (VSC)` has been installed on Linux.

### Next Steps

- [How to install injectons.io(C++17)](https://github.com/perriera/injections)



