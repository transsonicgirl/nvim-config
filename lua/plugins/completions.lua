return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    { -- LUASNIP: snippet engine
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",     -- more snippet engine
            "rafamadriz/friendly-snippets", -- snippet library
        },
        build = "make install_jsregexp",
    },


    { -- NVIM-CMP: snippet UI
        "hrsh7th/nvim-cmp",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
        config = function()
            -- Set up nvim-cmp.
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "friendly-snippets" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })

            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            local lspconfig = require('lspconfig')
            lspconfig.clangd.setup {
                capabilities = capabilities
            }
            lspconfig.clangd.setup {
                capabilities = capabilities
            }
            lspconfig.cssls.setup {
                capabilities = capabilities
            }
            lspconfig.html.setup {
                capabilities = capabilities
            }
            lspconfig.ltex.setup {
                capabilities = capabilities
            }
            lspconfig.lua_ls.setup {
                capabilities = capabilities
            }
            lspconfig.rust_analyzer.setup {
                capabilities = capabilities
            }
            lspconfig.pylsp.setup {
                capabilities = capabilities
            }
                
        end,
    },
}
