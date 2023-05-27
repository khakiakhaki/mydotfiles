local M={}
M.setup = function()
    local status_ok, packer = pcall(require, "packer")
    if not status_ok then
      vim.notify("require packer.nvim failed")
      return
    end
    --local pluginList = getPluginList()
    local pluginList = require("insis.plugins")
    packer.reset()
    packer.startup({
      function(use)
        for _, plugin in ipairs(pluginList) do
          use(plugin)
        end
      end,
      config = {
        -- snapshots folder
        snapshot_path = p.getConfig(),
        max_jobs = nil,
        clone_timeout = 100,
        -- custom source
        git = {
          -- default_url_format = "https://hub.fastgit.xyz/%s",
          -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
          -- default_url_format = "https://gitcode.net/mirrors/%s",
          -- default_url_format = "https://github.com/%s",
          default_url_format = cfg.mirror.packer .. "%s",
        },
        display = {
          open_fn = function()
            return require("packer.util").float({ border = "rounded" })
          end,
        },
      },
    })
  end

  local function createSnapshots()
    vim.api.nvim_command("PackerSnapshot snapshots-plugins.json")
  end
  return M