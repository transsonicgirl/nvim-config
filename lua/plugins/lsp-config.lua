return{
    { -- MASON (LSP manager)
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    { -- MASON-LSPCONFIG (installs LSPs)
    "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "asm_lsp", "astro", "bashls", "clangd", "cmake", "cssls", "html", "ltex", "lua_ls", "matlab_ls", "harper_ls", "rust_analyzer"}
            })
        end
    },
    { -- LSPCONFIG (Allows using LSPs in Neovim)
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require ('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.asm_lsp.setup({
                capabilities = capabilities
            })
            lspconfig.astro.setup({
                capabilities = capabilities
            })
            lspconfig.bashls.setup({

                capabilities = capabilities
            })
            lspconfig.clangd.setup({

                capabilities = capabilities
            })
            lspconfig.cmake.setup({

                capabilities = capabilities
            })
            lspconfig.cssls.setup({

                capabilities = capabilities
            })
            lspconfig.html.setup({

                capabilities = capabilities
            })
            lspconfig.ltex.setup({

                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({

                capabilities = capabilities
            })
            lspconfig.harper_ls.setup({

                capabilities = capabilities
            })
            lspconfig.rust_analyzer.setup({

                capabilities = capabilities
            })
            lspconfig.verible.setup({

                capabilities = capabilities
            })
        end
    },
}
