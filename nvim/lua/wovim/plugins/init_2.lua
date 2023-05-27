return{
----------------------the colorscheme --------------------------
    -- Packer 可以管理自己本身
    {'wbthomason/packer.nvim'},


    use{"kyazdani42/nvim-web-devicons" }
    use{"nvim-lua/plenary.nvim"}
    use{ "moll/vim-bbye" }
    use{ 'nvim-tree/nvim-web-devicons' }

    --themes
    {'folke/tokyonight.nvim'},
    {"mhartington/oceanic-next"},
    {"shaunsingh/nord.nvim"},
    {"ful1e5/onedark.nvim"},
    {"EdenEast/nightfox.nvim"},

-----------------------------------------------------
    { 
      "nvim-tree/nvim-tree.lua",
      config=function()
        require("wovim.plugins.nvim-tree")
      end, 
    },

    { "akinsho/bufferline.nvim",
      config=function()
        require("wovim.plugins.bufferline")
      end,
    },

    {"folke/trouble.nvim", 
      config=function()
        require("wovim.plugins.trouble")
      end,
    },

    {
      "nvim-lualine/lualine.nvim",
      config=function()
        require("wovim.plugins.lualine")
    end,},

    {"arkav/lualine-lsp-progress"},
    -- lualine (新增,
    {
      "nvim-telescope/telescope.nvim",
      config=function()
        require("wovim.plugins.telescope")
      end,
   },
    
    {
    'goolord/alpha-nvim',
    config=function()
      require("wovim.plugins.alpha-nvim")
    end,
    },

    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate",
    config=function()
      require("wovim.plugins.nvim-treesitter")
    end,
    },

    {'is0n/fm-nvim',
    config=function()
      require("wovim.plugins.fm-nvim")
    end,
    },
--------------------- LSP --------------------
    {"williamboman/mason.nvim"},
    -- Lspconfig
    { "williamboman/mason-lspconfig.nvim" },
    {"neovim/nvim-lspconfig"},

-------------------cmp-----------------------
-- 补全引擎
    {"windwp/nvim-autopairs"},
    {"numToStr/Comment.nvim",
    config=function()
      require("wovim.plugins.comment")
    end,   
  },
    {"hrsh7th/nvim-cmp"},
    -- snippet 引擎
    -- Snippet engine
    { "L3MON4D3/LuaSnip" } 
    { "saadparwaiz1/cmp_luasnip" }
    -- 补全源
    {"hrsh7th/cmp-vsnip"},
    {"hrsh7th/cmp-nvim-lsp"}, -- { name = nvim_lsp }
    {"hrsh7th/cmp-buffer"}, -- { name = 'buffer' },
    {"hrsh7th/cmp-path"}, -- { name = 'path' }
    {"hrsh7th/cmp-cmdline"}, -- { name = 'cmdline' }

    -- 常见编程语言代码段
    {"rafamadriz/friendly-snippets"},
    -- ui
    {"onsails/lspkind-nvim"},
    -- indent-blankline
    {"lukas-reineke/indent-blankline.nvim",
    config=function()
      require("wovim.plugins.indent_blankline")
    end},

}
