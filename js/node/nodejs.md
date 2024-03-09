## How to install Node.js on Ubuntu, (22.04 or better)

> | use case (purpose) |
> | ------------------ |
>
>
> |**Given** we need to be able to install NodeJS and related tools
> |**when** install nodejs using nvm
> |**then** the ability to switch between versions is made easier.

### Prerequisites

1. Ubuntu installed
2. Access to the Internet
3. **sudo** privileges
4. [How To Install Node.js on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04)

### Wish Case

    sudo apt install curl -y
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source ~/.bashrc
    nvm list-remote
    nvm install 18
    nvm use 18
    nvm list
    sudo apt install npm -y
    source ~/.bashrc
    cat ~/.bashrc
    echo "echo node, npm, nvm " >> ~/.bashrc
    echo "node -v " >> ~/.bashrc
    echo "node -v " >> ~/.bashrc
    echo "nvm -v " >> ~/.bashrc
    node -v
    npm -v
    nvm -v

**Alternate Case**
Special releases of (using nvm)

    nvm install lts/fermium
    node -v

**Alternate Case**
Specific version of node

    nvm list-remote
    nvm install <whatever version number listed>

**Alternate Case**
Using **curl**

    cd ~
    curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
    nano nodesource_setup.sh
    sudo bash nodesource_setup.sh
    sudo apt install nodejs
    sudo apt install npm

**Alternate Case**
Using **sudo apt install**

    sudo apt update
    sudo apt install nodejs
    node -v
    sudo apt install npm

**Alternate Case**
Removing NodeJs

    sudo apt remove nodejs
    sudo apt purge nodejs

or

    nvm deactivate
    nvm uninstall node_version

**Summary**
This guide assumes that you are using Ubuntu 22.04. Before you begin, you should have a non-**root** user account with `sudo` privileges set up on your system.

### References

1. [how-to-install-node-js-on-ubuntu-22-04](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04#option-3-installing-node-using-the-node-version-manager)
2. [Ubuntu 22.04 initial server setup tutorial](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-22-04).
3. [How To Install Node.js on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04)
4. [installing-node-using-the-node-version-manager](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04#option-3-installing-node-using-the-node-version-manager)
5. [How can I completely uninstall nodejs, npm and node in Ubuntu [closed]](https://stackoverflow.com/questions/32426601/how-can-i-completely-uninstall-nodejs-npm-and-node-in-ubuntu)
6. [How to Install Angular CLI on Ubuntu 22.04](https://tecadmin.net/how-to-install-angular-cli-on-ubuntu-22-04/)

### Acknowledgements

> (c) Alex GarnettAuthor
> Senior DevOps Technical Writer
