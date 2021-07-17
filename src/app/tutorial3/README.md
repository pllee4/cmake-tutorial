# Tutorial3

## Let's start to create library target

- Make sure you are at correct directory under src/app/tutorial3

```
$ ls
```

- You should be able to see
  
```
CMakeLists.txt README.md tutorial3.cpp
```

## Create library target

- First, we create an object file for print
  
```
g++ -c ../../lib/print/src/print.cpp -I ../../lib/print/include/
```

- You should be able to see print.o is created
- Now, we create a library target from the file

```
$ ar rvs libprint.a print.o
```

- You should be able to see libprint.a is created
  
## Create Object file

- Since tutorial3.cpp include directory where print.hpp is located, we have to include the directory as usual but this time we do not compile for print.cpp together

```
g++ -c ./tutorial3.cpp -I ../../lib/print/include/
```
## Run the program with g++

```
g++ -o <target name> <file name>
```

```
$ g++ -o tutorial3 ./tutorial3.o ./libprint.a
$ ./tutorial3
```

- You should be able to see

```
I am tutorial 3
```

## With CMake

- For this tutorial, we will have to go back to project source directory
- Make sure you are at the top level directory under this repo

```
$ ls
```

- You should be able to see

```
CMakeLists.txt README.md src
```

```
$ mkdir build
$ cd build
$ cmake ..
$ make -j
$ ./bin/tutorial3
```

- Now you can see all the executable from tutorial1 to tutorial3 under build/bin
  
## Behind CMake

- After you have run with CMake, you can check the last command behind the scene at build/src/app/tutorial3/CMakeFiles/tutorial3.dir/link.txt

- You would find it familiar

```
/usr/bin/c++ CMakeFiles/tutorial3.dir/tutorial3.cpp.o -o ../../../bin/tutorial3  ../../../lib/libprint.a 
```