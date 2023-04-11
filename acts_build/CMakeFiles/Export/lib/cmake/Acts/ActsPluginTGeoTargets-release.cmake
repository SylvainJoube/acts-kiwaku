#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ActsPluginTGeo" for configuration "Release"
set_property(TARGET ActsPluginTGeo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ActsPluginTGeo PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libActsPluginTGeo.so"
  IMPORTED_SONAME_RELEASE "libActsPluginTGeo.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS ActsPluginTGeo )
list(APPEND _IMPORT_CHECK_FILES_FOR_ActsPluginTGeo "${_IMPORT_PREFIX}/lib/libActsPluginTGeo.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
