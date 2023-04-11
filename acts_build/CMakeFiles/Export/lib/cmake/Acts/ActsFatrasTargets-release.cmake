#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ActsFatras" for configuration "Release"
set_property(TARGET ActsFatras APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ActsFatras PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libActsFatras.so"
  IMPORTED_SONAME_RELEASE "libActsFatras.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS ActsFatras )
list(APPEND _IMPORT_CHECK_FILES_FOR_ActsFatras "${_IMPORT_PREFIX}/lib/libActsFatras.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
