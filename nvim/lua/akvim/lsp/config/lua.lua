-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local common=require("akvim.lsp.common-config")
local default_workspace = {
  checkThirdParty = false,
  {
    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
  },
  maxPreload = 5000,
  preloadFileSize = 10000,
}


local add_packages_to_workspace = function(packages, config)
  -- config.settings.Lua = config.settings.Lua or { workspace = default_workspace }
  local runtimedirs = vim.api.nvim__get_runtime({ "lua" }, true, { is_lua = true })
  local workspace = config.settings.Lua.workspace
  for _, v in pairs(runtimedirs) do
    for _, pack in ipairs(packages) do
      if v:match(pack) and not vim.tbl_contains(workspace.library, v) then
        table.insert(workspace.library, v)
      end
    end
  end
end

local lspconfig = require "lspconfig"

local make_on_new_config = function(on_new_config, _)
  return lspconfig.util.add_hook_before(on_new_config, function(new_config, _)
    local server_name = new_config.name

    if server_name ~= "sumneko_lua" then
      return
    end
    local plugins = { "plenary.nvim", "telescope.nvim", "nvim-treesitter", "LuaSnip" }
    add_packages_to_workspace(plugins, new_config)
  end)
end


local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        special={
        reload="require",
        },
    },
      completion = {
          callSnippet = 'Replace',
        },
      diagnostics = {
        enable = true,
          globals = { 'vim',"packer_plugins","reload" },
      },
      workspace = default_workspace,
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

-- 查看目录等信息
return {
    on_setup = function(server)
        server.setup(opts)
    end,
}
