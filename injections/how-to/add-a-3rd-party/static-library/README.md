## How to add a 3rd party static library using `CPM/CMakeLists.txt` syntax
**Given** the need to add 3rd party library (for example `mysql` support) to your `injections.io(injections_cpp)` based project **when** we use adding `mysql` as an example of how to do this **then** we will have a working example of how to add 3rd party libraires using `CPM/CMakeLists.txt` syntax.

### Prerequisites
 - [How to install `injections.io(C++17)`](https://github.com/perriera/injections)
 - a good computer and a decent Internet connection

### Wish Case
The popular and well-established `mysql` database api will be used as an example of how to do this
- [Create a new project and call it `x4` ](https://github.com/perriera/injections_cpp)
- Do [How to install `MySQL` onto Ubuntu](https://github.com/perriera/for_interfaces/blob/main/db/mysql/README.md)
- Do [How to install `MySQL Connector/C++` support (using CPM/CMakeLists.txt syntax)](https://github.com/perriera/for_interfaces/blob/main/db/mysql/CPP.md)

### Alternate Case
#### Alternative Template selections
By `injections.io(injections_cpp)` based this would mean any template that is based off this original project. Which includes:
-  `injections.io(interfaces_cpp)`
-  `injections.io(htmlforge_cpp)`
> The difference is that `injections.io(injections_cpp)` will only include the `injections` framework (by default). Whereas `injections.io(interfaces_cpp)` includes both `injections` and `interfaces`. Whereas `injections.io(htmlforge_cpp)` includes both `injections`, `interfaces` and `htmlforge_net`, (but any of these can be changed at a later date).

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
 - [How to create a template for your injections.io(**your_project**)](https://github.com/perriera/for_interfaces/tree/main/injections/how-to/create-your-own-template) **recommended**

### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
