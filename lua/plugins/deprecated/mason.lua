local M = {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,

    dependencies = {
        { "williamboman/mason.nvim" },
    },
}

M.config = function()

    vim.keymap.set('n', '<leader>ma', ":Mason<CR>", { desc = "open Mason window" })

    -------------------------------- MASON SETUPS ---------------------------------------------
    require("mason").setup({
        ui = {
            border = "none",

            -- Width of the window. Accepts:
            -- - Integer greater than 1 for fixed width.
            -- - Float in the range of 0-1 for a percentage of screen width.
            width = 0.8,
            height = 0.9,

            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            },

            keymaps = {
                -- Keymap to expand a package
                toggle_package_expand = "<CR>",
                -- Keymap to install the package under the current cursor position
                install_package = "<Space>i",
                -- Keymap to reinstall/update the package under the current cursor position
                update_package = "<Space>u",
                -- Keymap to check for new version for the package under the current cursor position
                check_package_version = "<Space>c",
                -- Keymap to update all installed packages
                update_all_packages = "<Space>U",
                -- Keymap to check which installed packages are outdated
                check_outdated_packages = "<Space>C",
                -- Keymap to uninstall a package
                uninstall_package = "<Space>X",
                -- Keymap to cancel a package installation
                cancel_installation = "<C-c>",
                -- Keymap to apply language filter
                apply_language_filter = "<C-f>",
                -- Keymap to toggle viewing package installation log
                toggle_package_install_log = "<CR>",
                -- Keymap to toggle the help view
                toggle_help = "?",
            },
        }
    })

    ---------------------------- MASON LSPCONFIG SETUPS -------------------------------------------
    -- SERVERS SETTINGS
    local servers = {
        lua_ls = {
            Lua = {
                diagnostics = { globals = { 'vim' }, }, -- global virable of vim for lua to prevent warnings
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
        -- pyright = {},
        -- jsonls = {},
        -- marksman = {},
        -- volar = {},
        -- dockerls = {},
        -- docker_compose_language_service = {},
        -- bashls = {},
        -- ocamllsp = {},
        -- taplo = {},
        -- ruff_lsp = {},
    }

    require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {
                    settings = servers[server_name],
                    -- on_attach = on_attach,
                }
            end,
        }
        -- -- auto-install configured servers (with lspconfig)
        -- automatic_installation = true, -- not the same as ensure_installed
    })
end

return M
