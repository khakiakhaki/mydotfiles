local M={}
function M.setup()
  require("akvim.global")
  require("akvim.basic")
  require("akvim.remap")
  require("akvim.lazy")
  require("akvim.cmp")
  require("akvim.lsp")
  vim.cmd.colorscheme("base16-tender")
end

return M
