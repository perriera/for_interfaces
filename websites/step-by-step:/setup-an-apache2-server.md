## use case (purpose)
> *Given* the need to setup a https server quickly and easily *when* we outline the steps necessary to do so here *then* we save a lot of time doing so in the future by having all the instructions, (for a particular versions of Ubuntu and Apache2) here and now.

### prerequisites
> - Ubuntu 20.04 box (or better)
> - sudo rights
> - good internet
> - ssh access (when remote)
> - the ability to backup/restore easily
> - the domain name setup with the ip address
> - the domain name www alias pointing towards the cname

### wish case
1. create dev user and re-ssh into the Ubuntu box (as dev)
```
ssh root@thewebsite.com
adduser dev
```
2. supply a password (no need for other details)
```
adduser dev sudo
cp -r .ssh /home/dev 
chown -R dev:dev /home/dev 
exit
ssh dev@thewebsite.com
```
3. once back inside ubuntu (as dev) apply the latest upgrades
```
sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove
sudo reboot
``` 
4. before proceeding further make sure the domain name is resolved to the ip address of the linux box
```
ping thewebsite.com
```
5. At this stage you can now install apache2
```
sudo apt install -y apache2
```
6. now make sure the ubuntu firewall is install, active and allowing https and ssh access
```
sudo ufw app list
sudo ufw allow 'Apache'
sudo ufw status
sudo ufw enable
sudo ufw allow OpenSSH
sudo ufw allow https
```
7. at this point the apache2 webserver diagnostic page for your ip address would be visable to the Internet, (in the case where it is not retrace your steps)
```
firefox thewebsite.com
```
8. now add an apache2 profile for the domain name
```
sudo vi /etc/apache2/sites-available/thewebsite.com.conf
```
9. add the following contents
```
<VirtualHost *:80>
    ServerAdmin admin@thewebsite.com
    ServerName thewebsite.com
     <Directory /var/www/thewebsite.com/public_html>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
     </Directory>

    ServerAlias www.thewebsite.com 
    DocumentRoot /var/www/thewebsite.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
10. now put a basic web page in that folder
```
sudo vi /var/www/thewebsite.com/public_html/index.html 
```
11. add the following content
```
<html>
    <head>
        <title>Welcome to Your_domain!</title>
    </head>
    <body>
        <h1>Success!  The your_domain virtual host is working!</h1>
    </body>
</html>
```
12. now activate the new server profile and restart apache2
```
sudo a2ensite thewebsite.com.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
```
13. check the Internet again to see the new web page
```
firefox thewebsite.com
```
14. now we need to add https support
```
```
### next steps
> - [UFW Essentials: Common Firewall Rules and Commands](https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands)