# Disclaimer
> the following is a work in progress 

### [(perriera) / htmlforge_net](https://github.com/perriera/htmlforge_net)

Welcome to the **(perriera) / htmlforge_net** project.

<div align="center">
  <img width="442" height="320" src="assets/injections.jpg">
  <br>
</div>

## Who would want to use this?

> Anyone with an interest in developing C++ applications using **(perriera)/injections**

## Prerequisties

> 1. An account on Github.com (or access to Github.com)
> 2. A Ubuntu style Linux box with C++ tools and the git utility installed

## Installation 
### Option #1: Create a repository on Github.com using (perriera)/htmlforge_net as the template
Then on your local Linux box:
```
mkdir ~/dev
cd ~/dev
git@github.com:perriera/<your repository>.git
cd <your repository>
./RUNME.1st.sh
```
### Option #2: Create a clone of (perriera)/htmlforge_net as the template
> Using the name for your new source repository replace 'sample_app' below:
```
git@github.com:perriera/htmlforge_net.git
mv htmlforge_net sample_app
cd sample_app
```
**Before you go any further, make whatever changes you need to setup the project for use with your own local git-based repository then:**
```
cd sample_app
./RUNME.1st.sh
```
At the end of the `./RUNME.1st.sh` all identifiers in the `htmlforge_net` template will be changed to the name you selected for the source repository, (aka. whatever the name of the parent folder is).

### Important
#### `C/C++ Extension Pack` (incorrect gdb breakpoint issue)
- At the time of this writing the `C/C++ Extension Pack` is having issues with setting `gdb` breakpoints properly. 
- To resolve this issue we recommend adding the `GDB Debugger - Beyond` extension and using the "by-gdb" format inside the .vscode/launch.json file for setting up applications for debugging purposes:
```
    {
      "type": "by-gdb",
      "request": "launch",
      "name": "Launch(gdb)",
      "program": "${workspaceFolder}/build/run-unittests-${workspaceRootFolderName}",
      "preLaunchTask": "Build C++ project",
      "cwd": "${workspaceRoot}"
    },
```

### Documentation
> For additional information see [How to install (perriera)/injections](https://github.com/perriera/for_interfaces/blob/main/injections/INSTALL.md) or the latest `htmlforge_net/docs/` folder (**run docs.sh from the project folder periodically for the latest docs/ folder updates**)

### Credits

> 1. Markup Language (ML) editing provided by [SlackEdit.io](https://stackedit.io/app#)
> 2. CMakeLists.txt template: [David Dumke](https://www.linkedin.com/in/davidtjdumke)
> 3. CPM support compliments: [Matt Williams](https://github.com/thebashpotato)

### Copyright

> © 2024 EXPARX OPEN SOURCE TECHNOLOGIES CANADA INCORPORATED, 
> MIT License (MIT) Copyright © 2024 Perry Anderson, (perry@exparx.ca). (See [LICENSE.md](https://github.com/perriera/injections/blob/dev/LICENSE.md) for complete licensing details)
