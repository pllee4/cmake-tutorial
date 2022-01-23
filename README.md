# cmake-tutorial

![master](https://github.com/pllee4/cmake-tutorial/actions/workflows/build_and_pack.yml/badge.svg)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=cmake-tutorial&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=cmake-tutorial)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=cmake-tutorial&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=cmake-tutorial)

## Build process in C/C++

![image](https://user-images.githubusercontent.com/42335542/126165099-c37f4bdd-91a2-4736-9a7a-fd1a19d82c5d.png)

## Dependencies

```
$ sudo apt install build-essential
```

## Get started

```
$ cd src/app
```

- Follow the README.md in each folder of tutorial starting from tutorial1 to tutorial3

## Using CMake

- Make sure you are at top level directory of this repo
  
```
$ ls
```

- You should be able to see

```
cmake CMakeLists.txt docs README.md src
```

- Now run the following command:
  
```
$ mkdir build
$ cd build
$ cmake ..
$ cmake --build .
```

- You should be able to see all the program under build/bin directory

- To pack the program, currently applicable under cmake version greater than 3.11 in this repo,
  go to build directory then

```
$ cpack
```

- You should see a .deb package with named cmake_tutorial_1.0.0_architecture for example
  cmake_tutorial_1.0.0_amd64.deb
```
$ sudo dpkg -i cmake_tutorial_1.0.0_amd64.deb
```

- The package in installed under /opt/cmake_tutorial

## References
- For detail information, kindly refer to [cmake guide](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)
- If you are interested in getting to know how compiler works, [this](https://www.youtube.com/watch?v=4V9QWHjRPMc) will give some insights.
