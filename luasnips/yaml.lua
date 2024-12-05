local line_begin = require("luasnip.extras.expand_conditions").line_begin

local snippets = {
    -- for .clangd file to add the header files, otherwise the lsp throws "header files not found"
    s(
        { trig = "clangd", dscr = "Snippets for.clangd", wordTrig = true, },
        fmta(
            [[
            # This is for the .clangd file which is for LSP disgnostics
            CompileFlags:
                Add:
                    # Add include directory to search path, relative path is supported
                    # e.g., [-I/path/to/headers, -Ianother/include/path]
                    <>
            ]],
            { i(1, "Include Your Header Files Here") }
        ),
        { condition = line_begin }
    ),
}

return snippets

-- TODO:
-- if you want to load snippets from text/cmake.lua:
-- Loading text/cmake.lua snippets
-- local cmake_snippets = dofile(vim.fn.stdpath("config") .. "/luasnips/text/cmake.lua")
-- Combine snippets
-- local snippets = vim.tbl_extend("force", cmake_snippets or {}, yaml_snippets)

-- return snippets
