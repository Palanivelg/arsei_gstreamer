# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/itag/Software/arsei-master/classification_encode

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/itag/Software/arsei-master/classification_encode/build

# Include any dependencies generated for this target.
include CMakeFiles/classification_encode.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/classification_encode.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/classification_encode.dir/flags.make

CMakeFiles/classification_encode.dir/draw_axes.cpp.o: CMakeFiles/classification_encode.dir/flags.make
CMakeFiles/classification_encode.dir/draw_axes.cpp.o: ../draw_axes.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/itag/Software/arsei-master/classification_encode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/classification_encode.dir/draw_axes.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/classification_encode.dir/draw_axes.cpp.o -c /home/itag/Software/arsei-master/classification_encode/draw_axes.cpp

CMakeFiles/classification_encode.dir/draw_axes.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/classification_encode.dir/draw_axes.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/itag/Software/arsei-master/classification_encode/draw_axes.cpp > CMakeFiles/classification_encode.dir/draw_axes.cpp.i

CMakeFiles/classification_encode.dir/draw_axes.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/classification_encode.dir/draw_axes.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/itag/Software/arsei-master/classification_encode/draw_axes.cpp -o CMakeFiles/classification_encode.dir/draw_axes.cpp.s

CMakeFiles/classification_encode.dir/main.cpp.o: CMakeFiles/classification_encode.dir/flags.make
CMakeFiles/classification_encode.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/itag/Software/arsei-master/classification_encode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/classification_encode.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/classification_encode.dir/main.cpp.o -c /home/itag/Software/arsei-master/classification_encode/main.cpp

CMakeFiles/classification_encode.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/classification_encode.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/itag/Software/arsei-master/classification_encode/main.cpp > CMakeFiles/classification_encode.dir/main.cpp.i

CMakeFiles/classification_encode.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/classification_encode.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/itag/Software/arsei-master/classification_encode/main.cpp -o CMakeFiles/classification_encode.dir/main.cpp.s

# Object files for target classification_encode
classification_encode_OBJECTS = \
"CMakeFiles/classification_encode.dir/draw_axes.cpp.o" \
"CMakeFiles/classification_encode.dir/main.cpp.o"

# External object files for target classification_encode
classification_encode_EXTERNAL_OBJECTS =

classification_encode: CMakeFiles/classification_encode.dir/draw_axes.cpp.o
classification_encode: CMakeFiles/classification_encode.dir/main.cpp.o
classification_encode: CMakeFiles/classification_encode.dir/build.make
classification_encode: /opt/intel/openvino_2021/opencv/lib/libopencv_imgproc.so.4.5.1
classification_encode: /opt/intel/openvino_2021/opencv/lib/libopencv_core.so.4.5.1
classification_encode: CMakeFiles/classification_encode.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/itag/Software/arsei-master/classification_encode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable classification_encode"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/classification_encode.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/classification_encode.dir/build: classification_encode

.PHONY : CMakeFiles/classification_encode.dir/build

CMakeFiles/classification_encode.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/classification_encode.dir/cmake_clean.cmake
.PHONY : CMakeFiles/classification_encode.dir/clean

CMakeFiles/classification_encode.dir/depend:
	cd /home/itag/Software/arsei-master/classification_encode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/itag/Software/arsei-master/classification_encode /home/itag/Software/arsei-master/classification_encode /home/itag/Software/arsei-master/classification_encode/build /home/itag/Software/arsei-master/classification_encode/build /home/itag/Software/arsei-master/classification_encode/build/CMakeFiles/classification_encode.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/classification_encode.dir/depend

