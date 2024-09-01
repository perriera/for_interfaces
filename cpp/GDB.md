### gdb
-[Compile from Source - Build Latest GDB and Binutils on Linux](https://www.youtube.com/watch?v=QFFU1Y8tRV4)
[gdb gnu source](https://sourceware.org/pub/gdb/releases/?C=M;O=D)
- [Building GCC from source](https://medium.com/@darrenjs/building-gcc-from-source-dcc368a3bb70)
- [Installing GCC](https://gcc.gnu.org/wiki/InstallingGCC)
- [Building GDB from source](https://gist.github.com/richyliu/e9ec03f455bee86dc407b7e051245c0e)
### gmp is missing while configuring building gdb from source
- [gmp is missing while configuring building gdb from source](https://stackoverflow.com/questions/70380547/gmp-is-missing-while-configuring-building-gdb-from-source)
```
mkdir build
cd build
mkdir t1
cd t1
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libgmp-dev
wget http://ftp.gnu.org/gnu/gdb/gdb-15.2.tar.gz
tar -xvzf gdb-15.1.tar.gz
./configure
make
sudo make install
```