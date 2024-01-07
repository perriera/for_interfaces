###
> - [Free up Disk Space – Clear Systemd Journal Logs in Ubuntu 20.04](https://ubuntuhandbook.org/index.php/2020/12/clear-systemd-journal-logs-ubuntu/)

```

1. run Disk Usage Analyser
2. rm -rf .cache
3. firefox -p
4. sudo apt-get clean
5. sudo apt-get autoremove --purge
6. sudo apt-get autoremove

journalctl --disk-usage

sudo journalctl --rotate
sudo journalctl --vacuum-time=2days
sudo journalctl --vacuum-size=100M
sudo journalctl --vacuum-files=5

sudo -H gedit /etc/systemd/journald.conf
#SystemMaxUse= and change it to SystemMaxUse=100M.

```

### xsnap.sh
```
 #!/bin/bash
 # Removes old revisions of snaps
 # CLOSE ALL SNAPS BEFORE RUNNING THIS
 set -eu
 snap list --all | awk '/disabled/{print $1, $3}' |
 	while read snapname revision; do
 		snap remove "$snapname" --revision="$revision"
 done


```
