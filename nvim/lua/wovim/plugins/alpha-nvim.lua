local alpha=require'alpha'

local dashboard = require'alpha.themes.dashboard'

dashboard.section.header.val = {
    [[                                                 ]],
    [[                                                 ]],
    [[   ██╗  ██╗  ██╗  ██╗  █████╗    ██╗  ██╗  ██╗   ]],
    [[   ██║ ██╔╝  ██║  ██║  ██╔══██╗  ██║ ██╔╝  ██║   ]],
    [[   █████╔╝   ███████║  ███████║  █████╔╝   ██║   ]],
    [[   ██╔═██╗   ██╔══██║  ██╔══██║  ██╔═██╗   ██║   ]],
    [[   ██║  ██╗  ██║  ██║  ██║  ██║  ██║  ██╗  ██║   ]],
    [[   ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝  ╚═╝   ]],
    [[                                                 ]],
    [[                                                 ]],
}
dashboard.section.buttons.val = {
    -- dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    -- dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    -- dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    -- dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    -- dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),

    dashboard.button("C - p ", 
    "  Find file        ",
    ":Telescope find_files <CR>"),

    dashboard.button("l f o ",
    "  Recently files   ",
    ":Telescope oldfiles <CR>"),

    dashboard.button("- - - ",
    "  New File         ",
    ":edit  newfile <CR>"),

    dashboard.button("- - - ",
    "  Edit config      ",
    ":edit /home/atmosu/.config/nvim/lua/bak/old/keybindings.lua <CR>"),

    dashboard.button("- - - ",
    "  Quit NVIM       ",
    ":qa!<CR>"),
}
--local handle = io.popen('fortune')
--local fortune = handle:read("*a")
--handle:close()

dashboard.section.footer.val = " codes forever"

--dashboard.config.opts.noautocmd = true

vim.cmd[[autocmd User AlphaReady echo 'ready']]
vim.cmd[[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]]

alpha.setup(dashboard.config)

