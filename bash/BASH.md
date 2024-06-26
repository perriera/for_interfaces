### bash 
> - [How to use exit codes in shell scripts](https://www.cyberciti.biz/faq/bash-get-exit-code-of-command/)
> - [](https://linuxize.com/post/how-to-check-if-string-contains-substring-in-bash/#:~:text=contains%20a%20substring.-,Using%20Wildcards,is%20contained%20in%20the%20string.) 
> - [3 Ways to Delete All Files in a Directory Except One or Few Files with Extensions](https://www.tecmint.com/delete-all-files-in-directory-except-one-few-file-extensions/)
> - [Delete All Files in a Directory Except Some](https://www.baeldung.com/linux/delete-all-exclude-some)
> - [Grep Exclude: How To Use -v To Exclude Words, Patterns, or Files in Grep](https://ioflood.com/blog/grep-exclude-how-to-use-v-to-exclude-words-patterns-or-files-in-grep/#:~:text=Excluding%20a%20pattern%20in%20grep,contain%20the%20pattern%20%27exclude_this%27.)
> - [How do I check if a directory exists or not in a Bash shell script?](https://stackoverflow.com/questions/59838/how-do-i-check-if-a-directory-exists-or-not-in-a-bash-shell-script)
> - [How do I redirect output to a variable in shell? [duplicate]](https://stackoverflow.com/questions/2559076/how-do-i-redirect-output-to-a-variable-in-shell)
> - [Get wget output to a variable]()
### how to get the name of the parent directory
```
parent_dir_name=$(basename $(dirname $PWD))
```
### how to get the name of the current directory
```
parent_dir_name=$(basename $PWD)
```
### Bash Array – How to Declare an Array of Strings in a Bash Script
> - [Bash Array – How to Declare an Array of Strings in a Bash Script](https://www.freecodecamp.org/news/bash-array-how-to-declare-an-array-of-strings-in-a-bash-script/)
> - [You don't know Bash: An introduction to Bash arrays](https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays)
> - [Redirecting command output to a variable in bash fails](https://stackoverflow.com/questions/10319745/redirecting-command-output-to-a-variable-in-bash-fails)
```
OUTPUT=$(sudo apache2ctl configtest)
echo $OUTPUT
```
```
OUTPUT="$(sudo apache2ctl configtest 2>&1)"
```
- [Return value in a Bash function](https://stackoverflow.com/questions/17336915/return-value-in-a-bash-function)
> - [Returning Values from Functions in Bash Shell Scripting](https://ioflood.com/blog/bash-function-return-value/)
> - [Get return value of exe in script [duplicate]](https://stackoverflow.com/questions/18182977/get-return-value-of-exe-in-script)
>- [Loop through an array of strings in Bash?](https://stackoverflow.com/questions/8880603/loop-through-an-array-of-strings-in-bash)
>- [How can I convert a string from uppercase to lowercase in Bash? [duplicate]](https://stackoverflow.com/questions/11392189/how-can-i-convert-a-string-from-uppercase-to-lowercase-in-bash)
>- [Replacing some characters in a string with another character](https://stackoverflow.com/questions/2871181/replacing-some-characters-in-a-string-with-another-character)
>- [Adding Counter in shell script](https://stackoverflow.com/questions/13638670/adding-counter-in-shell-script)
>- [How can I declare and use Boolean variables in a shell script?](https://stackoverflow.com/questions/2953646/how-can-i-declare-and-use-boolean-variables-in-a-shell-script)
>- [How to check if a file contains a specific string using Bash](https://stackoverflow.com/questions/11287861/how-to-check-if-a-file-contains-a-specific-string-using-bash)
>- [echo that outputs to stderr](https://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr)
>- [NPM stop?](https://discuss.codecademy.com/t/npm-stop/457155)
>- [Return value in a Bash function](https://stackoverflow.com/questions/17336915/return-value-in-a-bash-function)
```
function fun1(){
  echo 34
}

function fun2(){
  local res=$(fun1)
  echo $res
}
```
>- [How to read a file into a variable in shell?](https://stackoverflow.com/questions/7427262/how-to-read-a-file-into-a-variable-in-shell)
```
#!/bin/bash
value=$(<config.txt)
echo "$value"
```
```
#!/bin/sh
value=`cat config.txt`
echo "$value"
```

>- [How to Check if a File or Directory Exists in Bash](https://linuxize.com/post/bash-check-if-file-exists/)
```
FILE=/etc/resolv.conf
if [ -f "$FILE" ]; then
    echo "$FILE exists."
fi

```

>- [Can a string be returned from a Bash function without using echo or global variables?](https://stackoverflow.com/questions/14482943/can-a-string-be-returned-from-a-bash-function-without-using-echo-or-global-varia)
```
 foo() {
    local input="$1";
    # local output=$2;  # need to use $2 in scope...

    eval "${2}=\"Hello, ${input} World!\""
    return 
}


foo "Call by Output" output;

echo $output;
```
