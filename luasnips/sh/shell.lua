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
    -- ECHO
    s({ trig = "gmt_template"},
        fmta(
            [[
            #!/usr/bin/env bash


            gmt set MAP_FRAME_PEN 2p
            gmt set FONT_ANNOT_PRIMARY 8p
            gmt set FONT_ANNOT_SECONDARY 7p
            gmt set FONT_LABEL 8p
            gmt set MAP_TICK_LENGTH 0.1c
            gmt set MAP_FRAME_TYPE Plain
            gmt set MAP_ANNOT_OFFSET_PRIMARY 1p
            gmt set MAP_ANNOT_OFFSET_SECONDARY 1p
            gmt set MAP_LABEL_OFFSET 1.5p
            gmt set MAP_ANNOT_OBLIQUE lat_parallel
            
            gmt begin <> png
                gmt basemap -JN15c -Rg -Ba60 -B+t"<>" --FONT_TITLE=9p,black --MAP_TITLE_OFFSET=-6p
                gmt grdimage @earth_relief_10m -Iearth_relief_10m+d # -Ctopo.cpt
                gmt coast -Da -W0.3p,blue
            gmt end show
            rm gmt*

        ]],
            {
                i(1, "test"),
                i(2, "test"),
            }
        )
    ),
}


