#### multipass
>- [Multipass Documentation](https://multipass.run/docs)
>- [`multipass transfer` command](https://multipass.run/docs/transfer-command)
>- [How to run Ubuntu 22.04 VMs on Apple M1 ARM-based systems for free](https://multipass.run/docs/installing-on-macos)
>- [How to create a VM with Multipass](https://ubuntu.com/server/docs/virtualization-multipass)
>- [Creating a Backup of a Multipass Instance](https://github-wiki-see.page/m/dialloi659/multipass/wiki/Creating-a-Backup-of-a-Multipass-Instance)
Create a Snapshot
```
multipass stop dapper-manakin
multipass snapshot dapper-manakin --name "e1"
```
Restore from a Snapshot
```
multipass restore dapper-manakin.e1 
multipass start dapper-manakin
```

