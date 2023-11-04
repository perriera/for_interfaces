## sudo apt update issues
### [Ubuntu sudo apt get update 404 Not Found problem](https://askubuntu.com/questions/1385440/ubuntu-sudo-apt-get-update-404-not-found-problem)
>Most of the repositories and PPAs in your sources.list are no longer available and are throwing errors. I'd recommend restoring the default repositories.
> 1. First, restore the default repositories using these commands:
```
mkdir ~/solution
cd ~/solution/

cat << EOF > ~/solution/sources.list
deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse

deb http://archive.canonical.com/ubuntu focal partner
deb-src http://archive.canonical.com/ubuntu focal partner
EOF

sudo sed -i "s/focal/$(lsb_release -c -s)/" ~/solution/sources.list
sudo rm /etc/apt/sources.list
sudo cp ~/solution/sources.list /etc/apt/sources.list
```
> 2. Remove all the PPAs in your system:
```
sudo mv /etc/apt/sources.list.d/* ~/solution
```
> 3. Update the repositories:
```
sudo apt update
```
Now there should be no errors.

### missing key issues
[Fix apt-get update “the following signatures couldn’t be verified because the public key is not available”](https://chrisjean.com/fix-apt-get-update-the-following-signatures-couldnt-be-verified-because-the-public-key-is-not-available/)
[gpg: keyserver receive failed: Server indicated a failure](https://unix.stackexchange.com/questions/399027/gpg-keyserver-receive-failed-server-indicated-a-failure)
["The following packages have been kept back:" Why and how do I solve it?](https://askubuntu.com/questions/601/the-following-packages-have-been-kept-back-why-and-how-do-i-solve-it)
[apt-key deprecation warning when updating system](https://askubuntu.com/questions/1398344/apt-key-deprecation-warning-when-updating-system)