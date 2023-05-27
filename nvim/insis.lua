require("insis").setup({
    lock_plugin_commit = false,
    enable_very_magic_search = true,
    lua = {
      enable = true,
    },
    clangd = {
      enable = true,
      format_on_save = true,
    },
    bash = {
      enable = true,
      format_on_save = true,
    },
    
    python = {
      enable = true,
      format_on_save = true,
    },
  })