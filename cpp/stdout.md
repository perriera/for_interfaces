[read stdout of a process in itself using c++](https://stackoverflow.com/questions/49674516/read-stdout-of-a-process-in-itself-using-c)
> This isn't hard to do, but IMO it's quite a hack, and it won't work with a multithreaded program:
```
// make a temp file to store the function's stdout
int newStdOut = mkstemp( "/tmp/stdout.XXXXXXX" );

// save the original stdout
int tmpStdOut = dup( STDOUT_FILENO );

// clear stdout
fflush( stdout );

// now point the stdout file descriptor to the file
dup2( newStdOut, STDOUT_FILENO );

// call the function we want to collect the stdout from
some_function();

// make sure stdout is empty
fflush( stdout );

// restore original stdout
dup2( tmpStdOut, STDOUT_FILENO );

// the tmp file now contains whatever some_function() wrote to stdout
```
> Error checking, proper headers, syncing C stdout with C++ cout, and reading from and cleaning up the temp file are left as exercises... ;-) Note that you can't safely use a pipe - the function can write enough to fill up the pipe, and you can't read from the pipe because you've called the function.