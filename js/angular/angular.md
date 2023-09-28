
## How to create an Angular app on Ubuntu 22.x

>
|use case (purpose)|  
|--|
|**given** we need to be able to create Angular apps
|**when** we install Angular tools (@angular/cli) using npm  
|**then** we will be able to create Angular apps

### Prerequisites 
1. Ubuntu installed
2. Access to the Internet
4. node installed
5. npm installed

### Wish Case
	npm install -g @angular/cli@14.2.1
	source ~/.bashrc
	ng new my-first-angular-app --no-strict --routing --style=css
	cd my-first-angular-app/
	ng serve --open
	
**Alternate Case**
Removing Angular

	npm remove -g @angular/cli
	source ~/.bashrc

**Alternate Case**
Use latest version

	npm uninstall -g @angular/cli
	npm cache clean --force
	npm install -g @angular/cli
	source ~/.bashrc
	
**Alternate Case**
Use specific version

	npm uninstall -g @angular/cli
	npm cache clean --force
	npm install -g @angular/cli@_choose_your_version
	source ~/.bashrc
	
**Summary**
This guide assumes that you have npm installed