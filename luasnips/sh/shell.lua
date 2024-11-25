-- local ls = require("luasnip")
-- local s = ls.snippet
-- local i = ls.insert_node
-- local fmta = require("luasnip.extras.fmt").fmta

-- -- local helper = require("utils.luasnip-helper-funcs")
-- -- local get_visual = helper.get_visual


-- -- local function create_snippets_for_shell()
-- local snippets = {}

-- -- Helper function to define a snippet
-- local function define_snippet(trig, dscr, nodes, opts)
--     opts = opts or {}
--     opts.trig = trig
--     opts.dscr = dscr
--     opts.regTrig = opts.regTrig or false
--     opts.wordTrig = opts.wordTrig or false
--     opts.priority = opts.priority or 1000
--     opts.snippetType = opts.snippetType or "autosnippet"     -- snippet or autosnippet
--     table.insert(snippets, s(opts, nodes))
-- end

-- --------------------------------------- Pairs -------------------------------------------------
-- local bash = {
--     {
--         trig = "shebang1",
--         dscr =
--         "Shebang to specify what shell is going to run the script by default. It includes a description of the script. \n\nIt must be defined in the first line of the script.\n\nBy using #!/usr/bin/env we are making the shebang portable, meaning it is going to work correctly even if the interpreter is not located under /usr/bin",
--         nodes = fmta(
--             [[
--             #!/usr/bin/env <>
--             #
--             # <>
--             ]],
--             { i(1, "bash"), i(2, "Description of the script.") }
--         ),
--         opts = { wordTrig = true }
--     },
-- }

-- for _, pair in ipairs(bash) do
--     define_snippet(pair.trig, pair.dscr, pair.nodes, pair.opts)
-- end


-- return snippets
-- -- end

-- -- ls.add_snippets("shell", create_snippets_for_shell())

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local snippets = {}

-- Helper function to define a snippet
local function define_snippet(trig, dscr, nodes, opts)
    opts = opts or {}
    opts.trig = trig
    opts.dscr = dscr
    opts.regTrig = opts.regTrig or false
    opts.wordTrig = opts.wordTrig or true
    opts.priority = opts.priority or 1000
    table.insert(snippets, s(trig, nodes, opts))
end

--------------------------------------- Pairs -------------------------------------------------
local bash = {
    {
        trig = "shebang1",
        dscr =
        "Shebang to specify what shell is going to run the script by default. It includes a description of the script. \n\nBy using #!/usr/bin/env we are making the shebang portable, meaning it is going to work correctly even if the interpreter is not located under /usr/bin",
        nodes = fmta(
            [[
            #!/usr/bin/env <>
            #
            # <>
            ]],
            { i(1, "bash"), i(2, "Description of the script.") }
        ),
        opts = { wordTrig = true }
    },
}

for _, pair in ipairs(bash) do
    define_snippet(pair.trig, pair.dscr, pair.nodes, pair.opts)
end

return snippets

