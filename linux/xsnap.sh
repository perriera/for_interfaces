 #!/bin/bash
 # Removes old revisions of snaps
 # CLOSE ALL SNAPS BEFORE RUNNING THIS
 set -eu
 snap list --all | awk '/disabled/{print $1, $3}' |
 	while read snapname revision; do
 		snap remove "$snapname" --revision="$revision"
 done

journalctl --disk-usage

sudo journalctl --rotate
sudo journalctl --vacuum-time=2days
sudo journalctl --vacuum-size=100M
sudo journalctl --vacuum-files=5

