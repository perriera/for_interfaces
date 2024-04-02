## How to install `Visual Studio Code (VSC)` 
> In this step we show how to install Visual Studio Code (VSC) 

 1. **GIVEN** we need to use Visual Studio Code (VSC)  
 2. **WHEN** we install Visual Studio Code (VSC)  
 3. **THEN** we can launch Visual Studio Code (VSC)  

### Prerequisites
- Linux instance
- Internet access
- **sudo** privilages 

### Wish Case

- To install VSC you can following the latest instructions [here](https://code.visualstudio.com/download) or check out one the *Alternate Cases* below:

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
#### SSH access
In some cases the Linux box does not have x11/gui support. Hence, connecting to it via Remote SSH would be required. Each of the Linux, Mac and Windows installion instructions above descibe how to setup VSC on that type of operating system yet access a Linux box using SSH protocol.

- Do [How to remote connect to your Linux box via SSH](https://github.com/perriera/for_interfaces/blob/main/ssh/REMOTE_SSH.md) and return here
- Do install VSC using one of the three methods listed above (*Linux, Mac, Windows*) and return here
 - Open a **new** Terminal box and start a Visual Studio instance

    - On Windows or Mac you open it using a graphical menu
    - On Linux you can open it like this:

            code . 


 - In the bottom left corner there should be a little blue icon with these two symbols resembling this '><'
 - In the case that that symbol '><' is not present type `Remote - SSH` in the the `Search Extensions` box of the Extensions window (click the 5th large icon on the top left of the VSC editor) and install it, (wait for it to be installed)
 - Now click the blue `><` icon and select `Connect Current Window to Host ... `
 - Add the same ssh parameter (leave out the `ssh ` prefix) for example `dev@10.211.55.32`
 - Once connected open the File menu on VSC and select `Open Folder`
 - Here you can navigate to the dev folder or just select the home folder
 - Select 'Yes' to `I trust the authors`
 - In the top menu go `Terminal->New Terminal` to open a Terminal box (inside VSC)
 
    You would see the name of the server your created in the prompt:

        dev@ubuntu-4g:~$ _ 

    You are now connected remotely to the Linux box
    
### Summary
Either of the above links would help you with your VSC installation, (including Remote SSH support)

### Resume Steps

- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/cpp/README.md)

### Next Steps

- [How to install injectons.io](https://github.com/perriera/injections)



