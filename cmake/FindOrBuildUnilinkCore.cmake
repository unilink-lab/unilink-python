set(UNILINK_CORE_SOURCE_DIR
    ""
    CACHE PATH "Path to local unilink C++ core source tree"
)

function(_unilink_python_select_core_target)
  if(TARGET unilink_static)
    set(UNILINK_PYTHON_CORE_TARGET
        unilink_static
        PARENT_SCOPE
    )
  elseif(TARGET unilink::unilink_static)
    set(UNILINK_PYTHON_CORE_TARGET
        unilink::unilink_static
        PARENT_SCOPE
    )
  elseif(TARGET unilink)
    set(UNILINK_PYTHON_CORE_TARGET
        unilink
        PARENT_SCOPE
    )
  elseif(TARGET unilink::unilink)
    set(UNILINK_PYTHON_CORE_TARGET
        unilink::unilink
        PARENT_SCOPE
    )
  else()
    message(
      FATAL_ERROR
        "unilink core was found, but no usable CMake target was exported. "
        "Expected one of unilink_static, unilink::unilink_static, unilink, "
        "or unilink::unilink."
    )
  endif()
endfunction()

if(UNILINK_CORE_SOURCE_DIR)
  get_filename_component(
    UNILINK_CORE_SOURCE_DIR "${UNILINK_CORE_SOURCE_DIR}" ABSOLUTE
  )
  if(NOT EXISTS "${UNILINK_CORE_SOURCE_DIR}/CMakeLists.txt")
    message(
      FATAL_ERROR
        "UNILINK_CORE_SOURCE_DIR does not point to a unilink source tree: "
        "${UNILINK_CORE_SOURCE_DIR}"
    )
  endif()

  message(STATUS "Using local unilink core source: ${UNILINK_CORE_SOURCE_DIR}")

  set(UNILINK_BUILD_TESTS
      OFF
      CACHE BOOL "" FORCE
  )
  set(UNILINK_BUILD_DOCS
      OFF
      CACHE BOOL "" FORCE
  )
  set(UNILINK_BUILD_EXAMPLES
      OFF
      CACHE BOOL "" FORCE
  )
  set(BUILD_PYTHON_BINDINGS
      OFF
      CACHE BOOL "" FORCE
  )
  set(UNILINK_BUILD_SHARED
      OFF
      CACHE BOOL "" FORCE
  )
  set(UNILINK_BUILD_STATIC
      ON
      CACHE BOOL "" FORCE
  )
  set(UNILINK_ENABLE_INSTALL
      OFF
      CACHE BOOL "" FORCE
  )

  add_subdirectory("${UNILINK_CORE_SOURCE_DIR}" "${CMAKE_BINARY_DIR}/unilink-core")
  _unilink_python_select_core_target()
else()
  message(STATUS "Using installed unilink CMake package")
  find_package(unilink CONFIG REQUIRED)
  _unilink_python_select_core_target()
endif()
