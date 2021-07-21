# Tutorial1

## Let's start with Basic

- Make sure you are at correct directory under src/app/tutorial1

```
$ ls 
```

- You should be able to see

```
CMakeLists.txt Makefile README.md tutorial1.c
```

## Run the program with g++

```
g++ -o <target name> <file name>
```
  
```
$ g++ -o tutorial1 ./tutorial1.c
$ ./tutorial1
```

- You should be able to see

```
I am tutorial 1
```

## With Makefile

- You can remove the executable above and try with Makefile, they are doing the same thing

```
$ make -j
```

## With CMake

- please ignore the warning for now
```
$ mkdir build
$ cd build
$ cmake ..
$ make -j
$ ./tutorial1
```