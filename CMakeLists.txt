cmake_minimum_required(VERSION 3.0)

#It seems Cmake does not set default bild type so we force it
if( NOT CMAKE_BUILD_TYPE )
    set( CMAKE_BUILD_TYPE Debug CACHE STRING "Debug" FORCE )
endif()

project(freeopcua)

option(BUILD_CLIENT "Build Client" ON)

option(SSL_SUPPORT_MBEDTLS "Support rsa-oaep password encryption using mbedtls library " ON)

OPTION(BUILD_SHARED_LIBS "Build shared libraries." ON)

SET(DYNAMIC_ADDON_PATH "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/libtest_dynamic_addon.so")
SET(TEST_CORE_CONFIG_PATH "${PROJECT_SOURCE_DIR}/tests/core/configs/")
SET(OS_SUFFIX _lin)
# gcc less then version 4.9 uses a broken std::regex implementation
# use libxml2 to parse URL's instead
if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS 4.9.0)
    find_package(LibXml2 REQUIRED)
    message(STATUS "LibXML2 INCLUDE DIR IS: " ${LIBXML2_INCLUDE_DIR})
    include_directories( ${LIBXML2_INCLUDE_DIR} )

    SET(NO_REGEX_SUFFIX _noregex)
endif()


#FIXME: remove that variable and link directly when necessary!!!!
SET(ADDITIONAL_LINK_LIBRARIES pthread dl ${LIBXML2_LIBRARIES})

IF (NOT DEFINED CMAKE_INSTALL_LIBDIR)
    SET(CMAKE_INSTALL_LIBDIR lib)
ENDIF ()

SET (CMAKE_LIBRARY_OUTPUT_DIRECTORY
        ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR}
        CACHE PATH
        ""
    )

SET (CMAKE_RUNTIME_OUTPUT_DIRECTORY
        ${PROJECT_BINARY_DIR}/bin
        CACHE PATH
        ""
    )

SET (CMAKE_ARCHIVE_OUTPUT_DIRECTORY
        ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR}
        CACHE PATH
        ""
    )

set(ADDITIONAL_PUBLIC_COMPILE_OPTIONS)

# Helper function to generate a pkg-config file for a single library
# Takes the filename of the .pc file as a parameter and replaces all
# placeholders in the .pc.in file with the actual values
# (does nothing on non-unix systems)
function(generate_pkgconfig TARGET_NAME)
    if(UNIX)
        include(FindPkgConfig QUIET)
        if(PKG_CONFIG_FOUND)
            # prepare variables (the placeholders in the pc.in files are lowercase hence the unusal var names)
            set(prefix ${CMAKE_INSTALL_PREFIX})
            set(exec_prefix ${CMAKE_INSTALL_PREFIX})
            set(libdir ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR})
            set(includedir ${CMAKE_INSTALL_PREFIX}/include)
            get_target_property(interface_cflags ${TARGET_NAME} INTERFACE_COMPILE_OPTIONS)
            if(NOT interface_cflags)
                # no flags, set to empty
                set(interface_cflags)
            endif()

            # generate pkg-config file
            configure_file("lib${TARGET_NAME}.pc.in" "lib${TARGET_NAME}.pc" @ONLY)
            install(FILES       "${CMAKE_CURRENT_BINARY_DIR}/lib${TARGET_NAME}.pc"
                    DESTINATION "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/pkgconfig")
        endif()
    endif()
endfunction(generate_pkgconfig)

if(UNIX)
    find_package(spdlog)
    if(spdlog_FOUND)
        message(STATUS "Found spdlog")
        set(ADDITIONAL_PUBLIC_COMPILE_OPTIONS -DHAVE_SYSTEM_SPDLOG)
        set(ADDITIONAL_LINK_LIBRARIES ${ADDITIONAL_LINK_LIBRARIES} spdlog::spdlog)
    endif()
endif()

find_package( Boost COMPONENTS system program_options filesystem thread REQUIRED )
include_directories( ${Boost_INCLUDE_DIRS} )
link_directories( ${Boost_LIBRARY_DIRS} )
message(STATUS "Boost INCLUDE DIR IS: " ${Boost_INCLUDE_DIRS})
message(STATUS "Boost LIBRARY DIR IS: " ${Boost_LIBRARY_DIRS})

message(STATUS "SSL support using libmbedtls: " ${SSL_SUPPORT_MBEDTLS})
if (SSL_SUPPORT_MBEDTLS)
    add_definitions(-DSSL_SUPPORT_MBEDTLS)
    IF (DEFINED SSL_SUPPORT_MBEDTLS_INCLUDE_DIR)
        message(STATUS "  mbedtls library INCLUDE_DIR: " ${SSL_SUPPORT_MBEDTLS_INCLUDE_DIR})
        include_directories( ${SSL_SUPPORT_MBEDTLS_INCLUDE_DIR} )
    ENDIF ()
    IF (DEFINED SSL_SUPPORT_MBEDTLS_LIB_DIR)
        message(STATUS "  mbedtls library LIB_DIR: " ${SSL_SUPPORT_MBEDTLS_LIB_DIR})
        link_directories( ${SSL_SUPPORT_MBEDTLS_LIB_DIR} )
    ENDIF ()
    SET(SSL_SUPPORT_LINK_LIBRARIES mbedcrypto mbedx509 mbedtls)
    message(STATUS "  mbedtls LIBRARIES: " ${SSL_SUPPORT_LINK_LIBRARIES})
endif (SSL_SUPPORT_MBEDTLS)

include_directories(
    ${PROJECT_SOURCE_DIR}/include
    ${ADDITIONAL_INCLUDES}
    )

install(DIRECTORY include/opc DESTINATION include)

############################################################################
# Protocol library
############################################################################

ADD_CUSTOM_COMMAND(
    OUTPUT ${PROJECT_SOURCE_DIR}/include/opc/ua/protocol/object_ids.h
    COMMAND python ${PROJECT_SOURCE_DIR}/schemas/codegen.py cxx object_ids > ${PROJECT_SOURCE_DIR}/include/opc/ua/protocol/object_ids.h
    #DEPENDS ${PROJECT_SOURCE_DIR}/NodeIds.csv
  )


add_library(opcuaprotocol
    src/protocol/rawsize_auto.cpp
    src/protocol/serialize_auto.cpp
    src/protocol/deserialize_auto.cpp
    src/protocol/constructors_auto.cpp
    src/protocol/protocol.cpp
    src/protocol/binary_attribute.cpp
    src/protocol/binary_data_value.cpp
    src/protocol/binary_endpoints.cpp
    src/protocol/binary_messages.cpp
    src/protocol/binary_node_management.cpp
    src/protocol/binary_raw_size.cpp
    src/protocol/binary_serialization.h
    src/protocol/binary_session.cpp
    src/protocol/binary_stream.cpp
    src/protocol/binary_variant.cpp
    src/protocol/binary_view.cpp
    src/protocol/input_from_buffer.cpp
    src/protocol/monitored_items.cpp
    src/protocol/nodeid.cpp
    src/protocol/session.cpp
    src/protocol/status_codes.cpp
    src/protocol/string_utils.cpp
    src/protocol/string_utils_attributeid_tostring.cpp
    src/protocol/string_utils_objectid_tostring.cpp
    src/protocol/string_utils_statuscode_tostring.cpp
    src/protocol/subscriptions.cpp
)

if (NOT CMAKE_VERSION VERSION_LESS 2.8.12)
    target_compile_options(opcuaprotocol PUBLIC ${STATIC_LIBRARY_CXX_FLAGS})
endif ()
target_compile_options(opcuaprotocol PUBLIC ${ADDITIONAL_PUBLIC_COMPILE_OPTIONS})
target_link_libraries(opcuaprotocol ${ADDITIONAL_LINK_LIBRARIES})
target_include_directories(opcuaprotocol PUBLIC $<INSTALL_INTERFACE:include>)
install(TARGETS opcuaprotocol EXPORT FreeOpcUa
                              LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
                              ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)

generate_pkgconfig(opcuaprotocol)

if (NOT WIN32)
    target_link_libraries(opcuaprotocol ${Boost_LIBRARIES})
endif ()


############################################################################
# core library
############################################################################

SET(opcuacore_SOURCES
    src/core/common/addons_core/addon_manager.cpp
    src/core/common/addons_core/config_file.cpp
    src/core/common/addons_core/dynamic_library${OS_SUFFIX}.cpp
    src/core/common/addons_core/dynamic_addon_factory.cpp
    src/core/common/addons_core/dynamic_library.h
    src/core/common/addons_core/errors_addon_manager.cpp
    src/core/common/common_errors.cpp
    src/core/common/exception.cpp
    src/core/common/thread.cpp
    src/core/common/uri_facade${OS_SUFFIX}${NO_REGEX_SUFFIX}.cpp
    src/core/common/value.cpp
    src/core/event.cpp
    src/core/model_impl.h
    src/core/model_node.cpp
    src/core/model_object.cpp
    src/core/model_object_type.cpp
    src/core/model_server.cpp
    src/core/model_variable.cpp
    src/core/node.cpp
    src/core/opcua_errors.cpp
    src/core/socket_channel.cpp
    src/core/subscription.cpp
    src/core/server_operations.cpp
)

add_library(opcuacore ${opcuacore_SOURCES})

if (NOT CMAKE_VERSION VERSION_LESS 2.8.12)
    target_compile_options(opcuacore PUBLIC ${STATIC_LIBRARY_CXX_FLAGS})
endif ()

target_compile_options(opcuacore PUBLIC ${ADDITIONAL_PUBLIC_COMPILE_OPTIONS})
target_link_libraries(opcuacore ${ADDITIONAL_LINK_LIBRARIES} opcuaprotocol ${Boost_SYSTEM_LIBRARY} ${Boost_FILESYSTEM_LIBRARY})
target_include_directories(opcuacore PUBLIC $<INSTALL_INTERFACE:include>)
install(TARGETS opcuacore EXPORT FreeOpcUa
                          LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
                          ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)

generate_pkgconfig(opcuacore)

############################################################################
# client library
############################################################################
if (BUILD_CLIENT)

    add_library(opcuaclient
    src/client/binary_connection.cpp
    src/client/binary_client.cpp
    src/client/binary_client_addon.cpp
    src/client/client.cpp
    )

    if (NOT CMAKE_VERSION VERSION_LESS 2.8.12)
        target_compile_options(opcuaclient PUBLIC ${STATIC_LIBRARY_CXX_FLAGS})
    endif ()
    target_compile_options(opcuaclient PUBLIC ${ADDITIONAL_PUBLIC_COMPILE_OPTIONS})
    target_link_libraries(opcuaclient
        opcuacore
        ${ADDITIONAL_LINK_LIBRARIES}
        ${Boost_PROGRAMOPTIONS_LIBRARY}
        ${SSL_SUPPORT_LINK_LIBRARIES}
    )

    target_include_directories(opcuaclient PUBLIC $<INSTALL_INTERFACE:include>)
    install(TARGETS opcuaclient EXPORT FreeOpcUa
                                LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
                                ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static)

    generate_pkgconfig(opcuaclient)

    ############################################################################
    # command line client
    ############################################################################

    add_executable(opcuaclientapp
    src/clientapp/opcua_main.cpp
    src/clientapp/opcua_options.cpp
    src/clientapp/opcua_options_attribute_ids.h
    src/clientapp/opcua_options.h
    )


    target_compile_options(opcuaclientapp PUBLIC ${ADDITIONAL_PUBLIC_COMPILE_OPTIONS})
    target_link_libraries(opcuaclientapp
        ${ADDITIONAL_LINK_LIBRARIES}
        ${Boost_PROGRAM_OPTIONS_LIBRARY}
        opcuaprotocol
        opcuacore
    )

    if (NOT CMAKE_VERSION VERSION_LESS 2.8.12)
        target_compile_options(opcuaclient PUBLIC ${EXECUTABLE_CXX_FLAGS})
    endif ()
endif(BUILD_CLIENT)

install(EXPORT FreeOpcUa DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/FreeOpcUa FILE FreeOpcUaConfig.cmake)

SET(CPACK_GENERATOR "DEB")
SET(CPACK_DEBIAN_PACKAGE_MAINTAINER "FreeOpcUa")
INCLUDE(CPack)
