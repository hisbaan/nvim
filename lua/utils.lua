local M = {}

function M.file_exists(file)
  local f = io.open(file)
  if f ~= nil then
    io.close(f)
    return true
  end
  return false
end

return M
