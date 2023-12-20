
## How to create a Vue app on Ubuntu 22.x

>
|use case (purpose)|  
|--|
|**given** we need to be able to create Vue apps
|**when** we install Vue tools (@vue/cli) using npm  
|**then** we will be able to create Vue apps

### Prerequisites 
1. Ubuntu installed
2. Access to the Internet
4. node installed
5. npm installed

### Wish Case
	npm install -g @vue/cli
	npm install @vue/cli-service
	source ~/.bashrc
	vue create -d my-first-vue-app
	cd my-first-vue-app
	npx vue-cli-service serve --open
	
**Alternate Case**
Removing Vue

	npm remove @vue/cli-service
	npm remove -g @vue/cli
	source ~/.bashrc
	
**Summary**
This guide assumes that you have npm installed

**References**
[How to Install Vue.js on Ubuntu 22.04](https://tecadmin.net/how-to-install-angular-cli-on-ubuntu-22-04/)