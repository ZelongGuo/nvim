--  vim-colorschemes
--  Other light themes:
-- sainnhe/edge, tokyonight.nvim, apprentice.nvim, everforest-nvim, sainnhe/everforest
-- ishan9299/nvim-solarized-lua, savq/melange-nvim, Th3Whit3Wolf/space-nvim, Th3Whit3Wolf/one-nvim
return {
  "ZelongGuo/doom-one.nvim",
  branch = "dev",
  lazy = false,     -- disable lazy loading
  priority = 1000,   -- high priority

  setup = function()
    -- Add color to cursor
    vim.g.doom_one_cursor_coloring = true
    -- Set :terminal colors
    vim.g.doom_one_terminal_colors = true
    -- Enable italic comments
    vim.g.doom_one_italic_comments = false
    -- Enable TS support
    vim.g.doom_one_enable_treesitter = true
    -- Color whole diagnostic text or only underline
    vim.g.doom_one_diagnostics_text_color = false
    -- Enable transparent background
    vim.g.doom_one_transparent_background = false

    -- Pumblend transparency
    vim.g.doom_one_pumblend_enable = false
    vim.g.doom_one_pumblend_transparency = 20
 
    -- Plugins integration
    vim.g.doom_one_plugin_neorg = false
    vim.g.doom_one_plugin_barbar = false
    vim.g.doom_one_plugin_telescope = true
    vim.g.doom_one_plugin_neogit = true
    vim.g.doom_one_plugin_nvim_tree = true
    vim.g.doom_one_plugin_dashboard = true
    vim.g.doom_one_plugin_startify = true
    vim.g.doom_one_plugin_whichkey = true
    vim.g.doom_one_plugin_indent_blankline = true
    vim.g.doom_one_plugin_vim_illuminate = true
    vim.g.doom_one_plugin_lspsaga = false
	end,
 
  config = function()
    vim.opt.background = "light",
    vim.cmd("colorscheme doom-one")
   end,

}

-- return{
--   "flazz/vim-colorschemes",
--   lazy = false,     -- disable lazy loading
--   priority = 1000,  -- high priority
--   config = function()
--     vim.opt.background = "light",
--     vim.cmd("colorscheme Atelier_ForestLight")
--   end,
-- }
--
-- -- The Light schemes
-- colorscheme solarized8_light_high
-- colorscheme Atelier_DuneLight
-- colorscheme Atelier_EstuaryLight
-- olorscheme Atelier_ForestLight
-- colorscheme Atelier_PlateauLight
-- colorscheme Atelier_SavannaLight
-- colorscheme Atelier_SeasideLight
-- colorscheme Atelier_SulphurpoolLight
-- colorscheme LightTan
-- colorscheme LightYellow
-- colorscheme OceanicNextLight
-- colorscheme flattened_light
-- colorscheme habiLight
-- colorscheme macvim-light
-- colorscheme lightning
-- colorscheme lightcolors
-- colorscheme rakr-light
-- colorscheme seoul256-light
-- colorscheme tigrana-256-light


