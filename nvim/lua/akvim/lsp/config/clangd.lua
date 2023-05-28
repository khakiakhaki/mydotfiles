local common=require("wovim.lsp.common-config")
--common.capabilities = require("cmp_nvim_lsp").default_capabilities()

local function switch_source_header_splitcmd(bufnr, splitcmd)
	bufnr = require("lspconfig").util.validate_bufnr(bufnr)
	local clangd_client = require("lspconfig").util.get_active_client_by_name(bufnr, "clangd")
	local params = { uri = vim.uri_from_bufnr(bufnr) }
	if clangd_client then
		clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
			if err then
				error(tostring(err))
			end
			if not result then
				vim.notify("Corresponding file can’t be determined", vim.log.levels.ERROR, { title = "LSP Error!" })
				return
			end
			vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
		end)
	else
		vim.notify(
			"Method textDocument/switchSourceHeader is not supported by any active server on this buffer",
			vim.log.levels.ERROR,
			{ title = "LSP Error!" }
		)
	end
end

common.capabilities.offsetEncoding = "utf-8"


local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  cmd = {
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--completion-style=detailed",
    "--query-driver=/usr/bin/clang",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=iwyu",
  },
  commands = {
			ClangdSwitchSourceHeader = {
				function()
					switch_source_header_splitcmd(0, "edit")
				end,
				description = "Open source/header in current buffer",
			},
			ClangdSwitchSourceHeaderVSplit = {
				function()
					switch_source_header_splitcmd(0, "vsplit")
				end,
				description = "Open source/header in a new vsplit",
			},
    },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
