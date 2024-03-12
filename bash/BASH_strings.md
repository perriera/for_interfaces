### bash string management
>- [In Bash, how can I check if a string begins with some value?](https://stackoverflow.com/questions/2172352/in-bash-how-can-i-check-if-a-string-begins-with-some-value)

I always try to stick with POSIX sh instead of using Bash extensions, since one of the major points of scripting is portability (besides connecting programs, not replacing them). In sh, there is an easy way to check for an "is-prefix" condition. -- https://stackoverflow.com/users/1073695/jo-so

```

case $HOST in node*
    # Your code here
esac

```

basename
```
$(basename $0)
```

compare strings
```
if [[ "$1" == "$2" ]]
  then
    echo -e "${ANSI_RED}Cannot copy a folder onto itself${ANSI_ENDCOLOR}"
    echo -e "${ANSI_BLUE}Syntax: $(basename $0) existing_interface new_interface${ANSI_ENDCOLOR}"
    exit
fi
```

### is a directory
```
if [ -d /path/to/directory ]; then
  echo "Directory exists."
fi

```

### is not a file
```
if ! [ -f /path/to/file ]; then
  echo "File does not exist."
fi
```

### bash string loops
```
for databaseName in a b c d e f; do
  # do something like: echo $databaseName
done 
```
or
```
## declare an array variable
declare -a arr=("element1" "element2" "element3")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also
```
