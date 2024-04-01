## How to use the VI editor (basic instructions)
> **Given** we need to be able to make changes to Linux text files quickly and easily **when** we use the Linux standard vi editor (it actually originated with Unix from the 1970s) **then** we can make changes to configuration files without the need for more advanced editing tools 

### Prerequisites
- Linux environment

### Wish Case
#### Are you new to the vi editor?
As cyptic as the vi editor seems it's simplicity in design and use allows it to be the hero where most graphical based editors fail, (as it can operate in a text only environment). To use vi (for our purposes) take a note of the following:
- To edit a file:

        vi <name of text file>

- Navigate any displayed text with the standard cursor keys

>`vi` has a command mode that can be selected whenever you press the ESC key. For example whenever you are done adding text press ESC and either enter another mode, save your changes (or quit without saving any changes, see below):

- To append text press `a`
- To insert test press `i`
- To escape back into command mode press ESC
- To delete a character press `x`
- To delete a whole line press `dd`
- To save your changes press ESC, hold down SHIFT and press `z` twice
- To quit without making any changes press ESC then `:q!`

### Altenate Case
It's always good to make a copy of your file before making changes to any configuraion file as one single character (added or deleted) could knock out the entire configuration:

        cp ~/.bashrc ~/.bashrc.bak

Then in the event something messes up:

        cp ~/.bashrc.bak ~/.bashrc

### Alternate Case
In the case where you already did manage to knock a configuration, no worries. All you have to do is restore your last working version. 
- see [How to make a last working version (of your Linux instance)](https://github.com/perriera/for_interfaces/blob/main/linux/LWV.md)

### Summary
Now you know enough about the vi editor for it to become your #1 text editing tool whenever you find yourself in a pinch.

### Next Steps
- [How to install injections.io(C++17)](https://github.com/perriera/injections)
