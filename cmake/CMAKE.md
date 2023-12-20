
## cmake
`sudo snap install cmake`
> - [How do I install the latest version of cmake from the command line?](https://askubuntu.com/questions/355565/how-do-i-install-the-latest-version-of-cmake-from-the-command-line)
> - [How do you write a cmake.yml which allows you to review a file on GitHub?](https://stackoverflow.com/questions/70980759/how-do-you-write-a-cmake-yml-which-allows-you-to-review-a-file-on-github)
> - [How To Install clang-format on Ubuntu 18.04](https://installati.one/ubuntu/18.04/clang-format/)
>- [How to Install CMake on Ubuntu 20.04 LTS](https://vitux.com/how-to-install-cmake-on-ubuntu/)
>- [How to copy directory from source tree to binary tree?](https://stackoverflow.com/questions/697560/how-to-copy-directory-from-source-tree-to-binary-tree)
>- [Installing Files](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Install.html)

### bad executable
[bad cmake executable vscode](https://askubuntu.com/questions/1353824/bad-cmake-executable-vscode)
> in Preferences search 'cmake path'
```
/snap/cmake/current/bin/cmake
```

### [Executing bash commands from a CMake file](https://stackoverflow.com/questions/35072473/executing-bash-commands-from-a-cmake-file)
```
execute_process (
    COMMAND bash -c "date +'%F %T'"
    OUTPUT_VARIABLE outVar
)
file(WRITE "datestamp" "${outVar}")
```