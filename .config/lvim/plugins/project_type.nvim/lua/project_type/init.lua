local M = {}

-- Initialize the default configuration (empty)
function M:init()
  if vim.tbl_isempty(vim.g.project_type_config or {}) then
    vim.g.project_type_config = {}
    vim.g.project_type = ""
  end
end

-- Register a new project type.
-- @param project_type An arbitrary string used to identify the project type.
-- @param detect_func A function used to determine if the project type is active. Should only return a boolean.
-- @param activate_func A function called when a project type is activated.
-- @param deactivate_func A function called when a project type is deactivated.
function M:register(ptype, detect_func, activate_func, deactivate_func)
  d = detect_func or function() return false end
  ac = activate_func or function() return end
  de = deactivate_func or function() return end

  local pconfig = vim.g.project_type_config or {}
  pconfig[ptype] = {}
  pconfig[ptype].detect = d
  -- pconfig[ptype] = {
  --   detect = detect_func,
  --   activate = activate_func,
  --   deactivate = deactivate_func,
  -- }
  vim.g.project_type_config = pconfig
end

-- Called from a DirChanged autocommand.
function M:refresh()
  -- Store the current project type in case we change it (so we can deactivate this one)
  local current_project_type = vim.g.project_type
  local new_project_type = vim.g.project_type

  for type, config in pairs(vim.g.project_type_config) do
    -- If the detect function returns true, then activate the config.
    -- First match wins.
    if config.detect() then
      new_project_type = type
      break
    end
  end

  if current_project_type ~= new_project_type then
    vim.g.project_type_config[current_project_type].deactivate()
    vim.g.project_type_config[new_project_type].activate()
    vim.g.project_type = new_project_type
    print("new project type activated:", vim.g.project_type)
  end

end

return M
