-- Language Server Protocol: a protocol used for interacting (e.g., jumping, completion etc) between EDITOR PLUGINS and the LANGUAGE SERVER.
-- Developing Tools -> LSP -> Languages
--
local M = {
    "neovim/nvim-lspconfig",
    -- event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
    },
}

function M.config()

    -------------------------------- NVIM LSPCONFIG ---------------------------------------------
    -- vim.lsp.set_log_level("error")
    vim.lsp.set_log_level("off")
    -- setup lsp
    -- see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for supported languages

    ---------------- GLOBAL MAPPINGS ----------------
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set("n", "gl", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    -- vim.keymap.set('n', '<c-q>', vim.diagnostic.setloclist)
    -- vim.keymap.set("n", "<leader>lf", "vim.lsp.buf.formatting")
    -- vim.keymap.set('v', '<leader>lf', "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>")

    -- diagnostic
    vim.diagnostic.config({ virtual_text = true, underline = false })

    ---------------- BUFFER MAPPINGS ----------------
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local buffer = ev.buf
        local opts = { buffer = buffer }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- [G]oto [D]eclaration
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)  -- [G]oto [D]efinition
        vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)       -- Hover Documentation
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)  -- [G]oto [I]mplementation
        vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)  -- Signature Documentation
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)  -- [W]orkspace [A]dd Folder'
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts) -- [W]orkspace [R]emove Folder
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders())) -- [W]orkspace [L]ist Folders 
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)  -- Type [D]efinition
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)  -- [R]e[n]ame
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- [C]ode [A]ction'
        vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts) -- [G]oto [R]eferences')
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set({ "n", "v" }, "<leader>cf", function()
          vim.lsp.buf.format({ async = true })
        end, opts)

        -- inlay hints
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if
            client.supports_method("textDocument/inlayHint") or client.server_capabilities.inlayHintProvider
        then
          if vim.lsp.inlay_hint then -- I don't know why somehow vim.lsp.inlay_hint is nil, so do this check befre enable inlayhint
            vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
          end
        end
      end,
    })

    -------------------------------- MASON SETUPS ---------------------------------------------
    vim.keymap.set('n', '<leader>ma', ":Mason<CR>", { desc = "open Mason window" })

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
                diagnostics = { globals = { 'vim' }, },  -- global virable of vim for lua to prevent warnings
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


-- config = function()
--     local servers = {
--         lua_ls = {
--             Lua = {
--                 workspace = { checkThirdParty = false },
--                 telemetry = { enable = false },
--             },
--         },
--         pyright = {},
--         jsonls = {},
--         marksman = {},
--         volar = {},
--         dockerls = {},
--         docker_compose_language_service = {},
--         bashls = {},
--         ocamllsp = {},
--         taplo = {},
--         ruff_lsp = {},
--     }
--     local on_attach = function(_, bufnr)
--         -- Enable completion triggered by <c-x><c-o>
--         local nmap = function(keys, func, desc)
--             if desc then
--                 desc = 'LSP: ' .. desc
--             end

--             vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--         end

--         nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--         nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--         nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--         nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
--         nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--         nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--         nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--         nmap('<leader>wl', function()
--             print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--         end, '[W]orkspace [L]ist Folders')
--         nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
--         nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--         nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--         -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--         nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
--         nmap("<space>f", function()
--             vim.lsp.buf.format { async = true }
--         end, "[F]ormat code")
--     end
--     require("mason").setup()
--     require("mason-lspconfig").setup({
--         ensure_installed = vim.tbl_keys(servers),
--         handlers = {
--             function(server_name) -- default handler (optional)
--                 require("lspconfig")[server_name].setup {
--                     settings = servers[server_name],
--                     on_attach = on_attach,
--                 }
--             end,
--         }
--     })
-- end
