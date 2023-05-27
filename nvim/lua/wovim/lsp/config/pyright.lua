local common = require("wovim.lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = { 
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
  settings = {
    pyright = { autoImportCompletion = true },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
        extraPaths="/usr/bin/python3",
      },
    },
  },
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
