-- :h mason-default-settings
-- ~/.local/share/nvim/mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "pyright",
    "bashls",
  },
})

local lspconfig = require("lspconfig")

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  lua_ls = require("wovim.lsp.config.lua"), -- lua/lsp/config/lua.lua
  --pylsp = require("lsp.config.pylsp"),
  -- remark_ls = require("lsp.config.markdown"),
  clangd= require("wovim.lsp.config.clangd"),
  pyright= require("wovim.lsp.config.pyright"),  
  bashls= require("wovim.lsp.config.bash")  
}
for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end
