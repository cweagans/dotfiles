local telescope = require('telescope')

local actions = require('telescope.actions')
local actions_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local M = {}

-- If there is a Taskfile.yml in the current directory, list all of the tasks
-- that are available. If not, then don't do anything.
M.list = function(opts)
  opts = opts or {}
  opts.bin = opts.bin or 'task'

  local bin = vim.fn.expand(opts.bin)

  -- pickers.new(opts, {
  --   prompt_title = 'Tasks in current directory',
  --   finder = finders.new_oneshot_job(
  --     {bin, '--list'},
  --     opts
  --   ),
  --   previewer = false,
  --   sorter = conf.file_sorter(opts),
  --   attach_mappings = function(prompt_bufnr)
  --     return true
  --   end,
  -- }):find()

  pickers.new({
    prompt_title = "Tasks in current directory",
    finder = finders.new_oneshot_job({bin, '--list'}, opts),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = actions_state.get_selected_entry()
        if selection == nil then
          print "[telescope] nothing selected"
          return
        end

        actions.close(prompt_bufnr)
        print("You selected: ", selection.display)
      end)

      return true
    end
  }):find()

end

return M

