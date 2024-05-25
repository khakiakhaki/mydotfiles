local M = {}
local Job = require('plenary.job')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local conf = require('telescope.config').values

local log_file = "/home/akawcc/.config/lvim/lua/plugins/log.txt"

-- set IP masscode
-- ip (win i use vim in wsl and masscode is in windows)
local config = {
  ip_address = "localhsot",
  mappings = {
    snippetcreate = "<leader>mc",
    snippetsearch = "<leader>ms",
    ESC = "<ESC>",
  }
}


function M.set_ip(new_ip)
  config.ip_address = new_ip
  print('masscode server set: ' .. config.ip_address)
end

function M.show_ip()
  print(config.ip_address)
end

-- get snippets
local function fetch_snippets(callback)
  local url = 'http://' .. config.ip_address .. ':3033/snippets/embed-folder'
  Job:new({
    command = 'curl',
    args = { '-s', url },
    on_exit = vim.schedule_wrap(function(j, return_val)
      if return_val == 0 then
        local result = table.concat(j:result(), '\n')
        local snippets = vim.json.decode(result)
        callback(snippets)
      else
        print('Error fetching snippets')
      end
    end),
  }):start()
end

-- custom nvim search
function M.search_snippet()
  fetch_snippets(function(snippets)
    local entries = {}
    for _, snippet in ipairs(snippets) do
      if snippet.content and #snippet.content > 0 then
        local value = snippet.content[1].value or ""
        local language = snippet.content[1].language or "text"
        table.insert(entries, {
          display = snippet.name,
          value = value,
          language = language,
          ordinal = snippet.name,
        })
      end
    end

    pickers.new({}, {
      prompt_title = 'Search Snippets',
      finder = finders.new_table {
        results = entries,
        entry_maker = function(entry)
          return {
            value = entry.value,
            display = entry.display,
            ordinal = entry.ordinal,
            language = entry.language,
          }
        end,
      },
      previewer = previewers.new_buffer_previewer {
        define_preview = function(self, entry, status)
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, vim.split(entry.value, '\n'))
          vim.api.nvim_buf_set_option(self.state.bufnr, 'filetype', entry.language)
        end,
      },
      attach_mappings = function(_, map)
        map('i', '<CR>', function(prompt_bufnr)
          local entry = require('telescope.actions.state').get_selected_entry()
          require('telescope.actions').close(prompt_bufnr)
          local lines = vim.split(entry.value, '\n')
          local cursor_pos = vim.api.nvim_win_get_cursor(0)
          vim.api.nvim_buf_set_lines(0, cursor_pos[1], cursor_pos[1], false, lines)
        end)
        return true
      end,
      sorter = conf.generic_sorter({}),
    }):find()
  end)
end

function M.create_snippet()
  -- 获取当前缓冲区和窗口
  local bufnr = vim.api.nvim_get_current_buf()
  local winid = vim.api.nvim_get_current_win()

  -- 获取选中的文本
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local logfile = io.open(log_file, "a")

  logfile:write(string.format("start: %s\n", vim.json.encode(start_pos)))
  logfile:write(string.format("end  : %s\n", vim.json.encode(end_pos)))
  logfile.close()

  -- 检查是否有选中的文本
  if start_pos[2] == end_pos[2] and start_pos[3] == end_pos[3] then
    print("No text selected.")
    return
  end

  vim.cmd("yank")
  local lines = vim.api.nvim_buf_get_lines(bufnr, start_pos[2] - 1, end_pos[2], false)
  local selected_text = table.concat(lines, '\n')

  -- 获取当前文件类型
  local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')

  -- 使用 vim.fn.input 获取用户输入
  local snippet_name = vim.fn.input('Snippet Name: ')

  -- 检查输入是否为空
  if snippet_name == '' then
    print("Snippet abbortion.")
    return
  end

  -- 发送 POST 请求
  local url = 'http://' .. config.ip_address .. ':3033/snippets/create'
  local body = vim.fn.json_encode({
    name = snippet_name,
    content = {
      {
        label = 'Fragment',
        value = selected_text,
        language = filetype
      }
    }
  })

  local logfile = io.open(log_file, "a")
  logfile:write(string.format("URL: %s\nBody: %s\n", url, body))
  logfile:write("name" .. snippet_name)
  logfile.close()

  Job:new({
    command = 'curl',
    args = {
      '-s', '-o', '/dev/null', '-w', '%{http_code}',
      '-X', 'POST', url,
      '-H', 'Content-Type: application/json',
      '-d', body
    },
    on_exit = function(j, return_val)
      local response_code = tonumber(j:result()[1])
      if response_code == 200 then
        print('Snippet created successfully!')
      else
        print('Failed to create snippet: ' .. (response_code or 'unknown error'))
      end
    end,
    on_stderr = function(_, data)
      print('Error: ' .. table.concat(data, '\n'))
    end,
  }):start()
end

-- create Neovim commands
vim.api.nvim_create_user_command('MasscodeCreate', M.create_snippet, {})
vim.api.nvim_create_user_command('MasscodeSearch', M.search_snippet, {})
vim.api.nvim_create_user_command('MasscodeShowIp', M.show_ip, {})
vim.api.nvim_create_user_command('MasscodeSetIp', function(opts)
  M.set_ip(opts.args, opts.bang)
end, { nargs = 1, bang = true })


function M.setup(user_options)
  config = vim.tbl_deep_extend("force", config, user_options)
  -- lvim.keys.visual_mode["<leader>ms"] = { "<CMD>MasscodeSearch<CR>" }
  -- lvim.keys.visual_mode["<leader>mc"] = { "<CMD>MasscodeCreate<CR>" }
  vim.api.nvim_set_keymap(
    "n",
    config.mappings.snippetsearch,
    '<cmd>lua require("masscode-nvim").search_snippet()<cr>',
    { silent = true }
  )
  vim.api.nvim_set_keymap(
    "v",
    config.mappings.snippetcreate,
    '<cmd>lua require("masscode-nvim").create_snippet()<cr>',
    { silent = true }
  )
end

return M
-- useage:
-- :MasscodeAssistantSearch
-- :SetMasscodeIP 192.168.1.1
-- :SetMasscodeIP! 192.168.1.1  (no print)
--
-- install:
-- -- add folowing code in your init file
-- -- could set ip of masscode especially
-- -- wsl use vim but masscode on windows
-- --
-- require("plugins.masscode")
-- local new_ip = '192.168.1.126'
-- -- set masscode ip when start
-- vim.api.nvim_create_autocmd('VimEnter', {
--   callback = function()
--     vim.cmd('SetMasscodeIP ' .. new_ip)
-- end,
-- })
