
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- -- ---------------------------insert mode -changf to colemak----------- 
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--     pattern = { "*" },
--     callback = function()
--         local input_status = tonumber(vim.fn.system("im-select.exe 2057"))
--         if input_status == 2 then
--             vim.fn.system("im-select.exe 2057")
--         end
--     end,
-- }) 
--
-- vim.api.nvim_create_autocmd({ "InsertEnter" }, {
--     pattern = { "*" },
--     callback = function()
--         local input_status = tonumber(vim.fn.system("im-select.exe 1033"))
--     end,
-- }) 
--
--
--




-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}
vim.o.timeoutlen=400
-- 本地变量
local map = vim.api.nvim_set_keymap
-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<C-s>", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

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
map("n",";","enter command mode",opt)


------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "<leader>sv", ":vsp<CR>", opt)
map("n", "<leader>sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others

-- <leader> + hjkl 窗口之间跳转
map("n",";",":",opt)
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Right>", ":vertical resize -2<CR>", opt)
map("n", "<C-Left>", ":vertical resize +2<CR>", opt)
-- 上下比例
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 相等比例
map("n", "<leader>s=", "<C-w>=", opt)

-- Terminal相关
map("n", "<leader>st", ":vsp | terminal<CR>", opt)
map("n", "<leader>sth", ":sp | terminal<CR>", opt)
-- Esc 回 Normal 模式
map("t", "<Esc>", "<C-\\><C-n>", opt)
-- map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
-- map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
-- map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
-- map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
-- map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
-- map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
-- map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
-- map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "jk", "<C-\\><C-n>", opt)
map("t", "<leader>e", "<End>", opt)
map("n","wp","\"+p",opt)
map("v","wy","\"+y",opt)
----------------------------------------------------------------
--plugins 插件快捷键 ---plugins
----------------------------------------------------------------
--map("n","<A-m>",":NvimTreeToggle<CR>",opt)
local M = {}
---@nvim-tree
M.nvimTree = {
  enable = true,
  keys = {
    toggle = "<A-m>",
    refresh = "R",
    -- open / close --
    edit = {"<2-LeftMouse>" ,"<CR>"},
    close = "<BS>", -- close parent folder
    vsplit = "sv",
    system_open="o",
    split = "sh",
    tabnew = "st",
    -- movement --
    parent_node = "P",
    first_sibling = "K",
    last_sibling = "J",
    cd = ">",
    dir_up = "<",
    -- file toggle --
    toggle_git_ignored = "i", --.gitignore (git enable)
    toggle_dotfiles = ".", -- Hide (dotfiles)
    toggle_custom = "u", -- togglle custom config
    -- file operate --
    create = "c",
    remove = "d",
    rename = "a",
    cut = "x",
    copy = "y",
    paste = "p",
    copy_name = "yn",
    copy_path = "Yd",
    copy_absolute_path = "gy",
    toggle_file_info = "gh",
},
}
----------------------------------------------------------------

-- buffer line 
-- bufferline
-- 左右Tab切换
-- 关闭
map("n", "<leader>bh", ":BufferLineCyclePrev<CR>", opt)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>bl", ":BufferLineCycleNext<CR>", opt)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opt)

map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
map("n", "<C-w>", ":Bdelete!<CR>", opt)

-----------------------------------------------------
-- ranger
map("n","ra",":Ranger<CR>",opt)
map("n","<leader>fo","<cmd>Telescope oldfiles<CR>",opt)
map("n","<leader>ff","<cmd>Telescope find_files<CR>",opt)
map("n","<C-p>","<cmd>Telescope find_files<CR>",opt)

M.telescope = {
  enable = true,
  keys = {
    find_files = { "<C-p>", "<leader>ff" },
    live_grep = "<C-f>",
    -- super find  "xx" -tmd ---@see telescope-live-grep-args.nvim
    live_grep_args = "sf",
    -- up and down
    move_selection_next = "<C-j>",
    move_selection_previous = "<C-k>",
    -- history
    cycle_history_next = "<Down>",
    cycle_history_prev = "<Up>",
    -- close window
    close = "<esc>",
    -- scrolling in preview window
    preview_scrolling_up = "<C-u>",
    preview_scrolling_down = "<C-d>",
    
    oldfiles = "<leader>fo", 
    command_history="<leader>ch", 
  },
}
---@cmp
M.cmp = {
  enable = true,
  keys = {
    confirm = "<CR>",
    select_next_item = "<C-j>",
    select_prev_item = "<C-k>",
    scroll_doc_up = "<C-u>",
    scroll_doc_down = "<C-d>",
    complete = "<A-.>",
    abort = "<A-,>",
    -- luasnip
    snip_jump_next = "<C-l>",
    snip_jump_prev = "<C-h>",
    snip_next_choice = "<C-j>",
    snip_prev_choice = "<C-k>",
  },
}

M.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = "gcc", -- 行注释
    block = "gbc", -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = "gc",
    bock = "gb",
  }
}

------------------------------------------
map("n","<leader>tr",":TroubleToggle<CR>",opt)

M.trouble =
{
  -- key mappings for actions in the trouble list
  -- map to {} to remove a mapping, for example:
  -- close = {},
  close = "q", -- close the list
  cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
  refresh = "r", -- manually refresh
  jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
  open_split = { "<leader>th" }, -- open buffer in new split
  open_vsplit = { "<leader>tv" }, -- open buffer in new vsplit
  open_tab = { "<leader>to" }, -- open buffer in new tab
  jump_close = {"o"}, -- jump to the diagnostic and close the list
  toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
  toggle_preview = "P", -- toggle auto_preview
  hover = "K", -- opens a small popup with the full multiline message
  preview = "p", -- preview the diagnostic location
  close_folds = {"zM", "zm"}, -- close all folds
  open_folds = {"zR", "zr"}, -- open all folds
  toggle_fold = {"zA", "za"}, -- toggle fold of current file
  previous = "k", -- previous item
  next = "j" -- next item
}
------------------------------------------ tree


return M
