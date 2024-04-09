## How to install `MySQL Connector/C++` 3rd party api support (using `CPM/CMakeLists.txt` syntax)
**Given** we need to access a MySQL database from C++ (Ubuntu style) **when** we install `MySQL Connector/C++`  **then** we can manage data in a MySQL database using our `injections.io(injections_cpp)` C++ program

### Prerequisites
  - [How to install MySQL onto Ubuntu](https://github.com/perriera/for_interfaces/blob/main/db/mysql/README.md)
 
**Note**: This Wish Case doubles as an introduction to the world of **dock/molds** and how this technique plays an intergral part in the formation of `injection.io(sample)::Blueprints`.

### Wish Case
Setting up mysql C++ support onto Ubuntu is not that difficult. However, exact details on how to do this vary with each and every version of Linux. We have assembled instructions here that work well for the Ubuntu 18.x to Ubuntu 22.x series of Linux vendors:

#### Tutorial setup

  - Create an example project using `injections.io(injections_cpp)` as the template and call it `x4`

  - Be sure to clone and then brand the project: 

              mkdir ~/dev
              cd ~/dev
              git clone git@github.com:perriera/x4.git
              cd x4
              ./RUNME.1st.sh

 - **Note**: Your repo URL won't be `git@github.com:perriera/x4.git` (so use the URL for your `x4` repo)

  - Now make sure the test cases run successfully:

              it_test.sh

#### Add MySQL Connector/C++
 - To add `MySQL Connector/C++` support

		sudo apt-get install libmysqlcppconn-dev -y

 - Now check out the standard include directory

		ls /usr/include/cppconn/

 - Now check out where the `mysql` C++ additions to the operating system were installed:

		find /usr -name mysql
		
 - You should see something like
		
		/usr/lib/mysql
		/usr/share/bash-completion/completions/mysql
		/usr/share/mysql
		/usr/bin/mysql

#### Test MySQL Connector/C++ (shared library linkage) support 

 - In your `CMakeLists.txt` you need to add **mysqlcppconn**:
		
       # 
       # X4_THIRD_PARTY_LIBRARIES
       #
       # list here any 3rd party libraries that you want that were
       # installed using sudo apt install ....
       #
       # set(X4_THIRD_PARTY_LIBRARIES ldap gcrypt gnutls uuid microhttpd)
       set(X4_LIBS_COMMON stdc++fs ${X4_THIRD_PARTY_LIBRARIES} Threads::Threads)
       set(X4_LIBS_NEEDED injections ${BUILT_UPON_LIBRARY} ${X4_LIBS_COMMON})

 - In the above code block of `CMakeLists.txt` we need to uncomment this line:

       # set(X4_THIRD_PARTY_LIBRARIES ldap gcrypt gnutls uuid microhttpd)
       
-  Then change it's contents to this:

       set(X4_THIRD_PARTY_LIBRARIES mysqlcppconn)

- That's all that needs to be done for `CMakeLists.txt`, (in VSC go `Terminal->Run Build Task...`) to see a successful build and run the test cases again:

       it_test.sh

#### Test MySQL Connector/C++ (header file) support 

 - [ ] In VSC display this file: `interfaces/mold_interface.cpp` and add these lines just above where it says `using namespace x4;`
		
        #include <cppconn/driver.h>
        #include <cppconn/exception.h>
        #include <cppconn/resultset.h>
        #include <cppconn/statement.h>

        using namespace x4;

 - [ ] Now change the dock'd `exec()` method from this:

       When(Method(dock, exec)).AlwaysDo([&_history]
       (const sample::Cmd& cmd) {

              injectx(sample::NothingSpecified, cmd);
              auto dup = cmd + " 2>/dev/null";
              auto status = ::system(dup.c_str());
              inject2(sample::CmdFailure, status, dup);
              _history.push_back(cmd);

       });

 - [ ] To this:

       When(Method(dock, exec)).AlwaysDo([&_history]
       (const sample::Cmd&) {

              sql::Driver* driver;
              sql::Connection* con;
              sql::Statement* stmt;
              sql::ResultSet* res;

              /* Create a connection */
              driver = get_driver_instance();
              con = driver->connect("tcp://127.0.0.1:3306", "sammy", "password");
              /* Connect to the MySQL test database */
              con->setSchema("test");

              stmt = con->createStatement();
              res = stmt->executeQuery("SELECT 'Hello World!' AS _message");
              while (res->next()) {
                     std::cout << "\t... MySQL replies: ";
                     /* Access column data by alias or column name */
                     std::cout << res->getString("_message") << std::endl;
                     std::cout << "\t... MySQL says it again: ";
                     /* Access column data by numeric offset, 1 is the first column */
                     std::cout << res->getString(1) << std::endl;
              }

              delete res;
              delete stmt;
              delete con;

       });

 - Down under comment out one of the method verifications from this:

       Verify(Method(dock, exec));
       Verify(Method(dock, history));

 - To this:

       Verify(Method(dock, exec));
       // Verify(Method(dock, history));

 - In VSC change the name of this file from `interfaces/dock_instance.cpp` to this `interfaces/dock_instance.cxx`

  - In VSC display this file: `interfaces/test_interface.cpp` and change this:

        REQUIRE_INJECTION(i.exec("ls /root"), CmdFailure);

         try {
            i.exec("");
            FAIL("sample::NothingSpecified expected");
         }
         resolve(sample::NothingSpecified) {
            // echo(ex);
            SUCCEED(ex.what());
         }
         resolve_all_injections() {
            FAIL("sample::NothingSpecified expected");
         }

         try {
            i.exec("ls /root");
            FAIL("sample::CmdFailure expected");
         }
         resolve(sample::CmdFailure) {
            // echo(ex);
            SUCCEED(ex.what());
         }
         resolve_all_injections() {
            FAIL("sample::CmdFailure expected");
         }

         /**
          * @test sample::Blueprint::history() method
          *
          */

         try {
            i.exec("ls >/dev/null");
            SUCCEED("no exception generated");
            REQUIRE(i.history().size() == 1);
            REQUIRE(i.history()[0] == "ls >/dev/null");
            // std::std::cout << i;
         }
         resolve_all_injections() {
            echo(ex);
            FAIL("no exception expected");
         }

  - To this:

         i.exec("");

  - Save your changes and rerun the test cases:

         it_test.sh

  - You would see something to the effect:

              [ 37%] Linking CXX executable run-unittests-x4
              [ 75%] Built target run-unittests-x4
              Consolidate compiler generated dependencies of target sample_console
              [ 87%] Linking CXX executable sample_console
              [100%] Built target sample_console
              [100%] Built target injections-bash-scripts-install
                     ... MySQL replies: Hello World!
                     ... MySQL says it again: Hello World!
              ===============================================================================
              All tests passed (2 assertions in 1 test case)

#### Test MySQL Connector/C++ (database accuracy) support 

 - To double check that the database contains the correct data (the password is `password`):

		mysql -u sammy -p 

 - To verify the data we retrieved in our C++ program is the same:

		SELECT 'Hello World!' AS _message;

 - You would see:

       +--------------+
       | _message     |
       +--------------+
       | Hello World! |
       +--------------+
       1 row in set (0.00 sec)

 - You have just accessed MySQL data using the MySQL Linux utility (the same data that the `x4` `exec` method retrieved)

		exit

#### Commit to Github project our changes
Now in this case we only tested that the `MySQL` shared libraries could be accessed and that the `MySQL` header files could be used inside `x4`. Our aim here is just to show that we can link to the '`MySQL` shared libraries and retrieve data from a `MySQL` database, (we could call this the *proof-of-concept* phase of the **molding the interface** process). Now we need to take it up a notch, we need to incorporate our successful mold into a dock. 

- Before we do that let's commit our changes to the repo:

       upgrades_menu 4
       tagit.sh

- Whatever number tagit.sh spits out just add one to the *minor* value (as `upgrades_menu 4` bumps it up by one). 

- So, when `tagit.sh` by itself displays this:

       injections.io (v5.55.2)
       --------------------------------------------------------------------
       TAGIT.SH
       desc: show the current version tag (from Github) repo
       info: (or set the next version tag for the project)
       --------------------------------------------------------------------
       No arguments supplied
       Syntax: tagit.sh tag comment1 comment2 ... comment9
       tag should be major.minor.patch 
       for example here's the last tag:
       v0.2.1

- We now want to bump up the *minor* value:

       tagit.sh v0.2.2 

- The latest changes to the repo are now committed and a new tag `v0.2.2` has been created for it.

#### Now we dock our molded interface into a C++ class
Molds allow the developer to work out details of a given interface independant of the implementation. Once the finite details of the molded interface meet the primary objective(s) of the interface the working code is promoted to the C++ class level. We call this process of copying working code from the mold to the dock **docking**. 

- To **dock** your first blueprint open the `incude/x4/sample/class.hpp` file using your favorite code editor, (which is VSC) in this example:

         virtual void exec(
            const sample::Cmd& cmd)
            const override
         {
            injectx(sample::NothingSpecified, cmd);
            auto dup = cmd + " 2>/dev/null";
            auto status = ::system(dup.c_str());
            inject2(sample::CmdFailure, status, dup);
            _history.push_back(cmd);
         }

- Now take a copy of all the code for this method `exec` and replace the current source code with it:

         virtual void exec(
            const sample::Cmd& cmd)
            const override
         {

              sql::Driver* driver;
              sql::Connection* con;
              sql::Statement* stmt;
              sql::ResultSet* res;

              /* Create a connection */
              driver = get_driver_instance();
              con = driver->connect("tcp://127.0.0.1:3306", "sammy", "password");
              /* Connect to the MySQL test database */
              con->setSchema("test");

              stmt = con->createStatement();
              res = stmt->executeQuery("SELECT 'Hello World!' AS _message");
              while (res->next()) {
                     std::cout << "\t... MySQL replies: ";
                     /* Access column data by alias or column name */
                     std::cout << res->getString("_message") << std::endl;
                     std::cout << "\t... MySQL says it again: ";
                     /* Access column data by numeric offset, 1 is the first column */
                     std::cout << res->getString(1) << std::endl;
              }

              delete res;
              delete stmt;
              delete con;

         }

- Now take a copy of all the header files required for the above code and place it just below the `interface.hpp` declaration:

       #ifndef _X4_SAMPLE_CLAZZ_HPP
       #define _X4_SAMPLE_CLAZZ_HPP

       #include <x4/sample/interface.hpp>
       #include <cppconn/driver.h>
       #include <cppconn/exception.h>
       #include <cppconn/resultset.h>
       #include <cppconn/statement.h>

       namespace x4 {

- Now change the extenion on the dock file itself back from `.cxx` to `.cpp`

       interfaces/sample/dock_instance.cxx

- This will allow the dock to be included with the next build:

       interfaces/sample/dock_instance.cpp

- Now build and run the test cases:

       it_test.sh

- Your build process would come back with a warning:

       warning: unused parameter ‘cmd’ [-Wunused-parameter]
       68 |             const sample::Cmd& cmd)
       |             ~~~~~~~~~~~~~~~~~~~^~~

- While we can ignore this warning the whole point of molding interfaces is to identify any unnecessary code. So, why don't we refine our interface by make two changes. The first one being to remove this unused parameter from `sample::Blueprint`.

- In the file  `incude/x4/sample/interface.hpp` change the method signature from this:

         virtual void exec(
            const Cmd&)
            const pure;

- To this:

         virtual void exec()
            const pure;

- And while we are at it let us give the method a better name, from this:

         virtual void exec()
            const pure;

- To this:

         virtual void prove_MySQL_is_working()
            const pure;

- To see one of the key benefits to [Interface-based programming](https://en.wikipedia.org/wiki/Interface-based_programming) is the ability for the C++ `gcc` compiler to quickly identify method signature changes:

       it_test.sh

- Now that we have *changed* the method signature (compliments the sample::Blueprint *interface*) anywhere in the code where that method is being used will **immediately** inform you of the change. 

       const’ marked ‘override’, but does not override
       67 |          virtual void exec(
       |                       ^~~~

- Merely click on all the error messages displayed and cut and paste the updated method signature. 

**Hint**: When you hold down the Ctrl (or Command) key and click on the source code line displayed VSC will take you directly to the line of code that needs to be updated.

- Hence: 

         virtual void exec(
            const sample::Cmd& cmd)
            const override
         {

- Becomes:

         virtual void prove_MySQL_is_working()
            const override

- The same holds true for the method declaration in the **mold** as well:

       error: ‘exec’ is not a member of ‘std::remove_reference<x4::sample::Blueprint&>::type’ {aka ‘x4::sample::Blueprint’}
       75 |    When(Method(dock, exec)).AlwaysDo([&_history]

- Hold down Ctrl (or Command) and click on the source code line and make this change:

       When(Method(dock, prove_MySQL_is_working))
       .AlwaysDo([&_history]
       () {

- Do the same for the method verification:

       Verify(Method(dock, exec));

- Becomes:

       Verify(Method(dock, prove_MySQL_is_working));

- Now try to build run the test cases again:

       it_test.sh

- Oops!

       error: ‘struct x4::sample::Blueprint’ has no member named ‘exec’
       71 |          i.exec("");

- Did we run into (yet another) compilation issue? 

- This is one of the greatest benefits to using interfaces, you are now using the C++ `gcc` compiler to do all the dirty work for you. That is, catch what used to be a major issue with modifying working code in the early days of C/C++ development, (aka. catching typos that were famous for memory leaks and unexpected core dumps). 

- Hold down Ctrl (or Command) and click on the source code line and make this change:

         i.exec("");

- To:

         i.prove_MySQL_is_working();

- Not only did we make the method more meaningful (to it's actual purpose) but we removed an unnecessary parameters, (hence the interface now has this issue resolved and won't find it's way into production code).

       it_test.sh

- Just when you thought we were out of the woods but that the `sample_console` did also notify us that the method signature needs to be updated:

       try {
              sample::Instance dock;
              dock.exec("ls ~");
              return 0;
       }
       resolve_all_injections() {
              echo(ex);
       }

- Becomes:

       try {
              sample::Instance dock;
              dock.prove_MySQL_is_working();
              return 0;
       }
       resolve_all_injections() {
              echo(ex);
       }

- Since we just happen to have create a Linux console instance of our method why not give it a whirl:

       it_test.sh

- Now run `sample_console`:

       sample_console

- Here is our output:

       ~/dev/x4$ sample_console
              ... MySQL replies: Hello World!
              ... MySQL says it again: Hello World!

- You may be wondering why the command did not require:

       build/sample_console

- That's because the current CMakeLists.txt is wired to automatically copy all successfully built binaries to the `~/.local/bin` folder:

       nterface_tools.sh 

- Now that we have successfuly docked our molded interface into a C++ class let's commit it to the Github repository:

       upgrades_menu 4
       tagit.sh

- The number `tagit.sh` will display would be:

       v0.2.2

- So commit it:

       tagit.sh v0.2.3  

- Now everything is committed to your Github repo. 

See *Next Steps* below ... 


### Alternate Case 
#### Debug the program with VSC? 
To debug this program with VSC:
- Open the VSC editor to `interfaces/mold_interface.cpp`
- Place the cursor on line 85:

        85 |     driver = get_driver_instance();

- To the left of `85` **click** on the margin area to set a breakpoint (you would see a red dot appear). Click a couple of times to toggle the breakpoint but make sure the red dot is there for the purposes of this test. 
- Make sure the `GDB Debugger - Beyond` extension has been added (click on the 5th largest icon from the top left menu and type `Beyond` in the search box. In the case were you see a small blue box with the word `Install` next to it, click on that blue box)
- Now start the program (in debug mode) using the top menu: Go `Run-> Start Debugging`.
- The program would run and land on the breakpoint.
- A little box will appear on the screen resembling a `remote control`. 
- Click on the 2nd button (the step-over) button to see the VSC editor update the display.
- To the left of the source code you will see the VARIABLES update with each step-over operation.
- In the `TERMINAL` window you would see text output from the C++ program.
- Press the green arrow button to let the program complete it's run. 
- To the top left you would see another small green arrow that you can press to restart the test.
- Play with the controls that you see to become familair with the VSC debugging environment.

**Note**: Depending on whether `dock_instance.cpp` has been renamed `dock_instance.cxx` or not affects how the debugger will operate during a debugging session with VSC. As both the `mold_interface.cpp` and the `dock_instance.cpp` use the exact same `test_interface.cpp` to conduct the same tests (but different origins). Hence, getting a new interface method working before testing it with the dock will reduce any confusion you might want to avoid, (when in doubt check the call stack window).

### Alternate Case 
#### Is this a true MySQL test?
True, we didn't actually insert any data of our own into the MySQL database. However, this is actually a standard test performed on new MySQL installations to prove functionality. 
- see [Kirt Undercoffer's Tech Notes Blog ](https://kirtu.wordpress.com/2013/01/27/hello-world-in-mysql-theres-more-than-one-way/) 
- Feel free to create SQL INSERT statements to that effect (as an exercise).
- Further, (as an exercise) add new methods to `sample::Blueprint` one for each type of SQL operation. Get them working in the mold first, the refined the test() cases for it. Then add the new methods to the C++ class. Then take a shot at testing these methods as part of the `sample_console` app complete with parameter passing. 
- Remember, whatever you do we never was that `word` any where in the code.
- *aka* It is not a matter of ... it is a matter of `when`
- Happy coding with `injections.io(C++17)`

### Alternate Case 
> **You need something more advanced?** </br>
> - [How To Install MySQL on Ubuntu 20.04 (digitalocean)](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)
>  - [Install and configure a MySQL server (ubuntu.com)](https://ubuntu.com/server/docs/databases-mysql)

### Summary 
You have just accessed a mysql database from C++ and a record was retrieved.

### Next Steps
 - [How to add a 3rd party static library using CPM/CMakeLists.txt syntax](https://github.com/perriera/for_interfaces/blob/main/injections/how-to/add-a-3rd-party/static-library/README.md)

### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
