local M = {}

M.toggle_comma_semicolon = function(auto_add_semi)
  auto_add_semi = auto_add_semi == true
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local cursor_row = cursor_pos[1]
  local cursor_col = cursor_pos[2]

  local lines = vim.api.nvim_buf_get_lines(0, cursor_row - 1, cursor_row, false)
  if not lines or #lines == 0 then
    return
  end
  local current_line = lines[1]

  if not current_line or current_line == "" then
    return
  end

  local last_char = current_line:sub(-1)

  if auto_add_semi and last_char ~= "," and last_char ~= ";" then
    local new_line = current_line .. ","
    vim.api.nvim_buf_set_lines(0, cursor_row - 1, cursor_row, false, { new_line })
    vim.api.nvim_win_set_cursor(0, { cursor_row, cursor_col })
    return
  end

  local replacements = {
    [","] = ";",
    [";"] = ",",
  }
  local replacement_char = replacements[last_char]

  if replacement_char then
    local new_line = current_line:sub(1, -2) .. replacement_char
    vim.api.nvim_buf_set_lines(0, cursor_row - 1, cursor_row, false, { new_line })
    vim.api.nvim_win_set_cursor(0, { cursor_row, cursor_col })
  end
end

return M
