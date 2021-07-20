add_library(robot STATIC ${CMAKE_CURRENT_SOURCE_DIR}/src/differential.cpp)
target_include_directories(robot PUBLIC
$<BUILD_INTERFACE:${ROBOT_INTERFACE}>)