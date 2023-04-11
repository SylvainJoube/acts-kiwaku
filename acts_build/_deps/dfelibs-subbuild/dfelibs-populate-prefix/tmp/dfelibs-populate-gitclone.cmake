
if(NOT "/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-subbuild/dfelibs-populate-prefix/src/dfelibs-populate-stamp/dfelibs-populate-gitinfo.txt" IS_NEWER_THAN "/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-subbuild/dfelibs-populate-prefix/src/dfelibs-populate-stamp/dfelibs-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-subbuild/dfelibs-populate-prefix/src/dfelibs-populate-stamp/dfelibs-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout "https://github.com/acts-project/dfelibs.git" "dfelibs-src"
    WORKING_DIRECTORY "/home/sasa/work/acts-kiwaku/acts_build/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/acts-project/dfelibs.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout v20200416 --
  WORKING_DIRECTORY "/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'v20200416'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-subbuild/dfelibs-populate-prefix/src/dfelibs-populate-stamp/dfelibs-populate-gitinfo.txt"
    "/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-subbuild/dfelibs-populate-prefix/src/dfelibs-populate-stamp/dfelibs-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/sasa/work/acts-kiwaku/acts_build/_deps/dfelibs-subbuild/dfelibs-populate-prefix/src/dfelibs-populate-stamp/dfelibs-populate-gitclone-lastrun.txt'")
endif()

