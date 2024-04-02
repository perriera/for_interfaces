## How to install Ubuntu 22.04 using `digitalocean`
> In this step we show how to install Ubuntu on digitalocean.com

 1. **GIVEN** we need to be able to run Linux apps on the cloud
 2. **WHEN** we have a digitalocean account  
 3. **THEN** we can create and launch a Ubuntu instance

### Prerequisites
- an paid or evaluation account on [digitalocean.com](https://www.digitalocean.com)
- at time of writing [DigitalOcean is offering a $200 credit for 60 days](https://www.digitalocean.com)

### Wish Case
Assuming you have an account already setup on digitalocean.com
#### Create the Droplet
- Look for the `Droplets` menu selection (click it)
- Click the `Create Droplet` button
- Select a server farm closet to your current location
- Select `Ubuntu`
- Select `22.04`
- Review Droplet Type, CPU, Addional Storage and make any changes but the default selections are fine
- click `New SSH Key` to add your computer's SSH public key
- Change the Hostname to something much shorter (aka. `ubuntu4g`)
- Press `Create Droplet`
- After a few moments the droplet will dislay, (click it)
#### Configure the Droplet
- Find and select the `Access` button
- Find and select the `Launch Drop Console` button 
- Once inside the root terminal window create a user like this:

		sudo adduser dev 

	Specify a password and hit enter on everything else

- Now add dev to the **sudo** group:

		sudo adduser dev sudo

- Update the instance and reboot

		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt autoclean -y
		sudo reboot 

#### Relog into the Linux instance (using DigitalOcean)
- At present the console box would display a `Reload` or `Close` button

	Give it a minute and hit `Reload` or ... 

- After a minute or two attempt to relogin into the Linux instance:
	- Find and select the `Access` button
	- Find and select the `Launch Drop Console` button 

	See *Resume/Next Steps* ... 

### Alternate Case
#### You didn't see the chance to specify your own password?

	sudo deluser dev

Redo (and resume from) that step of the *Wish Case* ... 

- see [How do I create a user with a password in one line, in Bash, on Redhat?](https://serverfault.com/questions/868092/how-do-i-create-a-user-with-a-password-in-one-line-in-bash-on-redhat)

### Alternate Case
#### Don't know anything about SSH public keys?
- see [How to setup a SSH public key](https://github.com/perriera/for_interfaces/blob/main/ssh)

### Summary
You have created a Ubuntu instance on Digital Ocean

### Resume Steps

- [How to install injections.io(C++17)](https://github.com/perriera/injections)

### Next Steps

- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/cpp/README.md)

### Disclaimer
> The word `if` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
