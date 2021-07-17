# Tutorial1

## Let's start with Basic

- Make sure you are at correct directory under src/app/tutorial1

```
$ ls 
```

- You should be able to see

```
CMakeLists.txt README.md tutorial1.c
```

## Run the program with g++

```
g++ -o <target name> <file name>
```
  
```
$ g++ -o tutorial1 ./tutorial.c
$ ./tutorial1
```

- You should be able to see

```
I am tutorial 1
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