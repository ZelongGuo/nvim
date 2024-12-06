local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Chinese Support
return {
    s(
        { trig = 'cn' },
        t("%! TeX program = xelatex")
    ),

    s(
        { trig = 'ctex' },
        { t("\\usepackage[UTF8]{ctex}") }
    )
}
