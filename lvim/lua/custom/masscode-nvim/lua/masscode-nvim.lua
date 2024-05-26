local M = {}
local Job = require('plenary.job')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local conf = require('telescope.config').values

-- set IP masscode
-- ip ( use neovim in wsl and masscode is in windows)
local config = {
  ip_address = "localhsot",
  mappings = {
    snippetcreate = "<leader>mc",
    snippetsearch = "<leader>ms",
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

local function get_visual_selection()
  -- from https://www.reddit.com/r/neovim/comments/oo97pq/how_to_get_the_visual_selection_range/
  --
  -- Yank current visual selection into the 'v' register
  -- Note that this makes no effort to preserve this register
  vim.cmd('noau normal! "vy"')
  return vim.fn.getreg('v')
end

local function get_visual_selection_range()
  -- from https://github.com/nvim-telescope/telescope.nvim/pull/494
  -- return start_line,col end line_col
  local line_v, column_v = unpack(vim.fn.getpos("v"), 2, 3)
  local line_cur, column_cur = unpack(vim.api.nvim_win_get_cursor(0))
  column_cur = column_cur + 1
  -- backwards visual selection
  if line_v > line_cur or (line_v == line_cur and column_cur < column_v) then
    return line_cur, column_cur, line_v, column_v
  end
  return line_v, column_v, line_cur, column_cur
end

local function get_selection(bufnr)
  local start_line, _, end_line, _ = get_visual_selection_range()
  local lines = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, end_line, false)
  return table.concat(lines, '\n')
end

function M.create_snippet()
  local bufnr = vim.api.nvim_get_current_buf()
  local selected_text = get_selection(bufnr)

  -- local selected_text = get_visual_selection()

  if selected_text then
    if selected_text == "" then
      print("not text was selected")
      return
    end
  end

  -- get current file type
  local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
  local snippet_name = vim.fn.input('Snippet Name: ')
  if snippet_name == '' then
    print("Snippet abbortion.")
    return
  end

  -- use curl to post to masscode server
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
        print('Snippet ' .. name .. ' created successfully!')
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
  M.set_ip(opts.args)
end, { nargs = 1 })


function M.setup(user_options)
  config = vim.tbl_deep_extend("force", config, user_options)
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
-- install:
