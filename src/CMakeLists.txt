find_package(Qt5WebKit REQUIRED)
find_package(Qt5WebKitWidgets REQUIRED)

find_package(Qt5Core 5.2 REQUIRED)
find_package(Qt5Gui 5.2 REQUIRED)
find_package(Qt5Network 5.2 REQUIRED)
find_package(Qt5Sql 5.2 REQUIRED)
find_package(Qt5Widgets 5.2 REQUIRED)
find_package(Qt5PrintSupport 5.2 REQUIRED)

if (WIN32)
    add_definitions(-DQCOMMANDLINE_STATIC -D_CRT_SECURE_NO_WARNINGS -D_WIN32 -DUNICODE -DNDEBUG)
endif ()

set(PhantomJS_SOURCES
    callback.cpp
    childprocess.cpp
    config.cpp
    cookiejar.cpp
    crashdump.cpp
    encoding.cpp
    env.cpp
    filesystem.cpp
    main.cpp
    networkaccessmanager.cpp
    phantom.cpp
    repl.cpp
    system.cpp
    terminal.cpp
    utils.cpp
    webpage.cpp
    webserver.cpp
    # TODO: Move to separate projects
    qcommandline/qcommandline.cpp
    linenoise/src/linenoise.c
    mongoose/mongoose.c
)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)

qt5_add_resources(PhantomJS_SOURCES phantomjs.qrc)

include_directories(
    mongoose
    linenoise/src
    qcommandline
    ${Qt5Gui_INCLUDE_DIRS}
    ${Qt5Network_INCLUDE_DIRS}
    ${Qt5WebKit_INCLUDE_DIR}
    ${Qt5WebKitWidgets_INCLUDE_DIR}
    ${Qt5Widgets_INCLUDE_DIRS}
)

set(PhantomJS_LIRARIES
    ${Qt5Core_LIBRARIES}
    ${Qt5Gui_LIBRARIES}
    ${Qt5Network_LIBRARIES}
    ${Qt5WebKit_LIBRARIES}
    ${Qt5WebKitWidgets_LIBRARIES}
    ${Qt5Widgets_LIBRARIES}
    ${Qt5PrintSupport_LIBRARIES}
)

if (WIN32)
    list(APPEND PhantomJS_LIRARIES
        Ws2_32
    )
endif ()

add_executable(phantomjs ${PhantomJS_SOURCES})
qt5_use_modules(phantomjs Core Gui Network Widgets)
target_link_libraries(phantomjs ${PhantomJS_LIRARIES})
