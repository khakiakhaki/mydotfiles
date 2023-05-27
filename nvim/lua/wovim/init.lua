-- 基础设置
local M ={}
---@type UserConfig
---@param user_config UserConfig
function M.setup()

  require('wovim.basic')
  require('wovim.utils.global')
  -- 快捷键映射
  require('wovim.keybindings')
  -- introduce the Packer plugin managment tool
  require('wovim.colorscheme')
  --local packer=require("wovim.packer")
  --packer.setup()
  require('wovim.plugins')
  -- -- LSP
  require('wovim.lsp')
  require('wovim.cmp')
  require('wovim.cmp.format')
  -- cmp

  require('wovim.lsp.ui')
  require('wovim.plugins.indent_blankline')

end

return M
