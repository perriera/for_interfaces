#### multipass
### Installation
1. [How to install Multipass on macOS](https://multipass.run/docs/installing-on-macos#heading--install-upgrade-uninstall)
2. `multipass launch`
3. `multipass list`
4. `multipass stop <name>`
```
multipass set local.<name>.memory=8G
multipass set local.<name>.cpus=2   
multipass set local.<name>.disk=64GB
```
5. `multipass start <name>`
6. `multipass shell <name>`
```
adduser dev
adduser dev sudo
su dev
```

>- [Multipass Documentation](https://multipass.run/docs)
>- [`multipass transfer` command](https://multipass.run/docs/transfer-command)
>- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
>- [How to run Ubuntu 22.04 VMs on Apple M1 ARM-based systems for free](https://multipass.run/docs/installing-on-macos)
>- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
### Snapshots
>- [Creating a Backup of a Multipass Instance](https://github-wiki-see.page/m/dialloi659/multipass/wiki/Creating-a-Backup-of-a-Multipass-Instance)
Create a Snapshot
```
multipass stop dapper-manakin
multipass snapshot observant-earwig --name "e1"
```
Restore from a Snapshot
```
multipass restore dapper-manakin.e1 
multipass start observant-earwig
```
### Configuration
>- [How can I change memory (RAM) size of existing Multipass virtual machine?](https://github.com/canonical/multipass/issues/1265)
`multipass set [local.<instance-name>.(cpus|disk|memory)](https://multipass.run/t/)]=[value]`
```
multipass set local.dapper-manakin.memory=8G
multipass set local.observant-earwig.cpus=2   
multipass set local.observant-earwig.disk=64GB
```
### Shell
>- How to login a shell
```
multipass shell observant-earwig
```

