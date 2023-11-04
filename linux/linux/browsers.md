### [How to Install Google Chrome on Ubuntu Linux](https://www.howtogeek.com/731805/how-to-install-google-chrome-on-ubuntu-linux/)
```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -f install
```
> Google Chrome adds a repository to the list of repositories that the apt command checks when it's looking for installation files. So, although Ubuntu doesn't have Google Chrome in any of the standard Ubuntu repositories, you can still use apt to upgrade Chrome.
```
sudo apt install google-chrome-stable
```