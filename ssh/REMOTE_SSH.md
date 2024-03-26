
## How to remote connect to your Linux box via SSH
> Whenever you create a new Ubuntu (or Linux) instance there is a .ssh directory that keeps track of zero or more SSH keys that are used by sites and servers to allow access over ssh. GitHub.com is a classic example of this. In order to allow SSH access to that site you must generate a SSH key and add it to your GitHub.com account.

 1. **GIVEN** we would like to access the Linux box over SSH
 2. **WHEN** we added the client SSH key to the Linux box's authorized_keys file
 3. **THEN** we can access the Linux box using SSH (as well as tools like VSC)

### Prerequisites
 1. The client operating system having a public SSH key
 2. [Remote Development using SSH](https://code.visualstudio.com/docs/remote/ssh)

### Resources
 1. [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
 2. [How To Configure SSH Key-Based Authentication on a Linux Server](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server)

### Wish Case
Assuming you have a public SSH key on the client computer:

  - ON YOUR CLIENT machine open a Terminal box and display it's SSH key:

            cat ~/.ssh/id_ed25519.pub 

  - ON THE LINUX box Copy the contents to the clipboard and add them to the authorized_keys file on the Linux server (*take note of the username you using on the Linux box*)

            echo <clipboard contents>
            echo <clipboard contents> >> ~/.ssh/authorized_keys 
            sudo systemctl restart ssh

  - The following will show you the ssh command to connect to the Linux box:

            cd ~
            output=$(hostname -I)
            output=($output)
            ssh_cmd="ssh $(basename $PWD)@${output[0]}"
            echo $ssh_cmd

   - Assuming the username is dev the output might resemble this:

            ssh dev@211.56.210.32 

> Be sure to be in the desired user account for the above to work properly, (aka. **su dev**)

  - ON YOUR CLIENT machine open a Terminal box use the ssh command generated above:

            ssh dev@211.56.210.32 

  - When asked to add the fingerprint say 'yes'

            Are you sure you want to continue connecting (yes/no/[fingerprint])? yes

  - In the case where everything is connected together properly you would see a terminal session showing user level access to the Linux box. You are now in a position to access the Linux box using Visual Studio Code or any tool that can use the SSH protocol, (see **Alternate Case** below)

### Alternate Case
#### (perriera) / injections
In the case where you were in the middle of installing `(perriera)/injections` resume here:
- see [How to install (perriera)/injections](https://github.com/perriera/injections)

### Alternate Case 
#### Using Visual Studio Code (VSC or 'code') via Remote SSH
In the case where you would like to access the Linux box via VSC over SSH:
 - Open VSC (ON YOUR CLIENT) 
 - In the bottom left corner there should be a little blue icon with these two symbols '><' (almost).
 - In the case that that symbol '><' is not present add 'Remote - SSH' using the Extensions (usually the 5th large icon on the top left of the VSC editor)
 - Click that icon and select 'Connect Current Window to Host ...' add the same ssh connection parameters used earlier (to test the SSH connection ex. 'perry@10.211.55.32' *not to be confused with this 'ssh perry@10.211.55.32')
 - Once connected open the File menu on VSC and select 'Open Folder'
 - Here you can navigate to the dev folder and select the project of your choice, (in this case it would be `dev/injections')
 - Select 'Yes' to `I trust the authors`
 > When asked 'Install C/C++ Extension Pack' say 'Yes'

### Alternate Case
No SSH key on your client machine, create one (**do not change the name of the SSH key file and do not supply a pass phrase**):
```
		ssh-keygen -t ed25519 -C "your_email@example.com"
```

### Alternate Case
No ip address shows up on ifconfig?
> Run the ifconfig without a filter (and usually take the first IP address you see)
```
    ifconfig
```
Where the output might look like this:
```
enp0s5: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.211.55.32  netmask 255.255.255.0  broadcast 10.211.55.255
        inet6 fdb2:2c26:f4e4:0:3e00:31a8:27ec:ce9  prefixlen 64  scopeid 0x0<global>
        inet6 fdb2:2c26:f4e4:0:2935:1877:fcd1:295d  prefixlen 64  scopeid 0x0<global>
        inet6 fe80::2a87:1e58:588a:5cb1  prefixlen 64  scopeid 0x20<link>
        ether 00:1c:42:f6:b0:a2  txqueuelen 1000  (Ethernet)
        RX packets 350  bytes 80833 (80.8 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 282  bytes 33770 (33.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 138  bytes 12021 (12.0 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 138  bytes 12021 (12.0 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

```
Such that the IP addess to test first (in this case is): ` inet 10.211.55.32 `

### Alternate Case
> *Failed to restart ssh.service: Unit ssh.service not found.*
```
sudo apt install openssh-server
```
or
```
sudo systemctl restart ssh
```
### Alternate Case
> **user.email not specified**<br/>
> **user.name not specified**<br/>
> You must specify your name and email for the git client to work<br/>
>  `git config --global user.name "My Name"`<br/>
> `git config --global user.email "myemail@example.com"`

### Alternate Case
#### "Could not establish connection to "[server_name]": Remote host key has changed, port forwarding is disabled."
It was something simple. Found while trying to review the question.
```
ssh-keygen -R "hostname"
```

"A supported OpenSSH compatible SSH client must also be installed." as listed in the system requirements of the documentation(linked in question). The key simply needs to be updated in said OpenSSH client before attempting the connection in Visual Studio again.

In this exact case it was as simple as going to [local_path]/.ssh/known_hosts and removing the old entry for the IP address and then attempting the connection again which now allows the verification of the new key.
- see [How to confirm a new remote host key in Visual Studio Code Remote - SSH extension?](https://stackoverflow.com/questions/64758096/how-to-confirm-a-new-remote-host-key-in-visual-studio-code-remote-ssh-extensio)

### Summary
> This should setup your SSH keys for your command line git client access to your GitHub.com account

### Next Steps
- [How to clone your project (with this template)](https://github.com/perriera/extras_dbo/blob/dev/docs/CLONE.md)
- [How To Configure SSH Key-Based Authentication on a Linux Server](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server)


#### TODO: Place in .md file of it's own
```

#### On the computer / Linux instance you are connecting to the new Linux box from:

  - [ ] Copy the SSH public key to the clipboard 
  
  		cat ~/.ssh/id_ed25519.pub 

#### On the new Linux box where you authorize the client SSH to be able to connect:

  - [ ] Add the SSH key to ~/.ssh/authorized_keys:

	   echo (clipboard contents) >> ~/.ssh/authorized_keys


```
