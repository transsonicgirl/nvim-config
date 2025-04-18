return {
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                integrations = {
                    alpha = true,
                },
                custom_highlights = function(colors)
                    return {
                        AlphaHeader = { fg = colors.mauve },
                    }
                end,
            })
            vim.cmd.colorscheme "catppuccin"
        end,
    },
}
