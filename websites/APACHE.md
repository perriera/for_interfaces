### best links
- [How To Install the Apache Web Server on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-22-04)
- [How To Set Up Apache Virtual Hosts](https://www.digitalocean.com/community/tutorial_collections/how-to-set-up-apache-virtual-hosts)
- [How To Set Up Nginx Server Blocks (Virtual Hosts) on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)
- [How do I install an SSL Certificate on a Droplet?](https://docs.digitalocean.com/support/how-do-i-install-an-ssl-certificate-on-a-droplet/)
- [Initial Server Setup with Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04)
- [How To Install the Apache Web Server on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-20-04)
- [Apache Configuration Error AH00558: Could not reliably determine the server's fully qualified domain name](https://www.digitalocean.com/community/tutorials/apache-configuration-error-ah00558-could-not-reliably-determine-the-server-s-fully-qualified-domain-name)
- [Let’s Encrypt - Getting Started](https://letsencrypt.org/getting-started/)
- [How To Secure Apache with Let's Encrypt on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-20-04)
- [How to convert a simple HTML template into Angular Project](https://fahmidasclassroom.com/how-to-convert-a-simple-html-template-into-angular-project/)

### SUBDOMAINS
- [How to set up a subdomain on the same Apache web server as the main domain on Debian](https://msmtech.ca/en/blogs/technology-guides/how-to-set-up-a-subdomain-on-the-same-apache-web-server-as-the-main-domain)
- [Understand DNS Propagation & Why it Takes so Long](https://www.siteground.co.uk/kb/dns-propagation/#:~:text=Typically%2C%20DNS%20propagation%20takes%2024,may%20cause%20DNS%20propagation%20delays.)

<VirtualHost *:80> 
    ServerName staging.busfind.ca 
    ServerAdmin webmaster@localhost 
    DocumentRoot /var/www/busfind.ca/staging/  
    ErrorLog /var/log/apache2/staging/error.log 
    CustomLog /var/log/apache2/staging/access.log combined 
</VirtualHost>  
<Directory /var/www/busfind.ca/staging/> 
    Require all granted 
</Directory>

```
sudo vi /etc/apache2/sites-available/staging.conf
sudo a2ensite staging.conf 
sudo mkdir /var/log/apache2/staging
sudo service apache2 restart
ping staging.busfind.ca
sudo certbot -d busfind.ca,staging.busfind.ca --expand
```
