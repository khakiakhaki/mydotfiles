--map("n","<A-m>",":NvimTreeToggle<CR>",opt)
local M= {}
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
M.bufferLine = {
    enable = true,
    keys = {
      -- left / right cycle
      prev = "<leader>bh",
      next = "<leader>bl",
      -- close current buffer
      close = "<leader>c", -- close = "<leader>bc",
      -- close all left / right tabs
      close_left = "<leader>ch",
      close_right = "<leader>cl",
      -- close all other tabs
      close_others = "<leader>co",
      close_pick = "<leader>bp",
    },
  }
-- buffer line 
-- bufferline
-- 左右Tab切换
-- 关闭
-- map("n", "<leader>bh", ":BufferLineCyclePrev<CR>", opt)
-- map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opt)
-- map("n", "<leader>bl", ":BufferLineCycleNext<CR>", opt)
-- map("n", "<Tab>", ":BufferLineCycleNext<CR>", opt)
--
-- map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
-- map("n", "<C-w>", ":Bdelete!<CR>", opt)
--
-- -----------------------------------------------------
-- -- ranger
-- map("n","ra",":Ranger<CR>",opt)
-- map("n","<leader>fo","<cmd>Telescope oldfiles<CR>",opt)
-- map("n","<leader>ff","<cmd>Telescope find_files<CR>",opt)
-- map("n","<C-p>","<cmd>Telescope find_files<CR>",opt)

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
-- map("n","<leader>tr",":TroubleToggle<CR>",opt)

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
