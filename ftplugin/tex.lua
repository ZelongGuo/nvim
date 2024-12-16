-- tex.vim
-- setlocal colorcolumn=

-- " setting indentation
-- setlocal expandtab
-- setlocal autoindent
-- setlocal tabstop=4
-- setlocal softtabstop=4
-- setlocal shiftwidth=4

-- let g:tex_flavor = 'latex'  " recognize tex files as latex

-- " Spell
-- setlocal spell
-- setlocal spelllang=en_us
-- "setlocal spellfile=~/.vim/spell/en.utf-8.add
-- "setlocal spellfile+=~/books/practical_vim/jargon.utf-8.add

-- " TODO: setting different folding strategy
-- " zM, zR, za, zm, zr
-- setlocal foldenable
-- setlocal foldmethod=marker
-- setlocal foldmarker=\\begin{,\\end{

----------------------------------------------------------------------------------------------------
-- /opt/homebrew/opt/neovim/share/nvim/runtime/ftplugin
-- /Users/zelong/.local/share/nvim/lazy/vimtex/ftplugin/tex.vim
-- Disable color column for LaTeX
vim.opt_local.colorcolumn = ""

-- Setting indentation options
vim.opt_local.expandtab = true
vim.opt_local.autoindent = true
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

-- Recognize tex files as LaTeX
vim.g.tex_flavor = "latex"

-- -- Spell check settings, disbale it baceuse the performance
-- vim.opt_local.spell = true
-- vim.opt_local.spelllang = "en_us"
-- -- Uncomment and customize these lines if you have custom spell files
-- -- vim.opt_local.spellfile = { "~/.vim/spell/en.utf-8.add" }
-- -- vim.opt_local.spellfile:append("~/books/practical_vim/jargon.utf-8.add")

-- TODO: setting different folding strategy
-- zM, zR, za, zm, zr
-- Folding settings
vim.opt_local.foldenable = true
vim.opt_local.foldmethod = "manual"
-- vim.opt_local.foldmethod = "marker"
-- vim.opt_local.foldmarker = "\\begin{,\\end{"


-- -- Create automatic cmd
-- vim.api.nvim_create_augroup("VimTeX", { clear = true })

-- -- Refresh ToC after saving the files
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = "VimTeX",
--     pattern = "*.tex",
--     callback = function()
--         vim.fn["vimtex#toc#refresh"]()
--     end,
-- })

