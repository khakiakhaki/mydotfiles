require("dashboard").setup({


  theme= 'doom',
  shotcut_type='letter',

  config={
  header = {
    [[]],
    [[]],
    [[]],
    [[]],
    [[                                                     ]],
    [[                                                     ]],
    [[     ██╗  ██╗  ██╗  ██╗  █████╗    ██╗  ██╗  ██╗     ]],
    [[     ██║ ██╔╝  ██║  ██║  ██╔══██╗  ██║ ██╔╝  ██║     ]],
    [[     █████╔╝   ███████║  ███████║  █████╔╝   ██║     ]],
    [[     ██╔═██╗   ██╔══██║  ██╔══██║  ██╔═██╗   ██║     ]],
    [[     ██║  ██╗  ██║  ██║  ██║  ██║  ██║  ██╗  ██║     ]],
    [[     ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝     ]],
    [[                                                     ]],
    [[                                                     ]],
    [[]],
    [[]],
    [[]],
    [[]],
  },
    center = {
      {
        icon = "  ",
        desc = "Find file                           ",
        action = "Telescope find_files",
        key = "C - P",
      },
      {
        icon = "  ",
        desc = "Recently files                      ",
        action = "Telescope oldfiles",
        key = "l f o",
      },
      {
        icon = "  ",
        desc = "Projects                            ",
        action = "Telescope projects",
        key = "- - -",
      },
      {
        icon = "  ",
        desc = "Edit Projects                       ",
        action = "edit ~/.local/share/nvim/project_nvim/project_history",
        key = "- - -",
      },
      {
        icon = "  ",
        desc = "Create New File                     ",
        action = " edit  newfile",
        key = "- - -",
      },
      {
        icon = "  ",
        desc = "Edit config                         ",
        action = "edit /home/atmosu/.config/nvim/lua/bak/old/keybindings.lua",
        key = "- - -",
      },
    },
    footer = 
    {
      "",
      "",
      "",
    },
  }
}
)




