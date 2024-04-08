## How to add a 3rd party static library using `CPM/CMakeLists.txt` syntax
**Given** the need to add 3rd party party library (for example `mysql`) support to your `injections.io(injections_cpp)` based project **when** we use adding `mysql` as an example of how to do this **then** we will have a working example of how to add 3rd party libraires using `CPM/CMakeLists.txt` syntax.

### Prerequisites
 - a project created using `injections.io(injections_cpp)` as a template
 - a good computer and a decent Internet connection

### Wish Case
The popular and well-established `mysql` database api will be used as an example of how to do this
- Do [How to install MySQL onto Ubuntu](https://github.com/perriera/for_interfaces/blob/main/db/mysql/README.md)
- Do [How to install `MySQL Connector/C++` support (using CPM/CMakeLists.txt syntax)](https://github.com/perriera/for_interfaces/blob/main/db/mysql/CPP.md)

### Alternate Case
#### Oracle support?
This exercise shows how to add a third party library with MySQL. It is just a matter of doing the following to add Oracle support (or any other 3rd party software product available on the Internet):
- Take the 3rd party provider and completely independent of the `injections.io(C++17)` framework take it through it's paces. Find a good (and up to date) tutorial on how to install and use that 3rd party library by itself. Even in the case were you have to setup a fresh operating system first, make sure that that product works **by itself** before attaching to any thing else.
- Document the **step-by-step** instructions and repeat them as necessary until both the installation the demonstration of that product's capabilities (that are of interest to you) and **consistent**
- Then create a new project on your Github.com account using either:
    - `injections.io(injections_cpp)` (for just injections.io(C++17) support)
    - `injections.io(interfaces_cpp)` (for injections.io(interfaces) support) **recommended**
- Then and only then substitute all the steps documented here for `MySQL` with the vendor that you have tested and documented.  


### Summary
You now have installed a 3rd party static library to your `injections.io(injections_cpp)` based project

### Next Steps
 - [How to create a project using injections.io(injections_cpp)](https://github.com/perriera/injections_cpp)
 - [How to create a project using injections.io(interfaces_cpp)](https://github.com/perriera/interfaces_cpp) **recommended**

### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
