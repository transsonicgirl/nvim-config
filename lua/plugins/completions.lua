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
            'chrisgrieser/cmp-nerdfont',
            'mtoohey31/cmp-fish',
        },
        config = function()
            -- Set up nvim-cmp.
            local cmp = require("cmp")
            local lsp_types = require('cmp.types').lsp
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
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<Down>'] = cmp.config.disable,
                    ['<Up>'] = cmp.config.disable,
                    ['<Left>'] = cmp.config.disable,
                    ['<Right>'] = cmp.config.disable,
                }),
                completion = {
                    autocomplete = true,
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "nerdfont" },
                    { name = "fish" },
                }),
                sorting = {
                    comparators = {
                        function(entry1, entry2)
                            local kind_priority = {
                                [lsp_types.CompletionItemKind.Method] = 100,
                                [lsp_types.CompletionItemKind.Property] = 90,
                                [lsp_types.CompletionItemKind.Field] = 80,
                                [lsp_types.CompletionItemKind.Function] = 70,
                                [lsp_types.CompletionItemKind.Variable] = 60,
                                [lsp_types.CompletionItemKind.Snippet] = 0,
                            }
                            local kind1 = kind_priority[entry1:get_kind()] or 0
                            local kind2 = kind_priority[entry2:get_kind()] or 0
                            if kind1 ~= kind2 then
                                return kind1 > kind2
                            end
                        end,
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    }
                },
                formatting = {
                    fields = { "abbr", "kind", "menu" },
                    max_width = 100,
                    format = function(entry, vim_item)
                        if entry.source.name == "nvim_lsp" then
                            vim_item.menu = "LSP"
                        elseif entry.source.name == "buffer" then
                            vim_item.menu = "BUF"
                        elseif entry.source.name == "path" then
                            vim_item.menu = "PTH"
                        elseif entry.source.name == "nerdfont" then
                            vim_item.menu = "FNT"
                        elseif entry.source.name == "fish" then
                            vim_item.menu = "FSH"
                        end
                        return vim_item
                    end,
                },
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
                cmd = { "clangd", "--background-index", "--all-scopes-completion", "--suggest-missing-includes" },
                capabilities = capabilities,
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


            vim.api.nvim_create_autocmd("TextChangedI", {
                group = vim.api.nvim_create_augroup("CmpTriggerOnDotArrow", { clear = true }),
                pattern = "*",
                callback = function()
                    local line = vim.api.nvim_get_current_line()
                    local col = vim.api.nvim_win_get_cursor(0)[2]
                    -- Check one char before and two chars before cursor
                    local char_before = line:sub(col, col)
                    local chars_before = line:sub(col - 1, col)
                    if char_before == '.' or chars_before == '->' or chars_before == '::' then
                        cmp.complete()
                    end
                end,
            })
        end,
    },
}
