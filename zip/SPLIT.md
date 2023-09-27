[Split Command in Linux with Examples](https://www.geeksforgeeks.org/split-command-in-linux-with-examples/)

### split a 173mb file into 25 equal parts
```
split -n 25 ../oracle.19.16.client32.zip oracle.19.16.client32.
```
### reassemble a 173mb file from 25 sequential parts
```
cat oracle.19.16.client32.* > oracle.19.16.client32.zip
```
### unzip a 173mb file into it's folders
```
unzip oracle.19.16.client32.zip 
```
