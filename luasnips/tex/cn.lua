local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Chinese Support
return {
    -- A shebang-like comment for Chinese
    s(
        { trig = 'cn' },
        t("%! TeX program = xelatex")
    ),

    -- ctex package
    s(
        { trig = 'ctex' },
        { t("\\usepackage[UTF8]{ctex}") }
    )
}
