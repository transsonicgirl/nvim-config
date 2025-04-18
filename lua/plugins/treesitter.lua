return{
    {"nvim-treesitter/nvim-treesitter", 
        name = "treesitter", 
        build = ":TSUpdate", 
        priority=1000, 
        config = function()
            -- Treesitter config
            require'nvim-treesitter.configs'.setup {
                -- Parsers list, see github page for list of available language parsers
                auto_install = true,
                ensure_installed = {"verilog"},
                -- auto text highlighting
                highlight = { 
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                -- improved auto indenting engine
                indent = {
                    enable = true
                }
            }
        end
    },
}
