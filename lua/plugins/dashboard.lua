return {
    {
        "goolord/alpha-nvim",
        -- dependencies = { 'echasnovski/mini.icons' },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local dashboard = require("alpha.themes.dashboard")
            -- available: devicons, mini, default is mini
            -- if provider not loaded and enabled is true, it will try to use another provider
            require("alpha").setup(dashboard.config)

            dashboard.section.header.val = { -- boccher the rock
                "     ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗     ",
                "     ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║     ",
                "     ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║     ",
                "     ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║     ",
                "     ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║     ",
                "     ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝     ",
                "                                                                ",
                " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠤⠤⠤⠒⠒⠒⠒⠒⠒⠒⠒⠒⠂⠦⠤⠤⠄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠖⠋⠉⠀⣀⣀⠤⠤⠖⠒⠒⠒⠈⠉⠉⠉⠁⠒⠒⠢⠤⢄⣀⠀⠉⠑⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠴⠊⠁⣀⡤⠖⠊⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⠢⢄⡀⠈⠓⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢁⡠⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⢄⠀⠉⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠞⣡⠔⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠢⣄⠈⠣⡀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠎⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣄⠙⣄⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⡰⢋⡴⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢢⠘⣆⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⢀⡜⢁⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⢣⡘⣆⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⢀⡞⢀⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⣤⠀⠀⠈⡏⢣⠀⢳⡈⣆⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⡞⢀⡎⠀⠀⡴⠋⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡀⢸⠹⡄⠀⠈⢧⠀⠀⢱⠘⡆⠀⢣⠘⡄⠀⠀⠀",
                "⠀⠀⠀⠀⡼⠀⡜⠀⠀⠸⠀⢰⠃⠀⠀⠀⡴⢲⠀⠀⠀⠀⠀⠿⡄⠀⠀⠀⢀⠁⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣧⠀⢧⠇⠀⠀⠘⡆⠀⠀⠳⠇⠀⠈⡆⢳⠀⠀⠀",
                "⠀⠀⠀⣼⠃⢰⠁⠀⠀⢠⣠⠏⠀⠀⠀⠀⣅⡼⠀⠀⠀⠀⠀⣠⠃⠀⠀⠀⡜⠀⠀⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠉⠀⠈⠃⠀⠀⠀⢹⡀⠀⠀⠀⠀⠀⢹⠈⡇⠀⠀",
                "⠀⢀⡞⡏⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⢰⠇⠀⠀⢸⡀⠀⠀⠀⠀⡆⠀⠀⠀⠀⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⠀⠀⠈⡆⠃⠀⠀",
                "⢠⠎⢠⠁⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⠀⠀⠀⠀⢧⠀⠀⠀⠀⣷⠀⠀⠀⠀⠈⡇⠀⠀⢀⠀⠀⠀⠀⠀⠀⢹⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀",
                "⠃⠀⢸⠀⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⡀⠀⡇⠀⠀⠀⠀⠘⡆⠀⠀⢠⣽⣧⣄⣀⣀⠀⢹⡀⠀⢸⡀⠀⠀⠀⠀⠀⠘⡇⠀⠀⠀⠀⠀⢧⢸⠀⠀",
                "⠀⠀⡈⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢩⡀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠀⠀⢹⡄⠀⠀⢸⡘⣆⠀⠀⠀⠘⣷⠀⠀⡇⠀⠀⠀⠀⠀⠀⣇⠀⠀⠀⠀⠀⠘⣆⢣⡀",
                "⠀⠀⡇⢀⡿⡇⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⣸⡇⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠀⠀⢳⡀⠀⠀⡇⠘⡄⠀⠀⠀⢯⢣⡀⣇⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠈⠢⣙",
                "⠀⠀⢧⢸⠀⣇⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⢹⢳⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⢳⡀⠀⢷⠀⠹⡄⠀⠀⢸⠀⢳⣻⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠀⠀⠀⠀⠈",
                "⠀⠀⢸⢸⠀⢸⡀⠀⠀⢠⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⢸⠸⡄⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠳⡄⢸⠀⠀⠙⡄⠀⠘⡇⠀⢹⠀⠀⠀⠀⠀⠀⠸⠻⡀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠈⣼⠀⣸⢧⠀⠀⠸⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣸⣀⣇⣀⣀⣀⡸⡇⠀⠀⠀⠀⠀⠀⠀⠀⣀⣙⣼⣀⣀⣀⣘⣦⣀⣇⣀⢸⠀⡄⠀⠀⠀⠀⠸⠀⣟⢦⡀⠀⠀⠀⢰⣦",
                "⠀⠀⠀⢹⣴⡇⠈⢧⠀⠀⡄⠀⠀⠀⢠⡐⠛⣿⠛⠛⢻⣿⣿⣛⢛⣟⣳⡇⠀⠀⠀⠀⠀⠀⠀⠐⣻⣿⠿⠿⠿⠿⢿⣿⣿⠟⠓⢺⠀⡇⠀⠀⠀⠀⢸⣸⡇⠀⢷⠀⠀⠀⡏⠸",
                "⠀⠀⢠⣞⡵⢻⡀⠈⣳⡀⡇⠀⠀⠀⠸⠷⡶⠿⠶⢖⣚⣉⠉⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢿⣋⣉⣉⣉⣙⠿⠋⡀⠀⡜⠀⡇⠀⠀⠀⠀⢸⡿⠀⠀⢸⠀⢀⠜⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠑⢤⡏⠻⣇⠀⢀⡠⠔⠊⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠀⡇⢸⠇⠀⠀⠀⠀⣸⣤⠀⠀⢸⠴⠃⠀⠀⢰",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⡿⠋⣁⡤⠖⠋⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⢁⣿⠀⠀⣀⡤⡤⠟⣛⡠⠞⠁⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⠋⠁⠀⣀⡤⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣧⢿⣿⠞⠉⠁⠀⠀⠀⠃⠀⠠⠄⠀⠀⠀  ",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡤⠖⠋⣡⠔⠛⢳⠦⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡶⠟⠋⢹⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡤⠖⠋⠀⠀⠀⣸⠀⠈⢦⣿⠙⠳⣶⡠⠤⣤⣤⣀⡀⠀⢀⣠⠤⠀⣴⣶⣶⣿⢿⣿⣿⣷⣴⣷⣹⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⢀⡄⠀⣠⠞⠁⠀⠀⠀⠛⠀⠀⢀⣽⣿⣿⡏⢹⢿⣿⡅⠀⠀⢠⡿⣿⣿⡏⠀⣿⡿⠟⢻⣷⣿⡚⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⢸⠻⠚⠁⠀⠀⠀⠀⠀⠀⢀⡔⠛⠻⠿⣿⡄⢀⡟⠛⣿⣆⣠⠟⠀⠛⣷⡁⠀⣱⣧⠴⠛⠋⠉⠉⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠋⠀⠀⠀⠀⠀⠀⠀⠀⢀⡎⠀⠀⠀⠀⠈⢻⣼⠃⠀⠀⠙⠋⠀⠀⠀⠀⠳⣼⠋⠀⠀⠀⠀⠀⠀⠀⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⢀⣿⠓⠲⠤⠤⠤⠽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠤⠤⠤⠤⠤⢴⡆⠀⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⢸⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠈⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            }

            dashboard.section.header.opts.hl = "AlphaHeader"

            --[[ COWSAY HEADER
			startify.section.header.val = {
				" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
				" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
				" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
				" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
				" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
				" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
				" \\                                                    /",
				" ----------------------------------------------------- ",
				"                                \\  ^__^                ",
				"                                 \\ (oo)_______         ",
				"                                   (__)       )/\\/\\    ",
				"                                       ||----w |       ",
				"                                       ||     ||       ",
			}
            --]]
        end,
    },
}
