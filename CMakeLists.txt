cmake_minimum_required(VERSION 3.20)
project(DynamicPolygon)

set(LUA_INCLUDE_DIR "vendor/lua/include" CACHE PATH "lua 5.1.4 include dir")
set(LUA_LIB_DIR "vendor/lua" CACHE PATH "lua 5.1.4 dll dir")

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "../aviutl" CACHE PATH "..." FORCE)
endif()

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(DLL_NAME KaroterraDynamicPolygon)

add_library(${DLL_NAME} SHARED
    src/main.cpp
    src/resource.h
    src/DynamicPolygon.rc
)
target_include_directories(${DLL_NAME} PRIVATE ${LUA_INCLUDE_DIR})
target_link_directories(${DLL_NAME} PRIVATE ${LUA_LIB_DIR})
target_link_libraries(${DLL_NAME} PRIVATE lua51)

install(TARGETS ${DLL_NAME}
    RUNTIME DESTINATION script
)
install(FILES
    "script/@動く多角形.anm"
    "script/動く多角形ベース.obj"
    DESTINATION script
)
