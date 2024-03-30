## How to use the VI editor (basic instructions)
> todo: fill in the details here

### Alternate Case
#### Are you new to the vi editor?
As cyptic as the vi editor seems it's simplicity in design and use allows it to be the hero where most graphical based editors fail, (as it can operate in a text only environment). To use vi (for our purposes) take a note of the following:
- To append text press `a`
- To insert test press `i`
- To escape back into command mode press ESC
- To delete a character press `x`
- To delete a whole line press `dd`
- To save your changes press ESC, hold down SHIFT and press `z` twice
- To quit without making any changes press ESC then `:q!`
- Also, it's always good to make a copy of your file before making changes to any configuraion file as one single character (added or deleted) could knock out the entire configuration:

 		cp ~/.bashrc ~/.bashrc.bak

	In the case where you already did manage to knock a configuration, no worries. All you have to do is restore your last working version. 

		- See [How to make a last working version (of your Linux instance)](https://github.com/perriera/for_interfaces/blob/main/linux/LWV.md)
