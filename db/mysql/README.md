


## How to install `MySQL` onto Ubuntu
**Given** we need to use a `MySQL` database on a Ubuntu platform **when** we `apt install` the `MySQL` package from Ubuntu **then** we can create (and/or access) `MySQL` databases

### Prerequisites
 - [How to create a project using `injections.io(injections_cpp)`](https://github.com/perriera/injections_cpp)

 
### Wish Case
Setting up mysql software onto Ubuntu is not that difficult. However, there are a variety of options available for more advanced purposes. In our case we just want to use myself for database testing purposes. So, we'll will stick witht the most basic instructions here.

  - [ ] First go into sudo mode

		sudo ls

  - [ ] Then update your Ubuntu
	
		sudo apt update -y
		sudo apt upgrade -y
	
 - [ ] Now add `mysql-server` to Ubuntu

		sudo apt install mysql-server -y 

 - [ ] Now start `myself-server` as a service

		sudo systemctl start mysql.service

 - [ ] Now open `mysql` as root 

		sudo mysql
		
 - [ ] Now add a database user to it:
		
		CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';

 - [ ] Now grant certain privileges to that user

		GRANT CREATE, ALTER, DROP, INSERT, UPDATE, 
		DELETE, SELECT, REFERENCES, RELOAD on *.* TO 
		'sammy'@'localhost' WITH GRANT OPTION;
		FLUSH PRIVILEGES;
		exit

 - [ ] Now exit mysql as root and relog as a `non-root` user:

		mysql -u sammy -p

	When asked for a password: `password`

 - [ ] Enter the password (as 'password' in this case) and you should see the mysql prompt

		Welcome to the MySQL monitor.  Commands end with ; or \g.
		Your MySQL connection id is 17
		Server version: 8.0.29-0ubuntu0.20.04.3 (Ubuntu)

		Copyright (c) 2000, 2022, Oracle and/or its affiliates.

		Oracle is a registered trademark of Oracle Corporation and/or its
		affiliates. Other names may be trademarks of their respective
		owners.

		Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

		mysql> 

 - [ ] Now as a `non-root` user create a 'test' database:

		create database test;
		
 - [ ] You have just installed mysql and setup a user account successfully

		exit
	
    See *Resume/Next* steps below ...

### Alternate Case 
> **You need something more advanced?** </br>
>	Check out this external how-to from which this page derived for more info on the more refined aspects of setting up mysql (on Ubuntu):
[How To Install MySQL on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)

### Summary 
Now you have accomplished the following:
- Installed the `MySQL` (as a service) on Ubuntu
- Added a non-root user
- Gave that user the ability to create databases
- Created a database called `test` 

### Next Steps
 - [How to install `MySQL Connector/C++` API support (using CPM/CMakeLists.txt syntax)](https://github.com/perriera/for_interfaces/blob/main/db/mysql/CPP.md)


### Disclaimer
> That `word` is not to appear anywhere on this page, ([except here](https://en.wikipedia.org/wiki/Knights_Who_Say_%22Ni!%22))
