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





The popular and well-established `mysql` database api will be used as an example of how to do this
- Do [How to install `MySQL` onto Ubuntu](https://github.com/perriera/for_interfaces/blob/main/db/mysql/README.md)
- Do [How to install `MySQL Connector/C++` support (using CPM/CMakeLists.txt syntax)](https://github.com/perriera/for_interfaces/blob/main/db/mysql/CPP.md)

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