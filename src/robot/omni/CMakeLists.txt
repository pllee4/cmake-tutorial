add_library(robot STATIC ${CMAKE_CURRENT_SOURCE_DIR}/src/omni.cpp)
target_include_directories(robot PUBLIC
$<BUILD_INTERFACE:${ROBOT_INTERFACE}>)