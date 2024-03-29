## How to install Ubuntu 22.04 or 23.10 using `digitalocean`
> In this step we show how to install Ubuntu on digitalocean.com

 1. **GIVEN** we need to be able to run Linux apps on the cloud
 2. **WHEN** we have a digitalocean account  
 3. **THEN** we can create and launch a Ubuntu instance

### Prerequisites
- an account on digitalocean.com
- note an account is not a free service
- however it usually has a most excellent free trial period
- at time of writing ($200 credit for 60 days)

### Wish Case
Assuming you have an account already setup on digitalocean.com
#### Create the Droplet
- Look for the `Droplets` menu selection (click it)
- Click the `Create Droplet` button
- Select a server farm closet to your current location
- Select `Ubuntu`
- Select either 23.10 or 22.04
- Review Droplet Type, CPU, Addional Storage and make any changes but the default selections are fine
- Added SSH key for the machine you are using (click `New SSH Key`)
- Change the Hostname to something much shorter (aka. `ubuntu4g`)
- Press `Create Droplet`
- After a few moments the droplet will dislay, (click it)
#### Configur the Droplet
- Find and select the `Access` button
- Find and select the `Launch Drop Console` button 
- Once inside the root terminal window proceed to Next Steps

### Summary
You have created a Ubuntu instance on Digital Ocean

### Resume Steps

- [How to install (perriera)/injections](https://github.com/perriera/injections)

### Next Steps

- [How to install (perriera)/injections](https://github.com/perriera/injections)
- [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/cpp/INSTALL.md)
