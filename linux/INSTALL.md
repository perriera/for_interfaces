
## How to install Linux
There are a number of ways to install Linux onto your computer with the variables being the type of computer you have and whatever operating system that is already on that hardware. In the case of install Linux as a virtual machine on top of a natively installed operating system is a preferred option when considering software development, (as this tends to be more practically). Installing Linux natively is an option but for development purposes can be more difficult with respect to restoring the Linux operating system from some form of malfunction. In effect it is a lot easier (and quicker) to restore a backup of a Linux instance and then retrace your steps to what may have caused the malfunction than it is try and isolate the malfuction. 

 1. **GIVEN** we need to have Linux installed (for software development)
 2. **WHEN** we install Ubuntu 22 as an instance of multipass 
 3. **THEN** we build software projects with the luxury of quick and easy backups

### Prerequisites
  - [How to install Linux using multipass](https://github.com/perriera/for_interfaces/blob/main/vm/multipass/MENU.md)

### Wish Case
Now that you have your project cloned we need to make sure you have the tools necessary to compile properly:

  - [ ] Do [How to install the tools necessary for C++11/17 projects](https://github.com/perriera/for_interfaces/blob/main/cpp/INSTALL.md)

### Summary 
Now you have installed the development environment and editor for a C++17 project (complete with cmake 3.21 support). The next steps are now to clone the project then setup your changelog.md (for accurate version control).

### Next Steps
 - [How to install (perriera) / injections](https://github.com/perriera/for_interfaces/blob/main/injections/INSTALL.md)
- [How to install (perriera) / interfaces](https://github.com/perriera/for_interfaces/blob/main/injections/interfaces/INSTALL.md)
