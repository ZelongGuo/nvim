local compile = function()
    vim.cmd("write")
    local filetype = vim.bo.filetype
    if filetype == "cpp" or filetype == "c" then
        os.execute("gcc " .. vim.fn.expand("%") .. " -g -o " .. vim.fn.expand("%<"))
    end
end

-- TODO: local and remote host debug
-- TODO: lazy loading the plugins

local M = {
    "mfussenegger/nvim-dap",
    -- dependencies = {
    --     {
    --         "ravenxrz/DAPInstall.nvim",  -- TODO: this plugins may be not needed ... you can
    --         install the debuggers manually ... 
    --         config = function()
    --             local dap_install = require("dap-install")
    --             dap_install.setup({
    --                 installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    --             })
    --         end
    --     },
    --     "theHamsta/nvim-dap-virtual-text",
    --     {
    --         "rcarriga/nvim-dap-ui",
    --         dependencies = {
    --             "nvim-neotest/nvim-nio",
    --         },
    --     },
    --     "nvim-dap-virtual-text",
    --     "nvim-telescope/telescope-dap.nvim",
    -- },

}

M.config = function ()
end

return M
