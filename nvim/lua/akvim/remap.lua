--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- leader key 为空
vim.g.mapleader = " "

local opt = {
  noremap = true,
  silent = true,
}
vim.o.timeoutlen = 400
-- 本地变量
local map = vim.keymap.set
-- $跳到行尾不带空格 (交换$ 和 g_)
--map("v", "$", "g_", opt)
--map("v", "g_", "$", opt)
--map("n", "$", "g_", opt)
--map("n", "g_", "$", opt)

-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<C-s>", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)
-- fix :set wrap
vim.keymap.set("n", "j", [[v:count  ? 'gj' : 'j']], { expr = true, silent = true })
vim.keymap.set("n", "k", [[v:count  ? 'gk' : 'k']], { expr = true, silent = true })

-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
map("n", "qq", ":q!<CR>", opt)
map("n", "<leader>q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
-- map("i", "<C-h>", "<ESC>I", opt)
-- map("i", "<C-l>", "<ESC>A", opt)

-- insert mode , double tap <j> to exit to normal
map("i", "jk", "<Esc>", opt)
map("v", "jk", "<Esc>", opt)
-- move cursor to ahead of a line or end of line

map("n", "E", "$", opt)


------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "<leader>sv", ":vsp<CR>", opt)
map("n", "<leader>sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "<leader>sc", "<C-w>c", opt)
-- 关闭其他
map("n", "<leader>so", "<C-w>o", opt) -- close others

-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>x", "<cmd>!chmod +x %<cr>", {silent=true})
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Right>", ":vertical resize -2<CR>", opt)
map("n", "<C-Left>", ":vertical resize +2<CR>", opt)
-- 上下比例
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 相等比例
map("n", "<leader>s=", "<C-w>=", opt)

-- Terminal相关
map("n", "<leader>tv", ":vsp | terminal<CR>", opt)
map("n", "<leader>tp", ":sp | terminal<CR>", opt)

-- Esc 回 Normal 模式
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "jk", "<C-\\><C-n>", opt)
map("t", "<leader>e", "<End>", opt)
map("n", "wp", "\"+p", opt)
map("v", "wy", "\"+y", opt)
--------------------------------------plugins
---
