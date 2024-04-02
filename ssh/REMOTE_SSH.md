
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

  - ON YOUR LOCAL COMPUTER (**not the remote Linx box**) display it's SSH public key:

        cat ~/.ssh/id_ed25519.pub 

  - Copy the displayed `SSH public key` to the clipboard

  - ON THE REMOTE LINUX BOX (**not your local computer**) add the `SSH public key` to *authorized_keys*:

            echo <paste clipboard contents here> >> ~/.ssh/authorized_keys 

      Restart the SSH server:

            sudo systemctl restart ssh

  - The following will show you the ssh command to connect to the Linux box:

            cd ~
            clear
            ANSI_BLUE="\e[34m"
            ANSI_GREEN="\e[32m"
            ANSI_RESET="\e[0m"
            output=$(hostname -I)
            output=($output)
            ssh_params="$(basename $PWD)@${output[0]}"
            echo -e "${ANSI_BLUE}COPY THE FOLLOWING TO A NOTEPAD"
            echo -e "AS IT IS THE SSH PARAMETERS NEEDED BY VSC:${ANSI_GREEN}"
            echo -e "${ssh_params}${ANSI_RESET}"

    - **Keep tract the SSH PARAMETERS value for use with VSC's Remote SSH**

  - Now show the ssh command to use:

            echo ssh ${ssh_params}

      Copy the displayed string to the clipboard

  - ON YOUR LOCAL COMPUTER (**not the remote Linx box**) paste the ssh command:

            ssh dev@111.222.333.444

      Where 111.222.333.444 will be the correct IP address

  - When asked to add the fingerprint say 'yes'

            Are you sure you want to continue connecting (yes/no/[fingerprint])? yes

  - ON YOUR LOCAL COMPUTER you would now see something like this:

            The programs included with the Ubuntu system are free software;
            the exact distribution terms for each program are described in the
            individual files in /usr/share/doc/*/copyright.

            Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
            applicable law.

            dev@ubuntu-4g:~$ 

  See *Resume/Next* steps below ... 

### Alternate Case
No SSH key on your client machine, create one:

 - see [Don't know anything about SSH public keys?](https://github.com/perriera/for_interfaces/blob/main/ssh/README.md)

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

### Resume Steps

- [How to install Visual Studio Code (VSC)](https://github.com/perriera/for_interfaces/tree/main/vsc)

### Next Steps
- [How to clone your project (with this template)](https://github.com/perriera/extras_dbo/blob/dev/docs/CLONE.md)
- [How To Configure SSH Key-Based Authentication on a Linux Server](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server)

### Disclaimer
> The word `if` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
