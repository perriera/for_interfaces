### multipass tweaks
- [How to use a desktop in Multipass](https://discourse.ubuntu.com/t/how-to-use-a-desktop-in-multipass/16229/8)
- [How to set up a graphical interface](https://multipass.run/docs/set-up-a-graphical-interface)
```
multipass launch focal -n test-gui -d 20G
multipass launch  -c 2 -d 64G -m 8G -mount $HOME:/media/psf/home
```
