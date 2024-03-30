## How to install Ubuntu 22.04 or 23.10 using `digitalocean`
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
- Select either 23.10 or 22.04
- Review Droplet Type, CPU, Addional Storage and make any changes but the default selections are fine
- click `New SSH Key` to add your computer's SSH public key
- Change the Hostname to something much shorter (aka. `ubuntu4g`)
- Press `Create Droplet`
- After a few moments the droplet will dislay, (click it)
#### Configure the Droplet
- Find and select the `Access` button
- Find and select the `Launch Drop Console` button 
- Once inside the root terminal window and add a dev account:

		sudo adduser dev

	Give it a password and click to the Y button
	Now add it to the sudo group

		sudo adduser dev sudo

- Update the instance and reboot

		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt autoclean -y
		sudo reboot 
		
### Alternate Case
#### Don't know anything about SSH public keys?
A SSH key is basically an automated password. Such that the computer takes care of all the password validation processing for you. That is, without needing an actual password provided you never specify a pass phrase, (never specify a pass phrase unless you are in a production environment).
- [How to setup a SSH key on Windows](https://www.youtube.com/watch?v=oAbYL3bktMA)
- [How to setup a SSH key on Mac](https://www.youtube.com/watch?v=a6tbQRNyfss)
- [How to setup a SSH key on Linux](https://www.youtube.com/watch?v=eUwOlc9HfZs)
> Once you generate a SSH key for your machine:
- copy the contents of the SSH key `PUBLIC` file (usually `~/.ssh/id_ed25519.pub`) to the clipboard
- click on the `New SSH Key` button (on the digitalocean Create Droplet page)
- paste the contents of the clipboard in the dialog provided
> Windows may have a quirky way of storing the public key, (too many details over here). Simply lookup YouTube again for a Windows video on where your version of Windows stores SSH keys.

### Alternate Case
#### Your computer doesn't know anything about SSH public keys either?
Windows computers may not support SSH keys as part of their standard disribution, (Mac and Linux distributions usually do). In any event there are too many changing variables to provide standard instructions here, so we'll rely on YouTube (again) to fill that gap:
- [How to setup a SSH server on Windows](https://www.youtube.com/watch?v=KLN2bY0dTtQ)
- [How to setup a SSH server on Mac](https://www.youtube.com/watch?v=h8zq6rGjSKA)
- [How to setup a SSH server on Linux](https://www.youtube.com/watch?v=Wlmne44M6fQ)
> In the case where the video links provided do not resolve the issue do a search on YouTube using either of the questions provide here, (ex. `How to setup a SSH server on Windows 11`)

### Summary
You have created a Ubuntu instance on Digital Ocean

### Resume Steps

- [How to install injections.io(C++17)](https://github.com/perriera/injections)

### Next Steps

- [How to install injections.io(C++17)](https://github.com/perriera/injections)
- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/cpp/README.md)
