-- switch option forever helper function
---@diagnostic disable: undefined-field
---@diagnostic disable: need-check-nil
local Path = require("plenary.path")

local M = {
  db_file = "/switcher.json",
  is_inited = false,
  db_path = nil,
  database = nil,
}

function M.init()
  if M.is_inited then
    return
  end

  local path_inst = Path:new(vim.fn.stdpath("data") .. M.db_file)
  M.db_path = path_inst
  if not path_inst:exists() then
    path_inst:write("{}", "w")
  end
  M.is_inited = true
end

-- read data from file and set cache
---@return table
function M.read()
  M.init()
  if M.database == nil then
    M.database = vim.json.decode(M.db_path:read())
  end
  return M.database
end

-- save data to file
function M.save()
  M.init()
  M.db_path:write(vim.json.encode(M.read()), "w")
end

---@class Option
---@field allow_values table
---@filed value string|bool

-- create option and save to database
---@param key string
---@param allow_values table
---@param default_value string|boolean
function M.new_option(key, allow_values, default_value)
  local database = M.read()
  if not M.has_option(key) then
    ---@type Option
    local option = {
      allow_values = allow_values,
      value = default_value,
    }
    database[key] = option
    M.save()
  end
end

-- check option is exists by key
---@param key string
---@return boolean
function M.has_option(key)
  local db = M.read()
  return db[key] ~= nil
end

-- get option item by key
-- becareful: if need use this function, please use `has_option` check first
---@param key string
---@return Option
function M.get_option(key)
  return M.read()[key]
end

-- get option value by key
---@param key string
function M.get_value(key)
  if M.has_option(key) then
    return M.get_option(key).value
  end
end

-- input is option current value
---@param key string
---@return boolean
function M.is(key, input)
  return M.get_value(key) == input
end

-- create option, and switch option value
---@param key string
function M.switch(key)
  if not M.has_option(key) then
    print("[switcher]not found option " .. key)
    return
  end

  -- option is checked, so it must exist
  local option = M.get_option(key)
  print(string.format("[switcher]%s current value is %s", key, option.value))

  local prompt_option = {
    prompt = "switch " .. key .. " option to ?",
  }
  vim.ui.select(option.allow_values, prompt_option, function(choice)
    if choice == nil then
      -- cancled
      return
    end

    ---@diagnostic disable-next-line: inject-field
    option.value = choice
    print(string.format("[switcher]set %s option value to %s", key, choice))
    M.save()
  end)
end

---@class CrateOptionItemFileds
---@field option_name string
---@field allow_values table
---@field default_value string|boolean

---@param options CrateOptionItemFileds
function M.init_and_switch_option_value(options)
  local key = options.option_name
  if type(key) ~= "string" then
    print("[switcher]option_name must be a string")
    return
  end

  local allow_values = options.allow_values
  if type(allow_values) ~= "table" then
    print("[switcher]allow_values must be a table")
    return
  end

  local default_value = options.default_value or allow_values[1]
  M.new_option(key, allow_values, default_value)
  M.switch(key)
end

return M
