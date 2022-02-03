add_library(printv1 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/src/print.cpp)
target_include_directories(printv1 PUBLIC
$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)
set_target_properties(printv1 PROPERTIES
    VERSION
    1.0.0
    SOVERSION 1
)