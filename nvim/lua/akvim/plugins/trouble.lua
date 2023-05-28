local localkemap={
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

return{
  lazy=true,
  keys={"<leader>tr","<cmd>TroubleToggle<CR>",desc="trouble toggle"},
  "folke/trouble.nvim",
  config=function()
require("trouble").setup({
  action_keys=localkeymap,
})
end,
}

