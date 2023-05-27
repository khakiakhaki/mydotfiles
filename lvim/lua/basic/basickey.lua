local opt = {
  noremap = true,
  silent = true,
}

lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

vim.keymap.set("i", "jk", "<ESC>", opt)
vim.keymap.set("v", "jk", "<ESC>", opt)

vim.keymap.set("n", "<C-u>", "10k", opt)
vim.keymap.set("n", "<C-d>", "10j", opt)

vim.keymap.set("n", "<C-p>", "<CMD>Telescope find_files<CR>", opt)
vim.keymap.set("n", "E", "$", opt)
vim.keymap.set("n", "B", "0", opt)
vim.keymap.set("n", "<C-s>", ":w<CR>", opt)
vim.keymap.set("n", "<M-v>", "<C-v>", opt)
-- vim.keymap.set("n", ";", ":", opt)

-- magic search
vim.keymap.set("n", "/", "/\\v", { noremap = true, silent = false })
vim.keymap.set("v", "/", "/\\v", { noremap = true, silent = false })

-- scroll previre
vim.keymap.set("n", "<C-j>", "5j", opt)
vim.keymap.set("n", "<C-k>", "5k", opt)
vim.keymap.set("v", "<C-j>", "5j", opt)
vim.keymap.set("v", "<C-k>", "4k", opt)

-- window

vim.keymap.set("n", "s", "", opt)
lvim.keys.normal_mode["<leader>sv"] = "<CMD>vsp<CR>"
-- vim.keymap.set("n", "<leader>sv", ":vsp<CR>", opt)
lvim.keys.normal_mode["<leader>sh"] = "<CMD>sp<CR>"
-- vim.keymap.set("n", "<leader>sh", ":sp<CR>", opt)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opt)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opt)
-- 上下比例
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opt)
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opt)
-- vim.keymap.set("n","cw","bcw",opt)
--
lvim.keys.normal_mode["<leader>st"] = "<CMD>vsp | terminal <CR>"
-- vim.keymap.set("n", "<leader>st"", ":vsp | terminal<CR>", opt)
lvim.keys.normal_mode["<leader>sth"] = "<CMD>sp | terminal <CR>"
-- vim.keymap.set("n", "<leader>sth", ":sp | terminal<CR>", opt)
vim.keymap.set("n", "wp", "\"+p", opt)
vim.keymap.set("v", "wy", "\"+y", opt)

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

local keys = {}
-------------------------build in plugin keymap
lvim.builtin.which_key.mappings["f"] = {}
lvim.keys.normal_mode["<leader>ff"] = { "<CMD>Telescope find_files<CR>" }
lvim.keys.normal_mode["<leader>fo"] = { "<CMD>Telescope oldfiles<CR>" }
lvim.keys.normal_mode["<leader>tr"] = { "<CMD>TroubleToggle<CR>" }
lvim.keys.normal_mode["<A-m>"] = { "<CMD>NvimTreeToggle<CR>" }
---------------------------------lsp
-- local keys.lsp={ -- jumps to the declaration
--     definition = "gd",
--     -- jumps to the declaration, many servers do not implement this method
--     declaration = "gD",
--     -- displays hover information
--     hover = "gh",
--     -- lists all the implementations
--     implementation = "gi",
--     -- lists all the references to the symbol
--     references = "gr",

--     rename = "<leader>rn",
--     code_action = "<leader>ca",
--     format = "<leader>f",
--     -- diagnostic
--     open_flow = "gp",
--     goto_next = "gj",
--     goto_prev = "gk",
--     list = "gl"
-- }

-- vim.keymap.set("n", keys.lsp.open_flow, "<CMD>lua vim.diagnostic.open_float()<CR>")
-- vim.keymap.set("n", keys.lap.goto_next, "<CMD>lua vim.diagnostic.goto_next()<CR>")
-- vim.keymap.set("n", keys.lap.goto_prev, "<CMD>lua vim.diagnostic.goto_prev()<CR>")
-- vim.keymap.set("n", keys.lap.list, "<CMD>lua Telescope loclist<CR>")

-- -- lsp
-- vim.keymap.set("n", keys.lap.definition, require("telescope.builtin").lsp_definitions, opt)
-- vim.keymap.set("n", keys.lap.declaration, vim.lsp.buf.declaration, opt)
vim.keymap.set("n", "gh", vim.lsp.buf.hover, opt)
-- vim.keymap.set("n", keys.lap.implementation, require("telescope.builtin").lsp_implementations, opt)
-- vim.keymap.set(
--   "n",
--   keys.lsp.references,
--   "<CMD>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy())<CR>",
--   opt
-- )
