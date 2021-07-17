add_library(print STATIC ${CMAKE_CURRENT_SOURCE_DIR}/src/print.cpp)
target_include_directories(print PUBLIC
$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)