-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set({ "i", "v" }, "jk", "<ESC>", { desc = "use jk as <ESC>" })
vim.keymap.set("n", "<c-\\>", "", { desc = "terminal" })

local opt = {
  noremap = true,
  silent = true,
}

-- add your own keymapping

vim.keymap.set("n", "<C-u>", "10k", opt)
vim.keymap.set("n", "<C-d>", "10j", opt)

-- vim.keymap.set("n", "<C-p>", "<CMD>Telescope find_files<CR>", opt)
vim.keymap.set("n", "<M-v>", "<C-v>", opt)
-- vim.keymap.set("n", ";", ":", opt)

-- magic search
vim.keymap.set({ "n", "v" }, "/", "/\\v", { desc = "magic search", noremap = true, silent = false })
-- vim.keymap.set("v", "/", "/\\v", { noremap = true, silent = false })

-- scroll previre
vim.keymap.set("n", "<C-j>", "5j", opt)
vim.keymap.set("n", "<C-k>", "5k", opt)
vim.keymap.set("v", "<C-j>", "5j", opt)
vim.keymap.set("v", "<C-k>", "4k", opt)

vim.keymap.set("n", "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- window

vim.keymap.set("n", "s", "", opt)
vim.keymap.set("n", "<M-Right>", ":vertical resize -2<CR>", opt)
vim.keymap.set("n", "<M-Left>", ":vertical resize +2<CR>", opt)
-- 上下比例
vim.keymap.set("n", "<M-Down>", ":resize +2<CR>", opt)
vim.keymap.set("n", "<M-Up>", ":resize -2<CR>", opt)
--
vim.keymap.set("n", "wp", '"+p', opt)
vim.keymap.set("v", "wy", '"+y', opt)

-- Automatically install missing parsers when entering buffer

-------------------------build in plugin keymap
-- vim.keymap.set("n", "<leader>fo", "<CMD>Telescope oldfiles<CR>", { desc = "find recent files" })
-- vim.keymap.set("n", "<A-m>", "<CMD>NvimTreeToggle<CR>")
