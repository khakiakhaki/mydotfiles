return
{
  	{
    lazy=true,
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- null_ls.builtins.formatting.nginx_beautifier,
					--null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.code_actions.shellcheck,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.jq,
					-- for python
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.diagnostics.hadolint,
				},
			})
		end,
	},
    -- LSP Support
    {                                      -- Optional
      'williamboman/mason.nvim',
      event="VeryLazy",
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason-lspconfig.nvim',
      event= "BufRead",
    dependencies={"onsails/lspkind.nvim"},
  },-- Optional
   

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    { 'hrsh7th/cmp-buffer'},   -- { name = 'buffer' },
    { 'hrsh7th/cmp-path'},
    {'L3MON4D3/LuaSnip'},     -- Required
    { "saadparwaiz1/cmp_luasnip" },
    {"onsails/lspkind.nvim",event="VeryLazy"},
};
