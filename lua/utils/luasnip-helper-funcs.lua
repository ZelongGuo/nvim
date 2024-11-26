local Func = {}

-- Be sure to explicitly define these LuaSnip node abbreviations!
local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

function Func.get_visual(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else
        return sn(nil, i(1, ''))
    end
end

function Func.get_time()
    -- return os.date("%Y-%m-%d %H:%M:%S")
    return os.date("%m%.%d%.%Y %H:%M:%S")
end

return Func
