## How to install `mysql` 3rd party api support (using `CPM/CMakeLists.txt` syntax)
> **Given** we need to access a MySQL database from C++ (Ubuntu style) **when** we install `MySQL Connector/C++`  **then** we can manage data in a MySQL database using our `injections.io(injections_cpp)` C++ program

### Prerequisites
  - [How to install MySQL onto Ubuntu](https://github.com/perriera/for_interfaces/blob/main/db/mysql/README.md)
 
 
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

  - Now make sure the test cases run successfully:

              it_test.sh

#### Add MySQL Connector/C++
 - To add `MySQL Connector/C++` support

		sudo apt-get install libmysqlcppconn-dev -y

 - Now check out the standard include directory

		ls /usr/include/cppconn/

 - Now check out mysql C++ extensions went

		find /usr -name mysql
		
 - You should see something like
		
		/usr/lib/mysql
		/usr/share/bash-completion/completions/mysql
		/usr/share/mysql
		/usr/bin/mysql

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


#### Test MySQL Connector/C++ support 

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

 - To double check that the database contains the correct data:

		mysql -u sammy -p 
		create database test;
		exit

 - [ ] By default, a table called _message will be created and it will have a single record containing the words "Hello, world". To verify this while inside mysql do this:

		mysql> SELECT 'Hello World!' AS _message

 - [ ] You have just accessed MySQL data using the MySQL Linux utility (the same data that the `x4` `exec` method retrieved)

		exit

### Alternate Case 
#### Debug the program with VSC? 
To debug this program with VSC:
- Open the VSC editor to `interfaces/mold_interface.cpp`
- Place the cursor on line 79:

        85 |     driver = get_driver_instance();

- To the left of `85` **click** on the margin area to set a breakpoint (you would see a red dot appear). Click a couple of times to toggle the breakpoint but make sure the red dot is there for the purposes of this test. 
- Make sure the `GDB Debugger - Beyond` extension has been added (click on the 5th largest icon from the top left menu and type `Beyond` in the search box. In the case were you see a small blue box with the word `Install` next to it, click on that blue box)
- Now start the program (in debug mode) using the top menu: Go `Run-> Start Debugging`.
- The program would run and land on the breakpoint.
- A little box will appear on the screen remembling a remote control. 
- Click on the 2nd button (the step-over) button to see the VSC editor update the display.
- To the left of the source code you will see the VARIABLES update with each step-over operation.
- In the `TERMINAL` window you would see text output from the C++ program.
- Press the green arrow button to let the program complete it's run. 
- To the top left you would see another small green arrow that you can press to restart the test.
- Play with the controls that you see to become familair with the VSC debugging environment.

### Alternate Case 
#### You want to save the changes to `x4` to your Github project repository?
Logically, it would be good to keep these changes. To do so merely stop the debugger by pressing the red square (or let it complete by pressing the green arrow) then press enter (to see the Terminal prompt again) and type:

       upgrade_menu 4
       tagit.sh

Whatever number is displayed (in this case it will be v`v0.2.1`)
- Just bump the patch number:

       tagit.sh v0.2.2

Now your Github repo for `x4` is updated.

### Alternate Case 
> **You need something more advanced?** </br>
> - [How To Install MySQL on Ubuntu 20.04 (digitalocean)](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)
>  - [Install and configure a MySQL server (ubuntu.com)](https://ubuntu.com/server/docs/databases-mysql)

### Summary 
You have just accessed a mysql from C++ and a record was retrieved.

### Next Steps
 - [How to create a project using injections.io(injections_cpp)](https://github.com/perriera/injections_cpp)

### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
