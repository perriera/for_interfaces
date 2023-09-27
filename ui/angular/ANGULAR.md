### [Install AngularJS in Ubuntu 22.04 | 20.04 Linux](https://linux.how2shout.com/install-angularjs-in-ubuntu-22-04-20-04-linux/)
> What is AngularJS? 
>AngularJS is an open-source development framework project, built-in Javascript. It contains a set of useful libraries for developing web applications and proposing a set of design patterns to run them. In short, it is a so-called Javascript language-based framework for both frontend and backend web app development with client-side programming.
> Requirements:
> 1. Ubuntu other similar Linux
> 2. A non-root (sudo) user
> 3. Terminal access
> 4. Internet connection
```
sudo apt install curl -y
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install gcc g++ make
sudo apt install nodejs
sudo npm install npm@latest -g
npm -v
nodejs -v
sudo npm install -g @angular/cli
ng version
```
### Create your first Angular App on Ubuntu 22.04 | 20.04
```
ng new myapp
cd myapp
ng serve
```