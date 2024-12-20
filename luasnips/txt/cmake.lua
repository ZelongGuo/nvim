local line_begin = require("luasnip.extras.expand_conditions").line_begin

local ls = require("luasnip")
-- Extend 'yaml' filetype snippets to 'text'
ls.filetype_extend("text", { "yaml" })

local snippets = {
    -- for CMakeLists.txt
    s(
        { trig = "cmake", dscr = "Snippets for CMakeLists.txt", wordTrig = true, },
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
            { i(1, "ProjectName"), i(2, "VERSION 0.0.1"), i(3, "ExecutableName") }
        ),
        { condition = line_begin }
    ),
}

-- return snippets, DO NOT use return
-- Here we need explicitly specify the snippets are TEXT snippets rather than TXT snippets. TXT is
-- the folder name which is used for avoiding name conflics with TEX
require("luasnip").add_snippets("text", snippets)

