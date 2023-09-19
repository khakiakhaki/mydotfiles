--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

vim.o.background = "dark"
vim.g.tokyonight_style = "storm" -- day / night
local colorscheme = "tokyonight"

local opt = {
  noremap = true,
  silent = true,
}

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
require("basic.basic")
require("basic.basickey")
lvim.plugins = {
  {
    lazy = true,
    "folke/trouble.nvim",
    cmd = { "TroubleToggle",
      "Trouble" },
  },
  {
    lazy = true,
    "is0n/fm-nvim",
    cmd = "Ranger",
  },
  -- {
  --   event = "VeryLazy",
  --   'mbbill/undotree',
  --   cmd = { "UndotreeToggle", "UndotreeFocus", "UndotreeShow" },
  -- },
  {
    "LintaoAmons/easy-commands.nvim",
    config = function()
      require("easy-commands").Setup({
        ["RunSelectedAndOutputWithPrePostFix"] = {
          prefix = "```",
          postfix = "```"
        }
      })
    end,
    cmd = 'RunSelectedAndOutputWithPrePostFix'
  },
  --   {
  --     event="VeryLazy",
  --     "github/copilot.vim",
  --   }
}

lvim.keys.normal_mode["<leader>ra"] = "<CMD>Ranger<CR>"
---------------------
---plugin keymap

lvim.keys.normal_mode['<leader>ra'] = { "<cmd>Ranger<cr>" }
lvim.keys.visual_mode['<leader>rc'] = { "<cmd>RunSelectedAndOutputWithPrePostFix<cr>" }
lvim.builtin.which_key.mappings["f"] = {}
lvim.keys.normal_mode["<leader>ff"] = { "<CMD>Telescope find_files<CR>" }
lvim.keys.normal_mode["<leader>fo"] = { "<CMD>Telescope oldfiles<CR>" }
lvim.keys.normal_mode["<leader>tr"] = { "<CMD>TroubleToggle<CR>" }
lvim.keys.normal_mode["<A-m>"] = { "<CMD>NvimTreeToggle<CR>" }
lvim.keys.normal_mode["<leader>ut"] = { "<CMD>UndotreeToggle<CR>" }
-- require("plugins.alpha-nvim")
require("plugins.fm-nvim")
