### xterm stuff
>- [Set Title and Minimized Name in xterm](https://www.starnet.com/help/set-title-and-minimized-name-in-xterm/)
>- [Simply set xterm title?](https://askubuntu.com/questions/616256/simply-set-xterm-title)


Often, users have many xterms on their desktop which becomes hard to differentiate then since they are all titled the same. To assign a unique name to an xterm, use the -T switch. To assign a unique name when minimized, use the -n switch.

Example
```
xterm -T "Title of My xterm" -n "Title when minimized"
```

The bash shell uses the PROMPT_COMMAND variable to set the title, iconified and shell prompt. This overrides the -T and -n switches.

If you would like to specify the title and icon in the command line in bash with the -T and -n option, add the following line to your $HOME/.bashrc startup script

```
unset PROMPT_COMMAND
```

Alternatively, to set your title and minimized title in bash, add the following in your $HOME/.bashrc file

```
PS1="[\u@\h:\W]\$ "
PROMPT_COMMAND='\
echo -ne "\033]0;YOUR_TITLE_HERE\007";\
echo -ne "\033]1;YOUR_MINIMIZED_TITLE_HERE\007"'
```