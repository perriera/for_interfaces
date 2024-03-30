### Alternate Case
#### Don't know anything about SSH public keys?
A SSH key is basically an automated password. Such that the computer takes care of all the password validation processing for you. That is, without needing an actual password provided you never specify a pass phrase, (never specify a pass phrase unless you are in a production environment).
- [How to setup a SSH key on Windows](https://www.youtube.com/watch?v=oAbYL3bktMA)
- [How to setup a SSH key on Mac](https://www.youtube.com/watch?v=a6tbQRNyfss)
- [How to setup a SSH key on Linux](https://www.youtube.com/watch?v=eUwOlc9HfZs)
> Once you generate a SSH key for your machine:
- copy the contents of the SSH key `PUBLIC` file (usually `~/.ssh/id_ed25519.pub`) to the clipboard
- click on the `New SSH Key` button (on the digitalocean Create Droplet page)
- paste the contents of the clipboard in the dialog provided
> Windows may have a quirky way of storing the public key, (too many details to cover here). Simply lookup YouTube again for a Windows video on where your version of Windows stores SSH keys.

### Alternate Case
#### Your computer doesn't know anything about SSH public keys either?
Windows computers may not support SSH keys as part of their standard disribution, (Mac and Linux distributions usually do). In any event there are too many changing variables to provide standard instructions here, so we'll rely on YouTube (again) to fill that gap:
- [How to setup a SSH server on Windows](https://www.youtube.com/watch?v=KLN2bY0dTtQ)
- [How to setup a SSH server on Mac](https://www.youtube.com/watch?v=h8zq6rGjSKA)
- [How to setup a SSH server on Linux](https://www.youtube.com/watch?v=Wlmne44M6fQ)
> In the case where the video links provided do not resolve the issue do a search on YouTube using either of the questions provide here simply refine your search string. In the YouTube search bar type something like `How to setup a SSH server on Windows 11` and click enter.


