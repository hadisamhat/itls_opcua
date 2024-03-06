# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/user/freeopcua

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/user/freeopcua/build/freeopcua

# Include any dependencies generated for this target.
include CMakeFiles/opcuaclient.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/opcuaclient.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/opcuaclient.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/opcuaclient.dir/flags.make

CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.o: CMakeFiles/opcuaclient.dir/flags.make
CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.o: ../../src/client/binary_connection.cpp
CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.o: CMakeFiles/opcuaclient.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/freeopcua/build/freeopcua/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.o -MF CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.o.d -o CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.o -c /home/user/freeopcua/src/client/binary_connection.cpp

CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/freeopcua/src/client/binary_connection.cpp > CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.i

CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/freeopcua/src/client/binary_connection.cpp -o CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.s

CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.o: CMakeFiles/opcuaclient.dir/flags.make
CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.o: ../../src/client/binary_client.cpp
CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.o: CMakeFiles/opcuaclient.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/freeopcua/build/freeopcua/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.o -MF CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.o.d -o CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.o -c /home/user/freeopcua/src/client/binary_client.cpp

CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/freeopcua/src/client/binary_client.cpp > CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.i

CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/freeopcua/src/client/binary_client.cpp -o CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.s

CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.o: CMakeFiles/opcuaclient.dir/flags.make
CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.o: ../../src/client/binary_client_addon.cpp
CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.o: CMakeFiles/opcuaclient.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/freeopcua/build/freeopcua/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.o -MF CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.o.d -o CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.o -c /home/user/freeopcua/src/client/binary_client_addon.cpp

CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/freeopcua/src/client/binary_client_addon.cpp > CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.i

CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/freeopcua/src/client/binary_client_addon.cpp -o CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.s

CMakeFiles/opcuaclient.dir/src/client/client.cpp.o: CMakeFiles/opcuaclient.dir/flags.make
CMakeFiles/opcuaclient.dir/src/client/client.cpp.o: ../../src/client/client.cpp
CMakeFiles/opcuaclient.dir/src/client/client.cpp.o: CMakeFiles/opcuaclient.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/freeopcua/build/freeopcua/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/opcuaclient.dir/src/client/client.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opcuaclient.dir/src/client/client.cpp.o -MF CMakeFiles/opcuaclient.dir/src/client/client.cpp.o.d -o CMakeFiles/opcuaclient.dir/src/client/client.cpp.o -c /home/user/freeopcua/src/client/client.cpp

CMakeFiles/opcuaclient.dir/src/client/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/opcuaclient.dir/src/client/client.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/freeopcua/src/client/client.cpp > CMakeFiles/opcuaclient.dir/src/client/client.cpp.i

CMakeFiles/opcuaclient.dir/src/client/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/opcuaclient.dir/src/client/client.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/freeopcua/src/client/client.cpp -o CMakeFiles/opcuaclient.dir/src/client/client.cpp.s

# Object files for target opcuaclient
opcuaclient_OBJECTS = \
"CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.o" \
"CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.o" \
"CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.o" \
"CMakeFiles/opcuaclient.dir/src/client/client.cpp.o"

# External object files for target opcuaclient
opcuaclient_EXTERNAL_OBJECTS =

lib/libopcuaclient.so: CMakeFiles/opcuaclient.dir/src/client/binary_connection.cpp.o
lib/libopcuaclient.so: CMakeFiles/opcuaclient.dir/src/client/binary_client.cpp.o
lib/libopcuaclient.so: CMakeFiles/opcuaclient.dir/src/client/binary_client_addon.cpp.o
lib/libopcuaclient.so: CMakeFiles/opcuaclient.dir/src/client/client.cpp.o
lib/libopcuaclient.so: CMakeFiles/opcuaclient.dir/build.make
lib/libopcuaclient.so: lib/libopcuacore.so
lib/libopcuaclient.so: lib/libopcuaprotocol.so
lib/libopcuaclient.so: /usr/lib/x86_64-linux-gnu/libspdlog.so.1.9.2
lib/libopcuaclient.so: /usr/lib/x86_64-linux-gnu/libfmt.so.8.1.1
lib/libopcuaclient.so: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.74.0
lib/libopcuaclient.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.74.0
lib/libopcuaclient.so: /usr/lib/x86_64-linux-gnu/libboost_atomic.so.1.74.0
lib/libopcuaclient.so: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.74.0
lib/libopcuaclient.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.74.0
lib/libopcuaclient.so: CMakeFiles/opcuaclient.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/user/freeopcua/build/freeopcua/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library lib/libopcuaclient.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opcuaclient.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/opcuaclient.dir/build: lib/libopcuaclient.so
.PHONY : CMakeFiles/opcuaclient.dir/build

CMakeFiles/opcuaclient.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/opcuaclient.dir/cmake_clean.cmake
.PHONY : CMakeFiles/opcuaclient.dir/clean

CMakeFiles/opcuaclient.dir/depend:
	cd /home/user/freeopcua/build/freeopcua && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/user/freeopcua /home/user/freeopcua /home/user/freeopcua/build/freeopcua /home/user/freeopcua/build/freeopcua /home/user/freeopcua/build/freeopcua/CMakeFiles/opcuaclient.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/opcuaclient.dir/depend
