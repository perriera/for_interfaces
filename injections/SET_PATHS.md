
## How to the PATH environment variable (using it_paths.sh)
> In this step we need to install all the tools used by this project (that you may or may not already have installed).

 1. **GIVEN** we need to have develope injectX based projects
 2. **WHEN** we order the PATH environment variable properly 
 3. **THEN** we can ensure the correct tools are accessible

### Prerequisites
- [How to install (perriera) / injections](https://github.com/perriera/for_interfaces/blob/main/injections/INSTALL.md)

### Wish Case
`(perriera) / injections` is a Github project available here: [git@github.com:perriera/injections.git](https://github.com/perriera/injections)

 - [ ] Open a Terminal window and display the current value of PATH:

        echo $PATH

    `/home/perry/.local/bin:/home/perry/.local/bin:/home/perry/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin`

    As you can see each of the PATH entries are not easy to decifer.

  - [ ] Now that we have built successfully `(perriera) / injections` do this:
	
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

		it_paths.sh fix

  - [ ] Something like this would display:

        IT_PATHS.SH injections::Blueprint (injectX) v5.49.11
        -----------------------------------------------------------
        desc: show current contents of PATH
        desc: add a parameter to generate new PATH
        -----------------------------------------------------------
        PATH=/home/perry/.local/bin
        PATH=${PATH}:/home/perry/.local/bin
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
        PATH=${PATH}:/snap/bin

    Copy the all `PATH=` entries above into the clipboard

 - [ ]  Open your `./bashrc` (or equivalent):

        vi ~/.bashrc

 - [ ]  Make adjustments similar to the following:

        PATH=/home/perry/.local/bin
        PATH=${PATH}:/usr/local/sbin
        PATH=${PATH}:/usr/local/bin
        PATH=${PATH}:/usr/sbin
        PATH=${PATH}:/usr/bin
        PATH=${PATH}:/sbin
        PATH=${PATH}:/bin
        PATH=${PATH}:/usr/games
        PATH=${PATH}:/usr/local/games
        PATH=${PATH}:/snap/bin

        #export PATH=$HOME/.local/bin:${PATH}
        export CPM_SOURCE_CACHE=$HOME/.cache/CPM
        export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}

    As you can tell the duplicate PATH entries are removed.

 - [ ] Source the `~/. bashrc` script:

       source ~/.bashrc

 - [ ] Now run the `it_paths.sh` script again:

		it_paths.sh 

 - [ ] Something like this would display:

        IT_PATHS.SH injections::Blueprint (injectX) v5.49.11
        -----------------------------------------------------------
        desc: show current contents of PATH
        desc: add a parameter to generate new PATH
        -----------------------------------------------------------
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

    As you can verify with a `echo $PATH` your PATH variable is now free of duplicates and ordered in a manner where you can keep track of which binaries are now available on your command line:

    `/home/perry/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin`
    
### Summary 
Now you have just used your very first bash script from *(perriera) / injections*, one designed to `ensure` that the PATH variable is properly ordered and easily verifiable using `it_paths.sh` and the `~/.bashrc` 

### Next Steps
- [How to install (perriera) / interfaces](https://github.com/perriera/for_interfaces/blob/main/injections/interfaces/INSTALL.md)

