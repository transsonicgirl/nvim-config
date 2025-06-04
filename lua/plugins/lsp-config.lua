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
                ensure_installed = {"clangd", "cmake", "ltex", "lua_ls", "pylsp", "rust_analyzer"}
            })
        end
    },
    { -- LSPCONFIG (Allows using LSPs in Neovim)
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require ('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
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
            lspconfig.rust_analyzer.setup({

                capabilities = capabilities
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities
            })
        end
    },
}
