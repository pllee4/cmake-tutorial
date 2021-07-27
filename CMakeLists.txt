# set minimum version required for cmake
cmake_minimum_required(VERSION 3.13.1)

# set the project name and version
project(cmake_tutorial LANGUAGES C CXX VERSION 1.0.0)

## project options
option(BUILD_TESTING "Build tests" OFF)

if(BUILD_TESTING)
    message(STATUS "Build test")
else()
    message(STATUS "Tests will not be built")
endif()

## select robot
if(NOT DEFINED ROBOT)
    set(ROBOT "differential")
endif()

message(STATUS "Selected robot: " ${ROBOT})

## Put all binary files into /bin
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}/bin)

## Put all libraries into /lib
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)

## find package
find_package(Python3 REQUIRED)

## although there is no OpenCV package installed, it will not have error
find_package(OpenCV QUIET)

## get filename component
get_filename_component(TUTORIAL1_PATH src/app/tutorial1 REALPATH)
message(STATUS "Tutorial1 path: " ${TUTORIAL1_PATH})

## include example target
include(${PROJECT_SOURCE_DIR}/cmake/MakeCalendar.cmake)

## add source file
add_subdirectory(src)

## install package
install(TARGETS tutorial1 tutorial2 tutorial3 DESTINATION bin)

# Packaging support
set(CPACK_PACKAGE_VENDOR "Pin Loon")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CMake tutorial")
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/cmake_tutorial")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")
set(CPACK_GENERATOR "DEB")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "PinLoon Lee (pinloon_0428@hotmail.com)") 
include(CPack)