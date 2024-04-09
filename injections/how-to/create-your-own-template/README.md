## How to create a template for your injections.io(**your_project**)
**Given** the need to allow other developers to *import* `injections.io(**your_project**)` (but not make *direct* changes to it) **when** we make a clone of the `injections.io(injections_cpp)` template (and adjust `CMakelists.txt` to include any enhancements like 3rd party libraries) **then** anyone wishing to import your `injections.io(**your_project**)` can do so quickly and easily

### Prerequisites
 - a project created using `injections.io(injections_cpp)` as a template
 - a project now known as `injections.io(**your_project**)` 
 - a good computer and a decent Internet connection

**Note**: Once imported a project can have it's classes *overridden* but that does not affect the original class in your project.

### Wish Case
Let's assume that you set out to incorporate the `MySQL` database support into a project and you successfully completed your own project to that effect (and you called it `x4`). Now other people in your department want to use it (even when it only has basic capabilities at the moment). You plan on adding more features to `x4` but today all your people need is basic functionality (for example just to be able to read from a `MySQL` database). Adding the ability to write to the `MySQL` database can be accomplished as another `JIRA task`, (but at the moment your customer needs to just be able to read from a `MySQL` database using `injections.io(**your_project**)`).

This is what you do:
- Do [How to add a 3rd party static library using CPM/CMakeLists.txt syntax](https://github.com/perriera/for_interfaces/blob/main/injections/how-to/add-a-3rd-party/static-library/README.md) 
- Assuming you called the project `x4` go to [`injections.io(injections_cpp)`](https://github.com/perriera/injections_cpp) 
- Press the green button labelled `Use this template`
- Select `Create a new repository`
- Call the new project `x4_cpp`
- Copy the URL from `Code->SSH` to the clipboard
- Clone the project to your Linux box (do **not** run the `./RUNME.1st.sh` script)

        cd ~/dev
        git clone git@github.com:perriera/x4_cpp.git

 - **Note**: Your repo URL won't be `git@github.com:perriera/x4.git` (so use the URL for your `x4` repo)

- Using VSC go `File->Open Folder ...`) and select `/home/dev/dev/x4_cpp` 

- Using VSC open a Terminal window (go `Terminal->New Terminal`) and build the project:

      it_test.sh

- It would build and run with no errors.

- However there are no tags so `tagit.sh` reports that is can't find any:

        injections.io (v5.55.6)
        --------------------------------------------------------------------
        TAGIT.SH
        desc: show the current version tag (from Github) repo
        info: (or set the next version tag for the project)
        --------------------------------------------------------------------
        No arguments supplied
        Syntax: tagit.sh tag comment1 comment2 ... comment9
        tag should be major.minor.patch 
        for example here's the last tag:
        fatal: No names found, cannot describe anything.

- Which is precisely what we want as this is going to be the template for other developers to use to create applications based on `injections.io(**your_project**)`

- Now navigate to `CMakeLists.txt` and view this code:

        cmake_minimum_required(VERSION 3.21)
        set(BUILT_UPON_LIBRARY "injections")
        set(BUILT_UPON_VERSION "5.55.6")
        set(BUILT_UPON_VENDOR "perriera")

- Here we now link up your `x4` project:

        cmake_minimum_required(VERSION 3.21)
        set(BUILT_UPON_LIBRARY "x4")
        set(BUILT_UPON_VERSION "0.2.3")
        set(BUILT_UPON_VENDOR "perriera")

**Note**: In your case you would substitute `perriera` for the name on your Github account.

- Now before we build we need add a parameter to the CPM specification, (scroll down to see it):

        CPMAddPackage(
            NAME ${BUILT_UPON_LIBRARY}
            GITHUB_REPOSITORY ${BUILT_UPON_VENDOR}/${BUILT_UPON_LIBRARY}
            VERSION ${BUILT_UPON_VERSION}
            OPTIONS "MAKE_SPDLOG_SHARED OFF"
            OPTIONS "MAKE_EXTRAS_LIBRARY_ONLY ON"
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
            OPTIONS "MAKE_EXTRAS_LIBRARY_ONLY ON"
            OPTIONS "MAKE_INJECTIONS_LIBRARY_ONLY ON"
            OPTIONS "MAKE_INTERFACES_LIBRARY_ONLY ON"
            OPTIONS "MAKE_X4_LIBRARY_ONLY ON"
            OPTIONS "MAKE64BITONLY ON"
        )

- The `MAKE_X4_LIBRARY_ONLY` parameter tells the `x4` build files to only build the shared library (and nothing else).

- Now build the project again:

        it_test.sh

- The build and run is successful however we didn't do anything with your `x4` library. To make sure that `x4` and the `MySQL` test cases are linked up properly let us add something to make sure everything is connected.

- Navigate to `interfaces/sample/dock_instance.cpp` and change this:

        #include <iostream>
        #include <injections_cpp/sample/clazz.hpp>
        #include <injections/scripts/clazz.hpp>
        #include "../../test/vendor/catch.hpp"

- To this:

        #include <iostream>
        #include <injections_cpp/sample/clazz.hpp>
        #include <x4/sample/clazz.hpp>
        #include <injections/scripts/clazz.hpp>
        #include "../../test/vendor/catch.hpp"

- And down below change this:

        /**
        * @note the following line is from the libinjections.so shared library
        * @see CMakeLists.txt
        *
        */
        scripts::Instance dock2;

- To this:

        /**
        * @note the following line is from the libinjections.so shared library
        * @see CMakeLists.txt
        *
        */
        scripts::Instance dock2;

        /**
        * @note the following line is from the libx4.so shared library
        * @see CMakeLists.txt
        *
        */
        x4::sample::Instance dock3;
        dock3.prove_MySQL_is_working();

- Now build the project again:

        it_test.sh

- Now this time we get a `linker diagnostic`:

        undefined reference to `get_driver_instance'

- This is clearly a method from `MySQL Connector/C++` which means that the `MySQL` shared library has to be referenced from `CMakeLists.txt` in order for this to work. 

- So in `CMakeLists.txt` change this: 

        # set(INJECTIONS_CPP_THIRD_PARTY_LIBRARIES ldap gcrypt gnutls uuid microhttpd)

- To this: 

        set(INJECTIONS_CPP_THIRD_PARTY_LIBRARIES mysqlcppconn)

- Now build the project again:

        it_test.sh

- Now it built successfully but because this is a `template` the bash script couldn't find the test cases. So, in this case we run them directly:

        build/run-unittests-injections_cpp

- Now we see a familiar message:

        dev@ubuntu-4g:~/dev/x4_cpp$ build/run-unittests-injections_cpp
                ... MySQL replies: Hello World!
                ... MySQL says it again: Hello World!
        ===============================================================================
        All tests passed (16 assertions in 2 test cases)

#### Almost done: Save your template to your Github account, (without tags)

- Commit the working template to your Github repository:

        git add .; git commit -m "template ready"; git push

- Notice no tags were added here. 

### Now test your template:

- Assuming you called the project `x4_cpp` go to `https://github.com/perriera/x4_cpp`

 - **Note**: Your repo URL won't be `git@github.com:perriera/x4_cpp.git` (so use the URL for your `x4_cpp` repo)

 - Before you do anything else click on `Settings` and then click on `Template repository`. This will allow your new template to show up as an option for developers wishing to use your template. 

 - Now click on your `x4_cpp` again.

- Press the green button labelled `Use this template`
- Select `Create a new repository`
- Call the new project `x4_app`
- Copy the URL from `Code->SSH` to the clipboard
- Clone the project to your Linux box (this time we run the `./RUNME.1st.sh` script)

        cd ~/dev
        git clone git@github.com:perriera/x4_app.git
        cd x4_app
        ./RUNME.1st.sh

 - **Note**: Your repo URL won't be `git@github.com:perriera/x4.git` (so use the URL for your `x4` repo)

- Your `x4_app` would build and run fine.

- Using VSC go `File->Open Folder ...`) and select `/home/dev/dev/x4_app` 

- Using VSC open a Terminal window (go `Terminal->New Terminal`) and build the project:

      it_test.sh

- It would build and run with no errors again.

- Feel free to activate the `GDB Debugger- Beyond` extension and then place a breakpoint on line 77 of `interfaces/sample/dock_instance.cpp`:

        /**
        * @note the following line is from the libx4.so shared library
        * @see CMakeLists.txt
        *
        */
        x4::sample::Instance dock3;
        dock3.prove_MySQL_is_working();

- Then go `Run->Start Debugging` ... 

 see *Resume/Next Steps* below ...

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
You now have accomplished setting up your own `injections.io(**x4**)`:
- Incorporating a 3rd party static library to your `x4 repo`, (in this case `MySQL`)
- In additionl you have created a template for `x4 repo` (known as `x4_cpp`)
- This will allow you to have full control over all the source files (complete with full revision control) for your `x4 repo`
- At the same time this will allow developers wishing to use your `x4 repo` right down to the preferred version number:

        cmake_minimum_required(VERSION 3.21)
        set(BUILT_UPON_LIBRARY "x4")
        set(BUILT_UPON_VERSION "0.2.3")

- Of course any developers now importing `x4 repo` into their `x4_app` can just as easily add value to `x4 repo` then create their own template for other developers to use.
- Welcome to the world of `CPM/CMakeLists.txt` and `injections.io(C++17)`

### Next Steps
 - [How to create a project using injections.io(injections_cpp)](https://github.com/perriera/injections_cpp)
 - [How to create a project using injections.io(interfaces_cpp)](https://github.com/perriera/interfaces_cpp) **recommended**
 - [How to create a template using injections.io(**your_project**)](https://github.com/perriera/interfaces_cpp) **recommended**

### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
