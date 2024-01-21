### bash string management
>- [In Bash, how can I check if a string begins with some value?](https://stackoverflow.com/questions/2172352/in-bash-how-can-i-check-if-a-string-begins-with-some-value)

I always try to stick with POSIX sh instead of using Bash extensions, since one of the major points of scripting is portability (besides connecting programs, not replacing them). In sh, there is an easy way to check for an "is-prefix" condition. -- https://stackoverflow.com/users/1073695/jo-so

```

case $HOST in node*
    # Your code here
esac

```

