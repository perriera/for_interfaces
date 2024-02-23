
## How to remote connect to your Linux box via SSH
> Whenever you create a new Ubuntu (or Linux) instance there is a .ssh directory that keeps track of zero or more SSH keys that are used by sites and servers to allow access over ssh. GitHub.com is a classic example of this. In order to allow SSH access to that site you must generate a SSH key and add it to your GitHub.com account.

 1. **GIVEN** we would like to access the Linux box over SSH
 2. **WHEN** we added the client SSH key to the Linux box's authorized_keys file
 3. **THEN** we can access the Linux box using SSH (as well as tools like VSC)

### Prerequisites
 1. The client operating system having a public SSH key

### Resources
 1. [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Wish Case
Assuming you have a public SSH key on the client computer:
 1. Open a Terminal box:

		cat ~/.ssh/id_ed25519.pub 

2. Copy the contents to the clipboard and add them to the authorized_keys file on the Linux server (*take note of the username you using on the Linux box*)

        echo <clipboard contents>
        echo <clipboard contents> >> ~/.ssh/authorized_keys 
        sudo systemctl restart ssh

3. Note the IP address of the Linux box:

        ifconfig | grep "netmask 255.255.255.0"

4. Now test to see if the client computer can access the Linux box (using the username where you added the client's SSH key):

        ssh perry@<ip address of Linux box>

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

### Summary
> This should setup your SSH keys for your command line git client access to your GitHub.com account

### Next Steps
- [How to clone your project (with this template)](https://github.com/perriera/extras_dbo/blob/dev/docs/CLONE.md)
- [How To Configure SSH Key-Based Authentication on a Linux Server](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server)


