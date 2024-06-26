
## How to set the PATH environment variable (using it_paths.sh)
> In this step we need to install all the tools used by this project (that you may or may not already have installed).

 1. **GIVEN** we need to have develope injectX based projects
 2. **WHEN** we order the PATH environment variable properly 
 3. **THEN** we can ensure the correct tools are accessible

### Prerequisites
- [How to install injections.io(C++17)](https://github.com/perriera/injections)

### Wish Case
`injections.io(C++17)` is a Github project available here: [git@github.com:perriera/injections.git](https://github.com/perriera/injections)

 - [ ] Open a Terminal window and display the current value of PATH:

        echo $PATH

    `/home/perry/.local/bin:/home/perry/.local/bin:/home/perry/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin`

    As you can see each of the PATH entries are not easy to decifer.

  - [ ] Now that we have built successfully `injections.io(C++17)` do this:
	
		it_paths.sh 
	
  - [ ] Something like this would display:
	
        IT_PATHS.SH injections::Blueprint (injectX) v5.49.11
        -----------------------------------------------------------
        desc: show current contents of PATH
        desc: add a parameter to generate new PATH
        -----------------------------------------------------------
        /home/perry/.local/bin
        /home/perry/.local/bin
        /home/perry/.local/bin
        /usr/local/sbin
        /usr/local/bin
        /usr/sbin
        /usr/bin
        /sbin
        /bin
        /usr/games
        /usr/local/games
        /snap/bin
        /snap/bin

    As you can tell certain path values are repeated (which is not an ideal). 
 
 - [ ]  To correct this issue do this:

		it_paths.sh install

  - [ ] Something like this would display:

        IT_PATHS.SH injections::Blueprint (injectX) v5.49.11
        -----------------------------------------------------------
        desc: show current contents of PATH
        desc: add a parameter to generate new PATH
        -----------------------------------------------------------
        PATH=/home/perry/.local/bin
        PATH=${PATH}:/home/perry/.local/bin
        PATH=${PATH}:/usr/local/sbin
        PATH=${PATH}:/usr/local/bin
        PATH=${PATH}:/usr/sbin
        PATH=${PATH}:/usr/bin
        PATH=${PATH}:/sbin
        PATH=${PATH}:/bin
        PATH=${PATH}:/usr/games
        PATH=${PATH}:/usr/local/games
        PATH=${PATH}:/snap/bin

    *Notice no duplicate entries*

 - [ ] Follow the prompts from there.

        vi ~/.bashrc

    *Unless there are specializations in the `.bashrc` script that you are aware of there would be no need to edit the base script.*

 - [ ] Now source  `.bashrc` (or open another Terminal session)

       source ~/.bashrc

    As you can verify with a `echo $PATH` your PATH variable is now free of duplicates and ordered in a manner where you can keep track of which binaries are now available on your command line:

    `/home/dev/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin`

    Something like the above would display.

 - [ ] Make a backup of the Linux box instance.

	**It might seem redundant but making a duplicate of the Linux box now gives you a convenient fall back.**

### Summary 
Now you have just used your very first bash script from *(perriera) / injections*, one designed to `ensure` that the PATH variable is properly ordered and easily verifiable using `it_paths.sh` and the `~/.bashrc` 

### Next Steps
- [How to install injections.io(C++17)(interfaces)](https://github.com/perriera/interfaces)

