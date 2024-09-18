--  vim-colorschemes
return{
		"flazz/vim-colorschemes",
		lazy = false,     -- disable lazy loading
		priority = 1000,  -- high priority
		config = function()
				vim.opt.background = "light",
				vim.cmd("colorscheme Atelier_ForestLight")
		end,
}

-- The Light schemes
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


