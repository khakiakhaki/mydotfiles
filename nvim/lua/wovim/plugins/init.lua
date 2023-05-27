local packer = require("packer")
packer.startup({
  function(use)
----------------------the colorscheme --------------------------
    -- Packer 可以管理自己本身
    use('wbthomason/packer.nvim')


    use{"kyazdani42/nvim-web-devicons" }
    use{"nvim-lua/plenary.nvim"}
    use{ "moll/vim-bbye" }
    use{ 'nvim-tree/nvim-web-devicons' }

    --themes
    use('folke/tokyonight.nvim')
    use("mhartington/oceanic-next")
    use("shaunsingh/nord.nvim")
    use("ful1e5/onedark.nvim")
    use("EdenEast/nightfox.nvim")

-----------------------------------------------------
    use({ 
      "nvim-tree/nvim-tree.lua",
      config=function()
        require("wovim.plugins.nvim-tree")
      end, 
    })

    use({ "akinsho/bufferline.nvim",
      config=function()
        require("wovim.plugins.bufferline")
      end,
    })

    use({"folke/trouble.nvim", 
      config=function()
        require("wovim.plugins.trouble")
      end,
    })

    use({
      "nvim-lualine/lualine.nvim",
      config=function()
        require("wovim.plugins.lualine")
    end,})

    use("arkav/lualine-lsp-progress")
    -- lualine (新增)
    use({
      "nvim-telescope/telescope.nvim",
      config=function()
        require("wovim.plugins.telescope")
      end,
   })
    
   use ({
    'goolord/alpha-nvim',
    config=function()
      require("wovim.plugins.alpha-nvim")
    end,
    })

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate",
    config=function()
      require("wovim.plugins.nvim-treesitter")
    end,
    })

    use({'is0n/fm-nvim',
    config=function()
      require("wovim.plugins.fm-nvim")
    end,
    })
--------------------- LSP --------------------
    use({"williamboman/mason.nvim"})
    -- Lspconfig
    use({ "williamboman/mason-lspconfig.nvim" })
    use({"neovim/nvim-lspconfig"})

-------------------cmp-----------------------
-- 补全引擎
    use("windwp/nvim-autopairs")
    use({"numToStr/Comment.nvim",
    config=function()
      require("wovim.plugins.comment")
    end,   
  })
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    -- Snippet engine
    use{ "L3MON4D3/LuaSnip" } 
    use{ "saadparwaiz1/cmp_luasnip" }
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- ui
    use("onsails/lspkind-nvim")
    -- indent-blankline
    use({"lukas-reineke/indent-blankline.nvim",
    config=function()
      require("wovim.plugins.indent_blankline")
    end})

  end
})
