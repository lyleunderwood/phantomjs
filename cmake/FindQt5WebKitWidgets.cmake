find_path(Qt5WebKitWidgets_INCLUDE_DIR
    NAMES QtWebKitWidgets/QtWebKitWidgets
    HINTS ${Qt5WebKitWidgets_INCLUDEDIR}
          ${Qt5WebKitWidgets_INCLUDE_DIRS}
)

find_library(Qt5WebKitWidgets_LIBRARIES
    NAMES Qt5WebKitWidgets
    HINTS ${Qt5WebKitWidgets_LIBDIR}
          ${Qt5WebKitWidgets_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Qt5WebKitWidgets REQUIRED_VARS Qt5WebKitWidgets_INCLUDE_DIR Qt5WebKitWidgets_LIBRARIES)
