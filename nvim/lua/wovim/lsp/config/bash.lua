local common=require("wovim.lsp.common-config")



local opts={ 
  flag=common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
  cmd = { 'bash-language-server', 'start' },
}

return{
  on_setup = function (server)
    server.setup(opts)
  end,
}
