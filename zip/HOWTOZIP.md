[How to Create a Password Protected ZIP File in Linux?](https://www.geeksforgeeks.org/how-to-create-a-password-protected-zip-file-in-linux/)
[How To Zip Folder on Linux](https://devconnected.com/how-to-zip-folder-on-linux/)
```
zip -re data.zip facts/
```

```
unzip data.zip 
```

#### more example
```
                // zip -r test/archive/001/web5.zip instances/webapp.dock/myweb5app/
                // zip -r test/archive/001/abc.zip instances/webapp.dock/myabcapp/ -x "instances/webapp.dock/myabcapp/.abc/*" "instances/webapp.dock/myabcapp/node_modules/*" 
                // zip -r test/archive/001/bc.zip instances/webapp.dock/mybcapp/
                // zip -r test/archive/001/rt.zip instances/webapp.dock/myrtapp/ -x "instances/webapp.dock/myrtapp/node_modules/*" 

                // unzip -o test/archive/001/abc.zip 
                // find instances/webapp.dock/myweb5app/ -type f | grep -v '.cache'
                // find instances/webapp.dock/myabcapp/ -type f | grep -v -e 'node_modules/' -e '.abc/cache' 
                // find instances/webapp.dock/mybcapp/ -type f 
                // find instances/webapp.dock/myrtapp/ -type f | grep -v 'node_modules'
```
