# WIP

## How to create a template for your injections.io(**your_project**)
**Given** the need to allow other developers to import your `injections.io(**your_project**)` (but allow you to keep **your_project** *untouched* moving forward) **when** we make a clone of `injections.io(intefaces_cpp)` (and adjust `CMakelists.txt` accordingly) **then** anyone wishing to use your `injections.io(**your_project**)` can do so quickly and easily

### Prerequisites
 - a project created using `injections.io(injections_cpp)` as a template
 - a project now known as `injections.io(**your_project**)` 
 - a good computer and a decent Internet connection

### Wish Case
Let's assume that you set out to incorporate the `MySQL` database support into a project and you successfully completed your own project to that effect (and you called it `x4`). Now other people in your department want to use it (even when it only has basic capabilities at the moment). You plan on adding more features to `x4` but today all your people need is basic functionality (for example just to be able to read from a `MySQL` database). Adding the ability to write to the `MySQL` database can be accomplished on your own time, (but right now your people have to know that at least the company can read from a `MySQL` database).

This is what you do:
- Do [How to add a 3rd party static library using CPM/CMakeLists.txt syntax](https://github.com/perriera/for_interfaces/blob/main/injections/how-to/add-a-3rd-party/static-library/README.md) 
- Assuming you called the project `x4` go to [`injections.io(intefaces_cpp)`](https://github.com/perriera/interfaces_cpp) 
- Press the green button labelled `Use this template`
- Select `Create a new repository`
- Call the new project `x4_cpp`
- Copy the URL from `Code->SSH` to the clipboard
- Clone the project to your Linux box (do **not** run the `~/RUNME.1st.sh` script)

        cd ~/dev
        git clone git@github.com:perriera/x4_cpp.git

 - **Note**: Your repo URL won't be `git@github.com:perriera/x4.git` (so use the URL for your `x4` repo)

- **Optional**: Open `~/dev/x4_cpp` with VSC (go `File->Open Folder ...`) 

- Now build and run the project ("where is, as is"):

        it_test.sh

- At the moment the project is not branded so the run attempt will appear to fail. So use this command instead:

        build/run-unittests-injections_cpp 

- The following would be the result:

        ===============================================================================
        All tests passed (16 assertions in 2 test cases)

- Now commit these changes to the Github repo (but do not add a tag):

         git add .; git commit -m "Successful build"; git push

#### Incorporate `injections.io(**your_project**)`
- Now here is where we incorporate `injections.io(**your_project**)` into the new template.
- Using VSC open `CMakeLists.txt` and navigate to here:

        cmake_minimum_required(VERSION 3.21)
        set(BUILT_UPON_LIBRARY "interfaces")
        set(BUILT_UPON_VERSION "3.57.1")
        set(BUILT_UPON_VENDOR "perriera")

- Now change the above to this:

        cmake_minimum_required(VERSION 3.21)
        set(BUILT_UPON_LIBRARY "x4")
        set(BUILT_UPON_VERSION "0.2.3")
        set(BUILT_UPON_VENDOR "perriera")

 - **Note**: Your repo URL won't be `set(BUILT_UPON_VENDOR "perriera")` (so use your Github.com account name instead of `perriera`)
 - **Note**: In the case you added more tags to your repo either select the latest tag or the tag that you'd like to release for this template. The developers that use your template will be able to update whatever tags you make available at a later date.

 - Now try to build the project again:

        it_test.sh

 - In this case an error diagnostic comes back:

    `add_executable cannot create target "sample_console" because another target`

 - This is because all `injection.io(C++17)` templates demonstrate how to create a `sample_console` app (for demonstration purposes). There are three ways to resolve this issue:
    - Change the name `sample_console` to `sample_console2`
    - Comment out the project target in the `CMakeLists.txt`
    - Merely `instruct` the CPM specification to **only** build the shared-library. 

- Scroll down the `CMakeLists.txt` to where you see this:

        CPMAddPackage(
            NAME ${BUILT_UPON_LIBRARY}
            GITHUB_REPOSITORY ${BUILT_UPON_VENDOR}/${BUILT_UPON_LIBRARY}
            VERSION ${BUILT_UPON_VERSION}
            OPTIONS "MAKE_SPDLOG_SHARED OFF"
            OPTIONS "MAKE_INJECTIONS_LIBRARY_ONLY ON"
            OPTIONS "MAKE_INTERFACES_LIBRARY_ONLY ON"
            OPTIONS "MAKE64BITONLY ON"
        )

- Change it to this:

        CPMAddPackage(
            NAME ${BUILT_UPON_LIBRARY}
            GITHUB_REPOSITORY ${BUILT_UPON_VENDOR}/${BUILT_UPON_LIBRARY}
            VERSION ${BUILT_UPON_VERSION}
            OPTIONS "MAKE_SPDLOG_SHARED OFF"
            OPTIONS "MAKE_INJECTIONS_LIBRARY_ONLY ON"
            OPTIONS "MAKE_INTERFACES_LIBRARY_ONLY ON"
            OPTIONS "MAKE_X4_LIBRARY_ONLY ON"
            OPTIONS "MAKE64BITONLY ON"
        )

- Now try to rebuild the project again:

        it_test.sh

- Now we can go back to `x4_cpp` and build it properly and run it:

        build/run-unittests-injections_cpp

- As `mysqlcppconn` was included in `x4` there is no need to re-add it the `INJECTIONS_CPP_THIRD_PARTY_LIBRARIES` for `x4_cpp`, (the fewer changes made the better). In the case where you would like to access `MySQL Connector/C++` header files from within `x4_cpp` you would uncomment out that line and add `mysqlcppconn`, (but in our case it is not necessary). 

- We can now update the Github repo for `x4_cpp` (but do **not** tag it):

         git add .; git commit -m "importing x4 successfully"; git push

#### Test the `x4_cpp` template:

- Go to your Github account to the `x4_cpp` project
- Click on `Settings`
- Activate `Template repository`
- Click on `x4_cpp` again
- Click on `Use this template`
- Click on `Create a new repository`
- Call it `x5'
- Click on `Create repository`
- Click on `Code->SSH` and copy the URL to the clipboard
- Clone the project to your local Linux box:

        cd ~/dev
        git clone git@github.com:perriera/x5.git
        cd x5
        it_test.sh

- Open the project inside VSC 
- Go `Open Folder` and navigate to `/dev/x5`
- Go `





The popular and well-established `mysql` database api will be used as an example of how to do this
- Do [How to install `MySQL` onto Ubuntu](https://github.com/perriera/for_interfaces/blob/main/db/mysql/README.md)
- Do [How to install `MySQL Connector/C++` support (using CPM/CMakeLists.txt syntax)](https://github.com/perriera/for_interfaces/blob/main/db/mysql/CPP.md)

### Alternate Case
#### `/usr/bin/ld: cannot find -linterfaces: No such file or directory`

- In this case the `x4` project was built with `injection.io(C++17)` and not `injection.io(interfaces)` (but the `injection.io(x4_app)` was built the `injection.io(interfaces)`). So, we resolve this issue by going back into the `x4` project and changing it build parameters.

- Using the VSC editor reopen the `x4` project, navigate to `CMakeLists.txt` and change this:

        cmake_minimum_required(VERSION 3.21)
        set(BUILT_UPON_LIBRARY "injections")
        set(BUILT_UPON_VERSION "5.55.2")

- To this:

        cmake_minimum_required(VERSION 3.21)
        set(BUILT_UPON_LIBRARY "interfaces")
        set(BUILT_UPON_VERSION "3.56.0")

- Then rebuild the project:

        it_test.sh

- Upon successful completion update the tag. 

- But before you do that we may as well make an entry into the `changelog.md`:

- Where it says:

        it_post.sh v0.2.2 "`The answer is always 42` -- The Hitchhiker's Guide to the Galaxy"

- Change it to:

        it_post.sh v0.2.2 "Upgraded to interfaces v3.56.0"

- Now run the upgrade script:

        upgrades_menu 4

- When you check the `changelog.md` file again you will see the line has been updated to:

        it_post.sh v0.2.3 "Upgraded to interfaces v3.56.0"

- Moreover, in VSC navigate to `include/x4/version.h` and see that the version number is the same as in the `changelog.md`:

        #define X4_VER_MAJOR 0
        #define X4_VER_MINOR 2
        #define X4_VER_PATCH 3
        #define X4_PROJECT_NAME "X4::Blueprint"

- Run the test cases again:

        it_test.sh

- Results in:

        [100%] Built target injections-bash-scripts-install
                ... MySQL replies: Hello World!
                ... MySQL says it again: Hello World!
        ===============================================================================
        All tests passed (2 assertions in 1 test case)

- Now tag the repo (cut & paste from `changelog.md`):

        tagit.sh v0.2.3 "Upgraded to interfaces v3.56.0"


### Alternate Case
#### Oracle support?
This exercise shows how to add a third party library with MySQL. It is just a matter of doing the following to add Oracle support (or any other 3rd party software product available on the Internet):
- Take the 3rd party provider and completely independent of the `injections.io(C++17)` framework take it through it's paces. [Find a good (and up to date) tutorial](https://www.udemy.com/courses/search/?src=ukw&q=how+to+install+oracle) on how to install and use that 3rd party library by itself. Even in the case were you have to [setup a fresh operating system first](https://github.com/perriera/for_interfaces/tree/main/linux), make sure that that product works **by itself** before attaching it to any thing else.
- Document *your* experience as a series of **step-by-step** instructions and repeat them as necessary, (until you see a complete and **consistent** demonstration of that product's capabilities that are of interest to you)
- *Feel free* to write your instructions down in *Wish Case* (README.md) format
- Then create a new project on your Github.com account using either:
    - `injections.io(injections_cpp)` (for just injections.io(C++17) support)
    - `injections.io(interfaces_cpp)` (for injections.io(interfaces) support) **recommended**
- Then and only then substitute all the steps documented here for `MySQL` with the vendor that you have tested and documented.  
- Upon successfull intergration of the 3rd party library add your **README.me** file to your Github.com repo (for the project).


### Summary
You now have installed a 3rd party static library to your `injections.io(injections_cpp)` based project

### Next Steps
 - [How to create a project using injections.io(injections_cpp)](https://github.com/perriera/injections_cpp)
 - [How to create a project using injections.io(interfaces_cpp)](https://github.com/perriera/interfaces_cpp) **recommended**
 - [How to create a template using injections.io(**your_project**)](https://github.com/perriera/interfaces_cpp) **recommended**

### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
