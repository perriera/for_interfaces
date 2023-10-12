###  how to zip in place 
> for the longest time it has been an issue with how Webflow zips files and how the file explorer window zips files such that there would always be an extra 'repeated' name-of-the-project folder to have to contend with. To resolve this issue you need to compress and uncompress using the following parameters
#### inside the folder with everything you want zipped
```
zip -r my-first-app.webflow.zip . 
```
#### then in another folder do this 
```
unzip my-first-app.webflow.zip -d .
```
> now when you zip and unzip there is no repeative folder name getting in the way

