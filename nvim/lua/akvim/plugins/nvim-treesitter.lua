local opts={
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"yaml", "json","bash", "python", "c"},
  sync_install = false,
-- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
}



return{
  'nvim-treesitter/nvim-treesitter', 
  build=':TSUpdate',
config=function()
require("nvim-treesitter.configs").setup(opts)
end,
cmd={
  "TSInstall",
	"TSUninstall",
	"TSUpdate",
	"TSUpdateSync",
	"TSInstallIndo",
	"TSInstallSync",
	"TSInstallFromGrammar",
	},
  event="User FileOpened",
}
