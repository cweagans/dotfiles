local task_builtin = require('telescope._extensions.task_builtin')

return require('telescope').register_extension{
  exports = {
    list = task_builtin.list,
  },
}

