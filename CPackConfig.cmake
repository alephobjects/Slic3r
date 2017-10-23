set(CPACK_PACKAGE_VENDOR "Prusa3D")
set(CPACK_PACKAGE_CONTACT "Contact Name <contact@prusa3d.com>")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Slic3r is a slicer for 3D printers")
#set(CPACK_PACKAGE_VERSION_MAJOR 1)
#set(CPACK_PACKAGE_VERSION_MINOR 1)
#set(CPACK_PACKAGE_VERSION_PATCH 1)
if(NOT DEFINED CPACK_PACKAGE_VERSION)
	set(CPACK_PACKAGE_VERSION "1.33.8-2")
endif()
set(CPACK_GENERATOR "DEB")
if(NOT DEFINED CPACK_DEBIAN_PACKAGE_ARCHITECTURE)
	execute_process(COMMAND dpkg --print-architecture OUTPUT_VARIABLE CPACK_DEBIAN_PACKAGE_ARCHITECTURE OUTPUT_STRIP_TRAILING_WHITESPACE)
endif()
set(CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}-${CPACK_PACKAGE_VERSION}_${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}")

set(DEB_DEPENDS
	"perl (>= 5.20.2)"
	"libmoo-perl"
	"libopengl-perl"
	"libwx-glcanvas-perl"
	"liblocal-lib-perl"
	"libextutils-typemaps-default-perl (>= 1.05)"
	"libextutils-xspp-perl (>= 0.1800)"
	"libgl1-mesa-glx | libgl1"
	"libglu1-mesa | libglu1"
	"libc6 (>= 2.14)"
	"libstdc++6 (>= 4.9)"
	"libtbb2"
	"libboost-system${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.0"
	"libboost-filesystem${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.0"
	"libboost-thread${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.0"
	"libboost-log${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.0"
	"libboost-locale${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.0"
	"libexpat1 (>= 2.0.1)"
	"libgcc1 (>= 1:4.1.1)"
)

list(APPEND DEB_DEPENDS
	"libwxgtk3.0-dev"
	"libwxbase3.0-dev"
	"libglew-dev"
)
# Todo Actually we want to include these libraries:
# For Jessie:
#	"libwxbase3.0-0 (>= 3.0.2)"
#	"libwxgtk3.0-0 (>= 3.0.2)"
#	"libglew1.10 (>= 1.10.0)"
# For Stretch:
#	"libwxbase3.0-0v5"
#	"libwxgtk3.0-0v5"
#	"libglew2.0"

string(REPLACE ";" "," DEB_DEPENDS "${DEB_DEPENDS}")
set(CPACK_DEBIAN_PACKAGE_DEPENDS ${DEB_DEPENDS})

include(CPack)
