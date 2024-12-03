local helper = require("utils.luasnip-helper-funcs")
local get_visual = helper.get_visual
local get_time = helper.get_time

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return
{
    -- shell shebang
    s({ trig = "!!", snippetType = "autosnippet" },
        fmta([[#!/usr/bin/env <>]], { i(1, "bash") }),
        { condition = line_begin }
    ),

    s({ trig = "doc" },
        fmta(
            [[
            # Name:
            #       <> - <>
            #
            # Description:
            #       <> <>
            #
            # Author: Zelong Guo,  Email: zelong.guo@outlook.com
            # Created: <>
            #
            ]],
            {
                i(1, "name"),
                i(2, "description"),
                rep(1),
                i(3, "usage"),
                f(get_time, {})
            }
        ),
        { condition = line_begin }
    ),

    s({ trig = "for", snippetType = "autosnippet" },
        fmta(
            [[
        for <> in <>; do
          <>
        done
        ]],
            {
                i(1),
                i(2),
                i(0)
            }
        ),
        { condition = line_begin }
    ),
    -- s({ trig = "read" },
    --     fmt(
    --         [=[
    --       while read line
    --       do
    --         [[ -z "${line}" ]] && continue
    --         [[ "${line}" = \#* ]] && continue
    --         echo "${line}"
    --         ()
    --       done < ()
    --     ]=],
    --         {
    --             i(2),
    --             i(1, "myfile.txt")
    --         },
    --         { delimiters = "()" }
    --     ),
    --     { condition = line_begin }
    -- ),
    -- IF STATEMENT
    s({ trig = "if" },
        fmta(
            [=[
          if [[ <> ]]; then
            <>
          fi
        ]=],
            {
                i(1),
                i(0)
            }
        ),
        { condition = line_begin }
    ),
    -- -- ECHO
    -- s({ trig = "pp", snippetType = "autosnippet" },
    --     fmta(
    --         [[
    --     echo "<>"
    --     ]],
    --         {
    --             d(1, get_visual),
    --         }
    --     )
    -- ),
}


