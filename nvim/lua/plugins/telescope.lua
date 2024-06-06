return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    -- change a keymap
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find recent files" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
    { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "find files" },
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
  },
}
