# set minimum version required for cmake
cmake_minimum_required(VERSION 3.10.2)

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

include(GNUInstallDirs)

# Relative path for shared libraries
file(RELATIVE_PATH relDir
  ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}
  ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR}
)
set(CMAKE_INSTALL_RPATH $ORIGIN $ORIGIN/${relDir})

## Put all binary files into /bin and libraries into /lib
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_BINDIR})

## check distro
execute_process(COMMAND lsb_release -cs
    OUTPUT_VARIABLE RELEASE_CODENAME
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
## find package
if (RELEASE_CODENAME STREQUAL "bionic")
  find_package(PythonLibs 3 REQUIRED)
elseif (RELEASE_CODENAME STREQUAL "focal")
  find_package(Python3 REQUIRED)
endif()

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
if (${CMAKE_VERSION} VERSION_GREATER_EQUAL 3.11)
  install(TARGETS tutorial1 tutorial2 tutorial3 tutorial4 printv1 
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
else()
  message(WARNING "No target would be installed, please consider update the cmake version")
endif()

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