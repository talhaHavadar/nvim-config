return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "taplo",
                    "tsserver",
                    "rust_analyzer",
                    "yamlls",
                },
            })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        dependencies = { "neovim/nvim-lspconfig" },
        version = "^4", -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "b0o/schemastore.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            --local util = require("lspconfig/util")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.taplo.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = false,
                            url = "",
                        },
                        schemas = require("schemastore").yaml.schemas(),
                    },
                },
            })
            --[[ rustaceanvim will setup lspconfig
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                filetypes = { 'rust' },
                root_dir = util.root_pattern('Cargo.toml'),
                settings = {
                    ['rust_analyzer'] = {
                        cargo = {
                            allFeatures = true,
                        }
                    }
                }
            })]]
            --
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(e)
                    local opts = { silent = true, buffer = e.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set({ "i", "n" }, "<C-k>", vim.lsp.buf.signature_help, opts)
                end,
            })
        end,
    },
}
