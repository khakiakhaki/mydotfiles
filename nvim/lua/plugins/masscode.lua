return {
  dir = "~/.config/nvim/lua/localplugins/masscode-nvim",
  name = "masscode-nvim",
  config = function()
    require("masscode-nvim").set_up({
      ip_address = "192.168.1.126",
    })
  end,
  cmd = { "MasscodeSearch", "MasscodeCreate", "MasscodeSetIp" },
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
}
