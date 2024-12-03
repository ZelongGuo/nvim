local line_begin = require("luasnip.extras.expand_conditions").line_begin

local snippets = {
    -- for CMakeLists.txt
    s(
        { trig = "cmake" },
        fmta(
            [[
            # This is for CMakeLists.txt

            # Minimum Cmake Version Required:
            cmake_minimum_required(VERSION 3.14)

            # PROJECT Name:
            project(<>)

            # Compiling Opt:
            add_compile_options(-g -Wunused)

            set(CMAKE_C_STANDARD 99)
            set(CMAKE_C_FLAGS_DEBUG "-g")
            set(CMAKE_C_FLAGS_RELEASE "-O2")

            # Header files:
            include_directories(${CMAKE_SOURCE_DIR}/include)

            # Source files:
            file(GLOB SOURCES ${CMAKE_SOURCE_DIR}/src/*.c)

            # Executable files:
            add_executable(MyExecutable main.c ${SOURCES})
            ]],
            { i(1, "ProjectName"), }

        ),
        { condition = line_begin }
    ),

    -- for CMakeLists.txt, more info
    s(
        { trig = "cmake_more" },
        fmta(
            [[
            # This is for CMakeLists.txt

            # Minimum Cmake Version Required:
            cmake_minimum_required(VERSION 3.1...3.21)

            # Project Name:
            project(<>)

            # Compiling Opt:
            set(CMAKE_C_STANDARD 99)
            set(CMAKE_C_FLAGS_DEBUG "-g")
            set(CMAKE_C_FLAGS_RELEASE "-O2")

            # Header files:
            include_directories(${CMAKE_SOURCE_DIR}/include)

            # Source files:
            file(GLOB SOURCES ${CMAKE_SOURCE_DIR}/src/*.c)

            # Executable files:
            add_executable(MyExecutable main.c ${SOURCES})

            ### Require out-of-source builds
            file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
            if(EXISTS "${LOC_PATH}")
                message(FATAL_ERROR "You cannot build in a source directory (or any directory with a CMakeLists.txt file). Please make a build subdirectory. Feel free to remove CMakeCache.txt and CMakeFiles.")
            endif()
            ]],
            { i(1, "main"), }

        ),
        { condition = line_begin }
    ),
}

return snippets
