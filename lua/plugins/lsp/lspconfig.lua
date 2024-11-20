local M = {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "Mason", "LspInfo", }, -- "LspInstall", "LspUninstall"
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig" },
        { "j-hui/fidget.nvim", },
        {
            "folke/trouble.nvim",
            opts = {
                keys = {
                    q = "close",
                    ["<cr>"] = "jump",
                    i = "prev",
                    k = "next",
                    gb = {
                        action = function(view)
                            view:filter({ buf = 0 }, { toggle = true })
                        end,
                        desc = "Toggle Current Buffer Filter",
                    },
                },
            },
        },
        -- { "hrsh7th/cmp-nvim-lsp" },
    },
}

function M.config()
    -------------------------------- NVIM LSPCONFIG ---------------------------------------------
    -- vim.lsp.set_log_level("error")
    vim.lsp.set_log_level("off") -- won't generate the  lsp.log file /Users/zelong/.local/state/nvim/

    -- Highlight entire line for errors. Highlight the line number for warnings
    vim.diagnostic.config({
        virtual_text = true,
        underline = false,
        severity_sort = true,
        float = { border = "rounded", source = "always", },
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = '✘', -- ""     ✘
                [vim.diagnostic.severity.WARN] = '󰲉', -- "" ▲ 󰲉
                [vim.diagnostic.severity.HINT] = '⚑', -- ""  ⚑
                [vim.diagnostic.severity.INFO] = '»', -- "  " 󰍦     󰌵 󰛩 󰍨
            },
            -- linehl = {
            --     [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            -- },
            -- numhl = {
            --     [vim.diagnostic.severity.WARN] = 'WarningMsg',
            --     [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            -- },
        },
    })

    -- SERVERS settings
    -- For available parameters see vim_lsp_start()
    local servers = {
        -- /Users/zelong/.local/share/nvim/lazy/nvim-lspconfig/lua/lspconfig/configs/
        lua_ls = {
            -- cmd = {},
            -- name = {},
            -- capabilities = {},
            -- filetypes = {},
            -- on_attach = on_attach,
            settings = {                                    -- How to configure it should see language server official doduments (e.g., lua_ls)
                Lua = {
                    diagnostics = { globals = { 'vim' }, }, -- global virable of vim for lua to prevent warnings
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        },
        pyright = { filetypes = { 'python' }, },
        bashls = { filetypes = { 'sh' }, },
        marksman = { filetypes = { 'markdown', 'markdown.mdx' }, },
        ltex = {
            filetypes = { "bib", "gitcommit", "org", "plaintex",
                "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd",
                "context", "xhtml", "mail", "text" }, -- Exclude 'markdown and html'
        },
        clangd = { filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' }, },
        html = { filetypes = { 'html', 'templ' }, },
        cssls = { filetypes = { 'css', 'scss', 'less' }, },
    }

    local on_attach = function(_, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        local nmap = function(keys, func, desc)
            if desc then
                desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = bufnr, noremap = true, desc = desc })
        end

        -- Check out telescope LSP picker
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gd', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
        nmap('gk', vim.lsp.buf.hover, 'Hover Documentation')
        -- nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('gh', vim.lsp.buf.signature_help, 'Signature Documentation')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap("<space>cf", function()
            vim.lsp.buf.format { async = true } -- asynchronous format
        end, "[F]ormat code")
        -- Workspace
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        nmap('<leader>da', require "telescope.builtin".diagnostics, '[D]i[A]gnostics')
        -- Trouble diagnostics toggle filter.buf=0 (for current buffer only)
        nmap('<leader>t', "<CMD>:Trouble diagnostics focus=true<CR>", 'Open Trouble diagnostics')
        -- nmap('gl', vim.diagnostic.open_float)
        nmap('[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
        nmap(']d', vim.diagnostic.goto_next, 'Next Diagnostic')
        -- nmap('n', '<c-q>', vim.diagnostic.setloclist)
        -- nmap("n", "<leader>lf", "vim.lsp.buf.formatting")
        -- nmap('v', '<leader>lf', "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>")
    end

    --1 ---------------- BUFFER MAPPINGS ----------------
    --1 -- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
    --1 vim.api.nvim_create_autocmd("LspAttach", {
    --1     desc = "LSP Actions ",
    --1     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    --1     callback = function(event)
    --1         -- Enable completion triggered by <c-x><c-o>
    --1         -- vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    --1         -- Buffer local mappings.
    --1         -- See `:help vim.lsp.*` for documentation on any of the below functions
    --1         local buffer = event.buf
    --1         local opts = { buffer = buffer, noremap = true, nowait = true }
    --1         vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)                     -- [G]oto [D]eclaration
    --1         vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)                      -- [G]oto [D]efinition
    --1         vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)                           -- Hover Documentation
    --1         vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)                  -- [G]oto [I]mplementation
    --1         vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)                  -- Signature Documentation
    --1         vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)    -- [W]orkspace [A]dd Folder'
    --1         vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts) -- [W]orkspace [R]emove Folder
    --1         vim.keymap.set("n", "<leader>wl", function()
    --1             print(vim.inspect(vim.lsp.buf.list_workspace_folders()))                 -- [W]orkspace [L]ist Folders
    --1         end, opts)
    --1         vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)          -- Type [D]efinition
    --1         vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)                  -- [R]e[n]ame
    --1         vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)    -- [C]ode [A]ction'
    --1         vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts) -- [G]oto [R]eferences')
    --1         -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    --1         vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    --1             vim.lsp.buf.format({ async = true })
    --1         end, opts)

    --1         -- inlay hints
    --1         local client = vim.lsp.get_client_by_id(event.data.client_id)
    --1         if
    --1             client.supports_method("textDocument/inlayHint") or client.server_capabilities.inlayHintProvider
    --1         then
    --1             if vim.lsp.inlay_hint then -- I don't know why somehow vim.lsp.inlay_hint is nil, so do this check befre enable inlayhint
    --1                 vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
    --1             end
    --1         end
    --1     end,
    --1 })

    -------------------------------- FIDGET SETUPS  ---------------------------------------------
    require("fidget").setup({})
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
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers), -- servers list of automatic installation
        --handlers = {
        --    function(server_name) -- default handler (optional)
        --        require("lspconfig")[server_name].setup {
        --            settings = servers[server_name],
        --            -- on_attach = on_attach,
        --        }
        --    end,
        --}
        -- -- auto-install configured servers (with lspconfig)
        -- automatic_installation = true, -- not the same as ensure_installed
    })

    for server, configuration in pairs(servers) do
        require("lspconfig")[server].setup(
            vim.tbl_deep_extend("keep",
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                },
                configuration
            )
        )
    end
end

return M
