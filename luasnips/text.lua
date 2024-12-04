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

            # PROJECT Name and VERSION NO.:
            project(<> <>)

            # Complier Options, if you want debugging:
            add_compile_options(-g -O2 -Wunused)

            message(STATUS "CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")

            # Header files:
            include_directories(${CMAKE_SOURCE_DIR}/include)

            # Source files:
            file(GLOB SOURCES ${CMAKE_SOURCE_DIR}/src/*.c)

            # Executable files:
            add_executable(<> ${SOURCES})
            ]],
            { i(1, "ProjectName"), i(2, "VERSION 0.0.1"), i(3, "ExecutableName")}

        ),
        { condition = line_begin }
    ),

    -- for .clangd file to add the header files, otherwise the lsp throws "header files not found"
    s(
        { trig = "clangd" },
        fmta(
            [[
            # This is for the .clangd file which is for LSP disgnostics
            CompileFlags:
                Add:
                    # Add include directory to search path, relative path is supported
                    [-I/path/to/headers, -Ianother/include/path]
            ]]
        ),
        { condition = line_begin }
    ),
}

return snippets
