## How to install Ubuntu 22.04 using `digitalocean`
> **Given** we need to be able to run Linux apps on the cloud **when** we have a digitalocean account **then** we can create and launch an Ubuntu instance (to access via SSH)

### Prerequisites
- an paid or evaluation account on [digitalocean.com](https://www.digitalocean.com)
- at time of writing [DigitalOcean is offering a $200 credit for 60 days](https://www.digitalocean.com)

### Wish Case
#### Detailed instructions (see [simplified instructions](https://github.com/perriera/for_interfaces/blob/main/vm/digitalocean/README.md#alternate-case) below)
To run Linux apps on the cloud using a DigitalOcean account, you can follow these steps to create and launch a Ubuntu instance:

1. **Sign up for DigitalOcean**: If you haven't already, sign up for a DigitalOcean account at https://www.digitalocean.com/.

2. **Log in to DigitalOcean**: After signing up, log in to your DigitalOcean account.

3. **Create a Droplet**:
   - Click on the "Create" button and select "Droplets".
   - Choose Ubuntu as the distribution. You can select the version you prefer, such as Ubuntu 22.04 LTS.
   - Choose a plan based on your requirements. DigitalOcean offers various plans with different resources like CPU, RAM, and storage.
   - Choose a datacenter region closest to your location for optimal performance.
   - Optionally, you can add additional options like backups, monitoring, and block storage when needed.
   - Finally, click on the "Create Droplet" button.

4. **Access the Droplet via SSH**:
   - Once the Droplet is created, you'll receive an email with the root password and IP address.
   - Use an SSH client (e.g., PuTTY on Windows, Terminal on macOS/Linux) to connect to your Droplet. You can use the command:
     ```
     ssh root@your_droplet_ip
     ```
     Replace `your_droplet_ip` with the actual IP address of your Droplet.
   - Enter the root password provided in the email when prompted.

5. **Set up your environment**:
   - Once logged in, you can install any necessary software or packages for your Linux apps. You can use the `apt` package manager to install software on Ubuntu.
   - Configure any firewall rules, security settings, or other configurations required for your apps.

6. **Upload and Run Your Linux Apps**:
   - You can now upload your Linux apps to the Droplet using SCP or SFTP, or by cloning your project from a Git repository.
   - Follow any specific installation or configuration instructions for your apps.
   - Run your apps as needed.

 7. **For the purposes of injections(C++17)**
   - Carry out the *simplified instructions* below for creating and configuring the droplet

 - see *Resume/Next* steps below ... 

### Alternate Case
#### Create the Droplet (simplified instructions)
- Look for the `Droplets` menu selection (click it)
- Click the `Create Droplet` button
- Select a server farm closet to your current location
- Select `Ubuntu`
- Select perferred version (`22.04` recommended)
- Review Droplet Type, CPU, Addional Storage and make any changes but the default selections are fine
- Unless you have already done so create a SSH key for your local computer:

		ssh-keygen -t ed25519 -C "your_name@your_email.com"

	Do not supply a `passphrase` or change the filename
- Display the `SSH public key` and copy it to the clipboard:

		cat ~/.ssh/id_ed25519.pub

	For Windows users:

		cd .ssh
		type id_ed25519.pub

- Click `New SSH Key` and paste your computer's `SSH public key` 
- Now supply a name then `Add SSH Key` 
- Change the Hostname to something much shorter (aka. `ubuntu4g`)
- Press `Create Droplet`
- After a few moments the droplet will display 

### Alternate Case
#### Configure the Droplet (simplified instructions)
- Select the droplet you just created (or select `Droplets`)
- Find and select the `Access` button
- Find and select the `Launch Drop Console` button 
- Once inside the root terminal window create a user like this:

		sudo adduser dev 

	Specify a password and hit enter on everything else

- Now add dev to the **sudo** group:

		sudo adduser dev sudo
		cp -r .ssh /home/dev
		chown -R dev:dev /home/dev/.ssh/

- Update the instance and reboot

		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt autoclean -y
		sudo reboot 

	- A few dialog boxes might appear
	- Just TAB till you hightlight the `Ok` button and hit enter

#### Relog into the Linux instance (using DigitalOcean)
- At present the console box would display a `Reload` or `Close` button

	- Give it a minute and hit `Reload` 
	- When the instance comes back up do this:

			cd ~
			ANSI_GREEN="\e[32;1m"
			ANSI_RESET="\e[0m"
			output=$(hostname -I)
			output=($output)
			ssh_cmd="ssh dev@${output[0]}"
			echo -e "${ANSI_GREEN}$ssh_cmd${ANSI_RESET}"

	**Note**: Copy everything that displays in `green` to the clipboard


#### Login in remotely using a shell

- On your local computer open a shell (Terminal box or CMD.exe)
- Inside that shell paste the contents of the clipboard
- Hit `Enter` and select `yes` for the fingerprint
- Provided the SSH public key was added correctly something like this would display:

		To run a command as administrator (user "root"), use "sudo <command>".
		See "man sudo_root" for details.

		dev@ubuntu-4g2:~$ 

	**Note**: You are now logged in as `dev` over a SSH connection to a remote Linux box.
	- Write down the `ssh dev@ip_address` for later connection to that paticular Linux box when you wish to connect using a shell, (Terminal box or CMD.exe):

			ssh dev@ip_address

	- However only use the `dev@ip_address` portion to log into the Linux box when using a client app (such as `Visual Code Studio (VSC)`):

			dev@ip_address

- Feel free to close the `Access` dialog box

#### Shortcut to VSC
In the case where you just happen to be inside VSC
- Go `Terminal->New Terminal` and paste the contents of the clipboard:

			ssh dev@ip_address

- Select `yes` for the fingerprint
- You would now see a connection to the remote Linux box:


		To run a command as administrator (user "root"), use "sudo <command>".
		See "man sudo_root" for details.

		dev@ubuntu-4g2:~$ 

- To the bottom left there is a *green* square that resembles this: `><`
- Click on it and select `Connect Current Window to Host ...`  
- The enter the `dev@ip_address` and hit enter
- (just the `dev@ip_address` part not `ssh dev@ip_address`)
- Now VSC connects to the remote Linux box
- To activate the file panel do `File->Open Folder...` and select `/home/dev`
- Select `Yes, I trust the Authors`
- Go `Terminal->New Terminal` and this time see a session on the remote Linux box.
- You are now connected to the remote Linux box with VSC all set up to build projects with.
- You are now `logged in remotely as dev`


#### Backup/Restore you instance
In order to backup or restore your droplet you'll have to depend on the sevices provided by DigitalOcean.
- Click on Droplets (in the blue side bar)
- Click on the droplet you are working on
- Click on either Backups or Snapshots
	- Snapshots are better for intermediate backups
	- Whereas Backups are for regular weekly backups 
	- For our purposes a Snapshot will be fine
- Click on Snapshots
- Click on `Take live snapshot`

	See *Resume/Next* steps ... 

### Alternate Case
#### How to relog into you Droplet 
After logging into the DigitalOcean.com account:
- Click on the Droplet you were working on 
- Find and select the `Access` button
- Find and select the `Launch Drop Console` button 

### Alternate Case
#### You didn't see the chance to specify your own password?

	passwd

Redo (and resume from) that step of the *Wish Case* ... 

- see [How do I create a user with a password in one line, in Bash, on Redhat?](https://serverfault.com/questions/868092/how-do-i-create-a-user-with-a-password-in-one-line-in-bash-on-redhat)

### Alternate Case
#### Don't know anything about SSH public keys?
- see [How to setup a SSH public key](https://github.com/perriera/for_interfaces/blob/main/ssh)

### Summary
Remember to secure your Droplet by setting up a firewall, disabling root login, and keeping your system and applications updated regularly. Additionally, always follow best practices for security and data protection.

### Resume Steps

- [How to install injections.io(C++17)](https://github.com/perriera/injections)

### Next Steps

- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/cpp/README.md)

### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
