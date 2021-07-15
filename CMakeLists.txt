# set minimum version required for cmake
cmake_minimum_required(VERSION 3.13.1)

# set the project name and version
project(cmake_template LANGUAGES C CXX VERSION 1.2.3)

## project options
option(BUILD_TESTING "Build tests" OFF)

if(BUILD_TESTING)
    message(STATUS "Build test")
endif()

if(NOT DEFINED ROBOT)
    set(ROBOT "differential")
endif()

add_subdirectory(src)