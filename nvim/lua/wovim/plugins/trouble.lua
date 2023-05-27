local status,trouble=pcall(require,"trouble")
if not status then 
  vim.notify("no find plugin: trouble")
  return
end


trouble.setup({
  action_keys=require("wovim.keybindings").trouble,
}
)

