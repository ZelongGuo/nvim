-- Because we have set the list and listchar with defaults.lua, it may affect the indent functionality of the indent plugins
return {  
  {
    "shellRaining/hlchunk.nvim",
    init = function()
      -- Automatically trigger this plugin settings when the cursor moved under the normal and insert modes
      -- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL", })
      
      -- Dynamical chunk color with the vim theme
      local cb = function()
        if vim.g.colors_name == "Atelier_ForestLight" then  -- light theme
          return "seagreen"
        else -- dark theme
          return "#806d9c"   -- yellow
        	end
      end

      require('hlchunk').setup({
        chunk = {
          enable = true,
          use_treesitter = true,
          style = {
            --{	fg = "#806d9c"},
            {	fg = cb },
            {	fg = "red"}, -- if there is error then, the chunk color is red
					},
				},

				indent = {
					enable = false,
					chars = { "│", "¦", "┆", "┊", },
					use_treesitter = false,
				},

				blank = {
					enable = false,
				},

				line_num = {
					enable = false,
					use_treesitter = true,
				},
			})
		end
	},
}
