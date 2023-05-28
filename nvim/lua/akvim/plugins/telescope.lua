return{
  lazy=true,
  keys={
    {"<leader>fp","<cmd>Telescope find_files<cr>",desc="Telescope find_files"},
    {"<leader>fg","<cmd>Telescope live_grep<cr>",desc="Telescope live_grep"},
    {"<leader>fb","<cmd>Telescope buffers<cr>",desc="Telescope buffers"},
    {"<leader>fh","<cmd>Telescope help_tags<cr>",desc="Telescope help_tags"},
    {"<leader>fo","<cmd>Telescope olfiles<cr>",desc="oldfiles"},
  },
  "nvim-telescope/telescope.nvim",
  tag='0.1.1',
  dependencies={"nvim-lua/plenary.nvim",lazy=true},
  config=function()
require("telescope").setup({
    defaults = {
      initial_mode = "normal",
      mappings = {
        i = {
          -- move up and down
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"]= "move_selection_previous",
          -- history
          ["<C-j>"]= "cycle_history_next",
          ["<C-k>"] = "cycle_history_prev",
          -- close window
          -- ["<esc>"] = actions.close,
        },
      },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          -- even more opts
          initial_mode = "normal",
        }),
      },
    },
  })
end,
}
