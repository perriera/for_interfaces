[How to Increase Swap Size on Ubuntu Linux](https://linuxhandbook.com/increase-swap-ubuntu/)
[How to Add Swap Space on Ubuntu 18.04](https://linuxize.com/post/how-to-add-swap-space-on-ubuntu-18-04/)
### add
```
sudo swapon --show
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo vi /etc/fstab
```
add
```
/swapfile swap swap defaults 0 0
```
do
```
sudo swapon --show
sudo free -h
cat /proc/sys/vm/swappiness
```
do
```
sudo sysctl vm.swappiness=10
```
or
```
sudo vi /etc/sysctl.conf 
```
this
```
vm.swappiness=10
```
#### remove 
```
sudo swapoff -v /swapfile
```
Next, remove the swap file entry /swapfile swap swap defaults 0 0 from the /etc/fstab file.
```
sudo rm /swapfile
```
