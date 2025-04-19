-- spacetabs config
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- leader/localleader mapping
vim.g.mapleader = " "
vim.g.maplocalleader = "//"

-- tab controls
vim.keymap.set("n", "<C-]>", ":tabn<CR>")
vim.keymap.set("n", "<C-[>", ":tabp<CR>")
vim.keymap.set("n", "<C-t>", ":tabe ")

-- Alpha keybind
vim.keymap.set("n", "<leader>a", ":Alpha<CR>")

