-- spacetabs config
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- leader/localleader mapping
vim.g.mapleader = " "
vim.g.maplocalleader = "//"

-- tab controls
vim.keymap.set("n", "<C-]>", ":tabn<CR>", {desc = "Next tab", silent=true})
vim.keymap.set("n", "<C-[>", ":tabp<CR>", {desc = "Previous tab", silent=true})
vim.keymap.set("n", "<C-t>", ":tabe<CR>", {desc = "New tab", silent=true})


-- Alpha keybind
vim.keymap.set("n", "<leader>a", ":Alpha<CR>", {desc = "Alpha"})


-- LSP go to definition etc
vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", {silent=true, desc="goto declaration"})
vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.definition()<CR>", {silent=true, desc="goto definition"})
vim.keymap.set("n", "<leader>s", ":ClangdSwitchSourceHeader<CR>", {silent=true, desc="Switch .h/.cpp"})
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {silent=true, desc="LSP hover"})


-- sessions
vim.keymap.set("n", "<leader>Ss", ":mksession!<CR>", {silent=true, desc="save current session"})
vim.keymap.set("n", "<leader>Sl", ":source Session.vim<CR>", {silent=true, desc="load previous session"})

-- splits
vim.keymap.set("n", "<leader>v", ":vs<CR>", {silent=true, desc="vertical split"})
