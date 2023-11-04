### [fatal error: bits/signum.h: No such file or directory](https://github.com/Zilliqa/Zilliqa/issues/2752) 
```
quintus_tcp.c:30:10: fatal error: bits/signum.h: No such file or directory
   30 | #include <bits/signum.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.

```
### [CODE BROWSER](https://codebrowser.dev/gcc/include/x86_64-linux-gnu/bits/signum.h.html)
#ifndef _SIGNAL_H
#error "Never include <bits/signum.h> directly; use <signal.h> instead."
#endif


