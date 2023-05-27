local status, fm_nvim = pcall(require, "fm-nvim")
if not status then
    vim.notify("没有找到 lualine")
  return
end

fm_nvim.setup{
	mappings = {
		-- Example for Vifm
		ESC        = ":q<CR>"
  },
	ui = {
		-- Default UI (can be "split" or "float")
		default = "float",

		float = {
			-- Floating window border (see ':h nvim_open_win')
			border    = "single",

			-- Highlight group for floating window/border (see ':h winhl')
			float_hl  = "Normal",
			border_hl = "FloatBorder",

			-- Floating Window Transparency (see ':h winblend')
			blend     = 0,

			-- Num from 0 - 1 for measurements
			height    = 0.8,
			width     = 0.8,

			-- X and Y Axis of Window
			x         = 0.5,
			y         = 0.5
		},

		split = {
			-- Direction of split
			direction = "topleft",

			-- Size of split
			size      = 24
		}
	},
}

