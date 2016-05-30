find_path(Qt5WebKit_INCLUDE_DIR
    NAMES QtWebKit/QtWebKit
    HINTS ${Qt5WebKit_INCLUDEDIR}
          ${Qt5WebKit_INCLUDE_DIRS}
)

find_library(Qt5WebKit_LIBRARIES
    NAMES Qt5WebKit
    HINTS ${Qt5WebKit_LIBDIR}
          ${Qt5WebKit_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Qt5WebKit REQUIRED_VARS Qt5WebKit_INCLUDE_DIR Qt5WebKit_LIBRARIES)
