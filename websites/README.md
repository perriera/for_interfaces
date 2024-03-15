## use case (purpose)
> *Given* the need to setup a https server quickly and easily *when* we outline the steps necessary to do so here *then* we save a lot of time doing so in the future by having all the instructions, (for a particular versions of Ubuntu and Apache2) here and now.

### prerequisites
> - Ubuntu 20.04 box (or better)
> - sudo rights
> - good internet
> - ssh access (local ssh public key already added to remote /root/.ssh/authorized_keys)
> - the ability to backup/restore easily
> - the domain name setup with the ip address
> - the domain name www alias pointing towards the cname

### wish case
note: substitute 'bigblueai.com' for the domain name to be mounted in the instructions below:

a. before proceeding further make sure the domain name is resolved to the ip address of the linux box
```
ping bigblueai.com
```
b. add your local ssh key to the root authorized_keys file, (assuming you have one, in the case where you do not have a local ssh key see alternate case below)
```
cat ~/.ssh/id_ed25519.pub 
```
c. get into the root of the remote ubuntu box 
```
ls ~/.ssh/authorized_keys 
echo [whatever was displayed as the ssh key] >> ~/.ssh/authorized_keys 
exit
```
1. create dev user and re-ssh into the Ubuntu box (as dev)
```
ssh root@bigblueai.com
```
```
adduser dev
```
2. supply a password (no need for other details)
```
adduser dev sudo
cp -r .ssh /home/dev 
chown -R dev:dev /home/dev 
exit
```
```
ssh dev@bigblueai.com
```
3. once back inside ubuntu (as dev) apply the latest upgrades
```
sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove
sudo reboot
``` 
4. relog back into the ubuntu box (after a minute or two)
```
ssh dev@bigblueai.com
```
5. At this stage you can now install apache2
```
sudo apt install -y apache2
```
6. now make sure the ubuntu firewall is installed, active and allowing https and ssh access (answer 'y')
```
sudo ufw app list
sudo ufw allow 'Apache'
sudo ufw allow OpenSSH
sudo ufw allow https
sudo ufw status
sudo ufw enable
```
7. at this point the apache2 webserver diagnostic page for your ip address would be visable to the Internet, (in the case where it is not retrace your steps or refresh your browser)
```
firefox bigblueai.com
```
7b. in the case where 'Unable to connect' shows up check to see that there is no 'https' preceding the url, (as the browser has your previous exercise in it's cache). in such a case test it with the ip address, (or use curl) for example:
```
firefox 143.110.147.169
curl bigblueai.com
```
8. now add an apache2 profile for the domain name
```
sudo vi /etc/apache2/sites-available/bigblueai.com.conf
```
9. add the following contents
```
<VirtualHost *:80>
    ServerAdmin admin@bigblueai.com
    ServerName bigblueai.com
     <Directory /var/www/bigblueai.com/public_html>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
     </Directory>
    ServerAlias www.bigblueai.com 
    DocumentRoot /var/www/bigblueai.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
10. now put a basic web page in that folder
```
sudo mkdir -p /var/www/bigblueai.com/public_html
sudo vi /var/www/bigblueai.com/public_html/index.html 
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
sudo a2ensite bigblueai.com.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
```
13. check the Internet again to see the new web page
```
firefox bigblueai.com
```
14. now we need to add https and certbot support
```
sudo apt install certbot python3-certbot-apache -y
```
15. double check the ip address of your server
```
hostname -I
curl -4 icanhazip.com
```
16. compare the ip addresses listed with the content that comes back for bigblueai.com
```
curl bigblueai.com
```
17. now edit this to the apache2.conf file
```
sudo vi /etc/apache2/apache2.conf
```
18. add this to the end of apache2.conf 
```
# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
ServerName 127.0.0.1
```
19. now reload apache2 (you should see a 'Syntax Ok' message and nothing else)
```
sudo systemctl reload apache2
sudo apache2ctl configtest
```
19. now make certbot do it's thing (supply an email that can be used in the event of an admin issue).  when asked to specify two domain names do it like this '1 2' (or whatever numbers are listed)
```
sudo certbot --apache
```
20. check the Internet again to see the new web page (using https)
```
firefox bigblueai.com
```
### alternate case
> need a local ssh key 
```
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub
```
### alternate case
> it is possible to repeat the above steps for additional websites (all from the same ubuntu machine and ip address) as apache2 has been specializing in this type of service for many years (using common sense just add website profiles and folders using the example above)
### alternate case
> WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
```
ssh-keygen -f "/home/perry/.ssh/known_hosts" -R "bigblueai.com"
```
### summary
at this point you might want to backup the website. once backed up you might want to consider removing OpenSSH access from ufw (for production related sites) *but only in the case where you do not have to access the site again in the future*
### next steps
> - backup the entire website
> - add actual HTML/CSS content (generated from your web site project)
> - apache2 will look for an index.html file (unless otherwise directed)
> - increase security by removing OpenSSH access with ufw

### beware: #1 ROOKIE MISTAKE 
> - never symbolic link apache the /var/www *public_html* into the your user folder (and adjust permissions)
> - just duplicate all HTML/CSS/JS content into the designated /var/www folder (and chown to root:root)
### best way to upload new content
> - let's assume you have new content to be placed onto the apache server in a folder call ~/myproject/website/content
> - do something like this to update your content
```
sudo rm -rf /var/www/bigblueai.com/public_html.bak
sudo mv /var/www/bigblueai.com/public_html /var/www/bigblueai.com/public_html.bak
sudo cp -r ~/myproject/website/content /var/www/bigblueai.com/public_html
sudo chown -R root:root /var/www/bigblueai.com/public_html
sudo systemctl reload apache2
sudo apache2ctl configtest
```

