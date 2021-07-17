add_executable(tutorial2 tutorial2.cpp ${CMAKE_CURRENT_SOURCE_DIR}/print/src/print.cpp)
target_include_directories(tutorial2 PUBLIC
$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/print/include>)